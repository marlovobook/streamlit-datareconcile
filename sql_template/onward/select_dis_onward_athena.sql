--gl_onward_athena.sql 
/*
SELECT "_hoodie_commit_time", "_hoodie_commit_seqno", "_hoodie_record_key", 
"_hoodie_partition_path", "_hoodie_file_name", bu, orderdate, 
item_code, description, package_code, first_loc, 
patient_loc, rec_loc, sub_type, nation, curr, 
amount_before, discount, bill_amount, doctor_group, 
doctor_type, doctor_code, doctor_name, 
qty, order_item_id, order_item_sub_id,
bill_doc_no, episode_id, patient_id, "_file_date", 
"_file_updated_date", "_sync_year", "_sync_month", 
"_sync_day", billing_sub_group, account_code, discoun_account,
department, updated_at, site, added_year, added_month
FROM vtnlake_dev_curated_finance.onward;
*/

/*
SELECT "_hoodie_commit_time", "_hoodie_commit_seqno", "_hoodie_record_key", 
"_hoodie_partition_path", "_hoodie_file_name", bu, orderdate,
item_code, description, package_code, first_loc,
patient_loc, rec_loc, sub_type, nation, curr, 
amount_before, discount, bill_amount, doctor_group, 
doctor_type, doctor_code, doctor_name, 
qty, order_item_id, order_item_sub_id, 
bill_doc_no, episode_id, patient_id, "_file_date", 
"_file_updated_date", "_sync_year", "_sync_month", 
"_sync_day", billing_sub_group, account_code, discoun_account, 
department, updated_at, site, added_year, added_month
FROM vtnlake_dev_curated_finance.onward;
*/
    SELECT DISTINCT
        ((order_item_id)) AS order_item_id, 
        ((order_item_sub_id)) AS order_item_sub_id,
        ((bill_doc_no)) AS bill_doc_no, 
        (COALESCE(package_code, '0')) AS package_code
    FROM 
        onward
    WHERE 
        parse_datetime(_file_updated_date, 'yyyy-MM-dd''T''HH:mm:ss''Z') BETWEEN 
        TIMESTAMP '{min_date}' AND 
        TIMESTAMP '{max_date}'; 