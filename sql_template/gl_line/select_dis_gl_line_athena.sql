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
revenue_account, department_code, updated_at, site, added_year, added_month
FROM vtnlake_dev_curated_finance.gl_line;
*/
    SELECT DISTINCT
        COALESCE(NULLIF(invoice_no_receipt_no, ''), '0') AS invoice_no_receipt_no,
        COALESCE(NULLIF(invoice_receipt_line_no, ''), '0') AS invoice_receipt_line_no,
        COALESCE(NULLIF(order_item_id, ''), '0') AS order_item_id,
        COALESCE(NULLIF(order_item_sub_id, ''), '0') AS order_item_sub_id
        -- COALESCE((business_unit), '0') as business_unit,
        -- COALESCE((billing_sub_group), '0') AS billing_sub_group,
        -- COALESCE((item_code), '0') AS item_code,
        -- COALESCE((item_description), '0') AS item_description,
        -- COALESCE((package_code), '0') AS package_code,
        -- COALESCE((revenue_account), '0') AS revenue_account,
        -- COALESCE((discount_line_account), '0') AS discount_line_account,
        -- COALESCE((department_code), '0') AS department_code,
        -- COALESCE((first_location), '0') AS first_location,
        -- COALESCE((patient_location), '0') AS patient_location,
        -- COALESCE((receiving_location), '0') AS receiving_location,
        -- COALESCE((revenue_subtype), '0') AS revenue_subtype,
        -- COALESCE((amount), '0') AS amount,
        -- COALESCE((discount_amount), '0') AS discount_amount,
        -- COALESCE((doctor_group), '0') AS doctor_group,
        -- COALESCE((doctor_type), '0') AS doctor_type,
        -- COALESCE((doctor_code), '0') AS doctor_code,
        -- COALESCE((doctor_name), '0') AS doctor_name,
        -- COALESCE((quantity), '0') AS quantity,
        -- COALESCE((date), '0') AS date,
        -- --COALESCE((episode_number), '0') AS episode_number, -- don't have this column in aws
        -- COALESCE((nationality), '0') AS nationality
        FROM 
            gl_line
        WHERE 
            parse_datetime(_file_updated_date, 'yyyy-MM-dd''T''HH:mm:ss''Z') BETWEEN 
            TIMESTAMP '{min_date}' AND 
            TIMESTAMP '{max_date}' 