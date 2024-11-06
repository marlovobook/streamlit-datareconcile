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
    SELECT 
        MAX((bu)) as bu,
        -- MAX((en)) as en, -- no en in athena
        MAX((orderdate)) AS orderdate,
        MAX((billing_sub_group)) AS billing_sub_group,
        MAX((item_code)) AS item_code,
        MAX((description)) AS description,
        MAX((package_code)) AS package_code,
        -- MAX((hn)) AS hn, -- no hn in athena
        -- MAX((name)) AS name, -- no name in athena
        MAX((account_code)) AS account_code,
        MAX((discoun_account)) AS discoun_account,
        MAX((department)) AS department,
        MAX((first_loc)) AS first_loc,
        MAX((patient_loc)) AS patient_loc,
        MAX((rec_loc)) AS rec_loc,
        MAX((sub_type)) AS sub_type,
        MAX((nation)) AS nation,
        MAX((curr)) AS curr,
        MAX((amount_before)) AS amount_before,
        MAX((discount)) AS discount,
        MAX((bill_amount)) AS bill_amount,
        MAX((doctor_group)) AS doctor_group,
        MAX((doctor_type)) AS doctor_type,
        MAX((doctor_code)) AS doctor_code,
        MAX((doctor_name)) AS doctor_name,
        MAX((qty)) AS qty
    FROM 
        onward
    WHERE 
        parse_datetime(_file_updated_date, 'yyyy-MM-dd''T''HH:mm:ss''Z') BETWEEN 
        TIMESTAMP '{min_date}' AND 
        TIMESTAMP '{max_date}' 