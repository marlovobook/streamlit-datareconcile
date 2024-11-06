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
    SELECT 
        ((order_item_id)) AS order_item_id, 
        ((order_item_sub_id)) AS order_item_sub_id,
        ((bill_doc_no)) AS bill_doc_no, 
        ((package_code)) AS package_code,
        ((bu)) as bu,
        -- ((en)) as en, -- no en in athena
        ((orderdate)) AS orderdate,
        ((billing_sub_group)) AS billing_sub_group,
        ((item_code)) AS item_code,
        ((description)) AS description,
        -- ((hn)) AS hn,  -- no hn in athena
        -- ((name)) AS name, -- no name in athena
        ((account_code)) AS account_code,
        ((discoun_account)) AS discoun_account,
        ((department)) AS department,
        ((first_loc)) AS first_loc,
        ((patient_loc)) AS patient_loc,
        ((rec_loc)) AS rec_loc,
        ((sub_type)) AS sub_type,
        ((nation)) AS nation,
        ((curr)) AS curr,
        ((amount_before)) AS amount_before,
        ((discount)) AS discount,
        ((bill_amount)) AS bill_amount,
        ((doctor_group)) AS doctor_group,
        ((doctor_type)) AS doctor_type,
        ((doctor_code)) AS doctor_code,
        ((doctor_name)) AS doctor_name,
        ((qty)) AS qty,
        ((episode_id)) AS episode_id,
        ((patient_id)) AS patient_id
    FROM 
        onward
    WHERE 
        parse_datetime(_file_updated_date, 'yyyy-MM-dd''T''HH:mm:ss''Z') BETWEEN 
        TIMESTAMP '{min_date}' AND 
        TIMESTAMP '{max_date}' 