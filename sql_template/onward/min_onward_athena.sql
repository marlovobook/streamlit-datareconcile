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
        MIN((bu)) as bu,
        -- MIN((en)) as en, -- no en in athena
        MIN((orderdate)) AS orderdate,
        MIN((billing_sub_group)) AS billing_sub_group,
        MIN((item_code)) AS item_code,
        MIN((description)) AS description,
        MIN((package_code)) AS package_code,
        -- MIN((hn)) AS hn,  -- no hn in athena
        -- MIN((name)) AS name, -- no name in athena
        MIN((account_code)) AS account_code,
        MIN((discoun_account)) AS discoun_account,
        MIN((department)) AS department,
        MIN((first_loc)) AS first_loc,
        MIN((patient_loc)) AS patient_loc,
        MIN((rec_loc)) AS rec_loc,
        MIN((sub_type)) AS sub_type,
        MIN((nation)) AS nation,
        MIN((curr)) AS curr,
        MIN((amount_before)) AS amount_before,
        MIN((discount)) AS discount,
        MIN((bill_amount)) AS bill_amount,
        MIN((doctor_group)) AS doctor_group,
        MIN((doctor_type)) AS doctor_type,
        MIN((doctor_code)) AS doctor_code,
        MIN((doctor_name)) AS doctor_name,
        MIN((qty)) AS qty
    FROM 
        onward
    WHERE 
        parse_datetime(_file_updated_date, 'yyyy-MM-dd''T''HH:mm:ss''Z') BETWEEN 
        TIMESTAMP '{min_date}' AND 
        TIMESTAMP '{max_date}' 