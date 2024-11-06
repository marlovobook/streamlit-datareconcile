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
        COUNT(distinct(bu)) as bu,
        -- COUNT(distinct(en)) as en, -- no en in athena
        COUNT(distinct(orderdate)) AS orderdate,
        COUNT(distinct(billing_sub_group)) AS billing_sub_group,
        COUNT(distinct(item_code)) AS item_code,
        COUNT(distinct(description)) AS description,
        COUNT(distinct(package_code)) AS package_code,
        -- COUNT(distinct(hn)) AS hn, -- no hn in athena
        -- COUNT(distinct(name)) AS name, -- no name in athena
        COUNT(distinct(account_code)) AS account_code,
        COUNT(distinct(discoun_account)) AS discoun_account,
        COUNT(distinct(department)) AS department,
        COUNT(distinct(first_loc)) AS first_loc,
        COUNT(distinct(patient_loc)) AS patient_loc,
        COUNT(distinct(rec_loc)) AS rec_loc,
        COUNT(distinct(sub_type)) AS sub_type,
        COUNT(distinct(nation)) AS nation,
        COUNT(distinct(curr)) AS curr,
        COUNT(distinct(amount_before)) AS amount_before,
        COUNT(distinct(discount)) AS discount,
        COUNT(distinct(bill_amount)) AS bill_amount,
        COUNT(distinct(doctor_group)) AS doctor_group,
        COUNT(distinct(doctor_type)) AS doctor_type,
        COUNT(distinct(doctor_code)) AS doctor_code,
        COUNT(distinct(doctor_name)) AS doctor_name,
        COUNT(distinct(qty)) AS qty
    FROM 
        onward
    WHERE 
        parse_datetime(_file_updated_date, 'yyyy-MM-dd''T''HH:mm:ss''Z') BETWEEN 
        TIMESTAMP '{min_date}' AND 
        TIMESTAMP '{max_date}' 