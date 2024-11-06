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
        COUNT(distinct(business_unit)) as business_unit,
        COUNT(distinct(invoice_no_receipt_no)) as invoice_no_receipt_no,
        COUNT(distinct(invoice_receipt_line_no)) AS invoice_receipt_line_no,
        COUNT(distinct(billing_sub_group)) AS billing_sub_group,
        COUNT(distinct(item_code)) AS item_code,
        COUNT(distinct(item_description)) AS item_description,
        COUNT(distinct(package_code)) AS package_code,
        COUNT(distinct(revenue_account)) AS revenue_account,
        COUNT(distinct(discount_line_account)) AS discount_line_account,
        COUNT(distinct(department_code)) AS department_code,
        COUNT(distinct(first_location)) AS first_location,
        COUNT(distinct(patient_location)) AS patient_location,
        COUNT(distinct(receiving_location)) AS receiving_location,
        COUNT(distinct(revenue_subtype)) AS revenue_subtype,
        COUNT(distinct(amount)) AS amount,
        COUNT(distinct(discount_amount)) AS discount_amount,
        COUNT(distinct(doctor_group)) AS doctor_group,
        COUNT(distinct(doctor_type)) AS doctor_type,
        COUNT(distinct(doctor_code)) AS doctor_code,
        COUNT(distinct(doctor_name)) AS doctor_name,
        COUNT(distinct(quantity)) AS quantity,
        COUNT(distinct(date)) AS date,
        --COUNT(distinct(episode_number)) AS episode_number,
        COUNT(distinct(nationality)) AS nationality,
        COUNT(distinct(order_item_id)) AS order_item_id,
        COUNT(distinct(order_item_sub_id)) AS order_item_sub_id 
        FROM 
            gl_line
        WHERE 
            parse_datetime(_file_updated_date, 'yyyy-MM-dd''T''HH:mm:ss''Z') BETWEEN 
            TIMESTAMP '{min_date}' AND 
            TIMESTAMP '{max_date}' 