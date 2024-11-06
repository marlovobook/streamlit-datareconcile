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

# date_filter = athena_query(PROFILE, DATABASE,"""
#     select 
#         min(date_format(parse_datetime(_file_updated_date,'yyyy-MM-dd''T''HH:mm:ss''Z'),'%Y-%m-%d %H:%i:%s')) AS min_date,
#         max(date_format(parse_datetime(_file_updated_date,'yyyy-MM-dd''T''HH:mm:ss''Z'),'%Y-%m-%d %H:%i:%s')) AS max_date
        
#     from onward
# """)

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


# Descibe Statics
stat_onward_sqlite =  pd.DataFrame(select_onward_sqlite.describe(include='all'))


# Convert all string values to hashed integers in a copy of the DataFrame
hashed_df = select_onward_sqlite.apply(lambda col: col.map(lambda x: hash(x) if isinstance(x, str) else x))


# Calculate the sum of each column and convert to a DataFrame row
sum_onward_sqlite = hashed_df.sum().to_frame().T
sum_onward_sqlite.index = ["sum_hashed"] 


avg_onward_sqlite = hashed_df.mean().to_frame().T
avg_onward_sqlite.index = ["avg_hashed"]


min_onward_sqlite = hashed_df.min().to_frame().T
min_onward_sqlite.index = ["min_hashed"]


max_onward_sqlite = hashed_df.max().to_frame().T
max_onward_sqlite.index = ["max_hashed"]

# Concatenate the statistics DataFrames
stat_select_onward_sqlite = pd.concat([stat_onward_sqlite, sum_onward_sqlite, avg_onward_sqlite, min_onward_sqlite, max_onward_sqlite], axis=0)


def configure_page() -> None:
    st.set_page_config(
        page_title="TradeSquare",
        page_icon=":moneybag:",
        layout="wide",
        initial_sidebar_state="expanded",
    )

def configure_overview() -> None:
    st.title("TradeSquare")
    st.markdown(
        """
        This app is for TradeSquare
        """
    )  
def configure_sidebar() -> None:
    seed = st.sidebar.text_input("Seed", "42")
    width = st.sidebar.slider("Width", 100, 1000, 300)
    height = st.sidebar.slider("Height", 100, 1000, 300)
    num_rooms = st.sidebar.slider("Number of rooms", 1, 10, 3)
    room_size_range = st.sidebar.slider("Room size range", 10, 100, (25, 75))
    return seed, width, height, num_rooms, room_size_range




# def configure_avaliable_algo_heuristics() -> None:
#     st.header("Avaliable Algo Heuristics")
#     st.write(select_onward_sqlite) 

def configure_data() -> None:
    col1, col2, col3 = st.columns(3)
    with col1:
        st.header("Data")
        st.write(select_onward_sqlite)
    with col2:
        st.header("Statistics")
        st.write(stat_select_onward_sqlite)
    with col3:
        st.header("Data")
        st.table(stat_select_onward_sqlite)





def main() -> None:
    configure_page()
    configure_overview()
    configure_data()
    configure_sidebar()

if __name__ == "__main__":
    main()