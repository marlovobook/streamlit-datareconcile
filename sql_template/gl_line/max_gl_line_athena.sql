--gl_line_athena.sql 


/*
SELECT "_hoodie_commit_time", "_hoodie_commit_seqno", "_hoodie_record_key", 
"_hoodie_partition_path", "_hoodie_file_name", business_unit, 
invoice_no_receipt_no, item_code, item_description, package_code, 
discount_line_account, first_location, patient_location, 
receiving_location, revenue_subtype, amount, discount_amount, 
doctor_group, doctor_type, doctor_code, doctor_name, quantity, 
"date", nationality, order_item_id, order_item_sub_id, episode_id,
 patient_id, "_file_date", "_file_updated_date", 
 "_sync_year", "_sync_month", "_sync_day", 
 invoice_receipt_line_no, billing_sub_group, 
 revenue_account, department_code, updated_at, 
 site, added_year, added_month
FROM vtnlake_dev_curated_finance.gl_line;

*/
    SELECT 
        MAX((business_unit)) as business_unit,
        MAX((invoice_no_receipt_no)) as invoice_no_receipt_no,
        MAX((invoice_receipt_line_no)) AS invoice_receipt_line_no,
        MAX((billing_sub_group)) AS billing_sub_group,
        MAX((item_code)) AS item_code,
        MAX((item_description)) AS item_description,
        MAX((package_code)) AS package_code,
        MAX((revenue_account)) AS revenue_account,
        MAX((discount_line_account)) AS discount_line_account,
        MAX((department_code)) AS department_code,
        MAX((first_location)) AS first_location,
        MAX((patient_location)) AS patient_location,
        MAX((receiving_location)) AS receiving_location,
        MAX((revenue_subtype)) AS revenue_subtype,
        MAX((amount)) AS amount,
        MAX((discount_amount)) AS discount_amount,
        MAX((doctor_group)) AS doctor_group,
        MAX((doctor_type)) AS doctor_type,
        MAX((doctor_code)) AS doctor_code,
        MAX((doctor_name)) AS doctor_name,
        MAX((quantity)) AS quantity,
        MAX((date)) AS date,
        --MAX((episode_number)) AS episode_number,
        MAX((nationality)) AS nationality,
        MAX((order_item_id)) AS order_item_id,
        MAX((order_item_sub_id)) AS order_item_sub_id  
        FROM 
            gl_line
        WHERE 
            parse_datetime(_file_updated_date, 'yyyy-MM-dd''T''HH:mm:ss''Z') BETWEEN 
            TIMESTAMP '{min_date}' AND 
            TIMESTAMP '{max_date}' 