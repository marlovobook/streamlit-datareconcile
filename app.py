"""
# My first app
Here's our first attempt at using data to create a table:
"""


import streamlit as st
import pandas as pd
from athena_to_pd import athena_query
import sqlite3
#By Book
from pathlib import Path
import os
import awswrangler as wr 
import boto3
from datetime import datetime


pwd = os.getcwd()

PROFILE = "vej-book"
DATABASE = "vtnlake_dev_curated_finance" 
SQLITE_PATH = rf'E:\Work\TradeSquare\SQlite Test\vtnlake_onedrive.db'

date_filter = athena_query(PROFILE, DATABASE,"""
    select 
        min(date_format(parse_datetime(_file_updated_date,'yyyy-MM-dd''T''HH:mm:ss''Z'),'%Y-%m-%d %H:%i:%s')) AS min_date,
        max(date_format(parse_datetime(_file_updated_date,'yyyy-MM-dd''T''HH:mm:ss''Z'),'%Y-%m-%d %H:%i:%s')) AS max_date
        
    from onward
""")

# df_date_filter = pd.DataFrame(date_filter, columns = date_filter.columns)
# min_date = df_date_filter.iloc[0, 0]
# max_date = df_date_filter.iloc[0, 1]

min_date = '2024-11-04 09:09:05'
max_date = '2024-11-04 09:09:05'

# Read the SQL template file
with open(rf"{pwd}/sql_template/onward/select_dis_onward_sqlite.sql", "r") as file:
    query_template = file.read()

# Substitute placeholders with actual values
TABLE = "onward_full"
SQLITE_QUERY = query_template.format(
    TABLE=TABLE,
    min_date=min_date,
    max_date=max_date
)    
# Execute the query
conn = sqlite3.connect(SQLITE_PATH)
df_select_sqlite = pd.read_sql_query(SQLITE_QUERY, conn).add_suffix('_sqlite')
conn.close()
select_onward_sqlite = df_select_sqlite

#sqlite
select_onward_sqlite.sort_values(by=['order_item_id_sqlite', 'order_item_sub_id_sqlite', 'bill_doc_no_sqlite', 'package_code_sqlite'], inplace=True)
select_onward_sqlite.reset_index(drop=True, inplace=True)



select_onward_sqlite

