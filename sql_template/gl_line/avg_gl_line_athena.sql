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
        CASE WHEN ISNUMERIC(business_unit) = 1 THEN AVG(business_unit) ELSE 0 END AS business_unit,
        CASE WHEN ISNUMERIC(invoice_no_receipt_no) = 1 THEN AVG(invoice_no_receipt_no) ELSE 0 END AS invoice_no_receipt_no,
        CASE WHEN ISNUMERIC(invoice_receipt_line_no) = 1 THEN AVG(invoice_receipt_line_no) ELSE 0 END AS invoice_receipt_line_no,
        CASE WHEN ISNUMERIC(billing_sub_group) = 1 THEN AVG(billing_sub_group) ELSE 0 END AS billing_sub_group,
        CASE WHEN ISNUMERIC(item_code) = 1 THEN AVG(item_code) ELSE 0 END AS item_code,
        CASE WHEN ISNUMERIC(item_description) = 1 THEN AVG(item_description) ELSE 0 END AS item_description,
        CASE WHEN ISNUMERIC(package_code) = 1 THEN AVG(package_code) ELSE 0 END AS package_code,
        CASE WHEN ISNUMERIC(revenue_account) = 1 THEN AVG(revenue_account) ELSE 0 END AS revenue_account,
        CASE WHEN ISNUMERIC(discount_line_account) = 1 THEN AVG(discount_line_account) ELSE 0 END AS discount_line_account,
        CASE WHEN ISNUMERIC(department_code) = 1 THEN AVG(department_code) ELSE 0 END AS department_code,
        CASE WHEN ISNUMERIC(first_location) = 1 THEN AVG(first_location) ELSE 0 END AS first_location,
        CASE WHEN ISNUMERIC(patient_location) = 1 THEN AVG(patient_location) ELSE 0 END AS patient_location,
        CASE WHEN ISNUMERIC(receiving_location) = 1 THEN AVG(receiving_location) ELSE 0 END AS receiving_location,
        CASE WHEN ISNUMERIC(revenue_subtype) = 1 THEN AVG(revenue_subtype) ELSE 0 END AS revenue_subtype,
        CASE WHEN ISNUMERIC(amount) = 1 THEN AVG(amount) ELSE 0 END AS amount,  
        CASE WHEN ISNUMERIC(discount_amount) = 1 THEN AVG(discount_amount) ELSE 0 END AS discount_amount, 
        CASE WHEN ISNUMERIC(doctor_group) = 1 THEN AVG(doctor_group) ELSE 0 END AS doctor_group,
        CASE WHEN ISNUMERIC(doctor_type) = 1 THEN AVG(doctor_type) ELSE 0 END AS doctor_type,
        CASE WHEN ISNUMERIC(doctor_code) = 1 THEN AVG(doctor_code) ELSE 0 END AS doctor_code,
        CASE WHEN ISNUMERIC(doctor_name) = 1 THEN AVG(doctor_name) ELSE 0 END AS doctor_name,
        CASE WHEN ISNUMERIC(quantity) = 1 THEN AVG(quantity) ELSE 0 END AS quantity,
        CASE WHEN ISNUMERIC(date) = 1 THEN AVG(date) ELSE 0 END AS date,
        --CASE WHEN ISNUMERIC(episode_number) = 1 THEN AVG(episode_number) ELSE 0 END AS episode_number,
        CASE WHEN ISNUMERIC(nationality) = 1 THEN AVG(nationality) ELSE 0 END AS nationality,
        CASE WHEN ISNUMERIC(order_item_id) = 1 THEN AVG(order_item_id) ELSE 0 END AS nationality,
        CASE WHEN ISNUMERIC(order_item_sub_id) = 1 THEN AVG(order_item_sub_id) ELSE 0 END AS order_item_sub_id
    FROM 
        gl_line
    WHERE 
        parse_datetime(_file_updated_date, 'yyyy-MM-dd''T''HH:mm:ss''Z') BETWEEN 
        TIMESTAMP '{min_date}' AND 
        TIMESTAMP '{max_date}' 