import boto3
import time
import pandas as pd

def athena_query(profile_name, database, query):
    """
    Execute a query in Amazon Athena and return the result as a DataFrame.

    Parameters:
        profile_name (str): AWS profile name
        database (str): The name of the Athena database
        query (str): The SQL query to execute

    Returns:
        pd.DataFrame: Query results as a DataFrame
    """
    boto3_session = boto3.session.Session(profile_name=profile_name, region_name='ap-southeast-1')
    # Initialize the Athena client
    athena_client = boto3_session.client('athena')
    # Start query execution
    response = athena_client.start_query_execution(
        QueryString=query,
        QueryExecutionContext={'Database': database}
    )
    
    # Get the Query Execution ID
    query_execution_id = response['QueryExecutionId']
    
    # Wait for the query to complete
    while True:
        query_status = athena_client.get_query_execution(QueryExecutionId=query_execution_id)
        status = query_status['QueryExecution']['Status']['State']
        
        if status in ['SUCCEEDED', 'FAILED', 'CANCELLED']:
            break
        time.sleep(1)  # Wait before checking again
    
    # Check if the query succeeded
    if status == 'SUCCEEDED':
        # Retrieve the results
        result = athena_client.get_query_results(QueryExecutionId=query_execution_id)
        
        # Initialize the DataFrame
        rows = []
        column_info = result['ResultSet']['ResultSetMetadata']['ColumnInfo']
        columns = [col['Name'] for col in column_info]
        
        # Process the first batch of results
        rows.extend([
            [datum.get('VarCharValue', None) for datum in row['Data']] for row in result['ResultSet']['Rows'][1:]
        ])
        
        # Paginate if there are more results
        while 'NextToken' in result:
            next_result = athena_client.get_query_results(
                QueryExecutionId=query_execution_id,
                NextToken=result['NextToken']
            )
            
            # Ensure we are properly processing each page
            rows.extend([
                [datum.get('VarCharValue', None) for datum in row['Data']] for row in next_result['ResultSet']['Rows'][1:]
            ])
            
            # Update the result with the next page of rows
            result = next_result
        
        # Create a DataFrame from the collected rows
        df = pd.DataFrame(rows, columns=columns)
        return df
    else:
        print(f"Query failed with status: {status}")
        return None
