--gl_line_sqiite.sql
/*
SELECT business_unit, invoice_no_receipt_no, 
invoice_receipt_line_no, billing_sub_group, 
item_code, item_description, package_code, 
revenue_account, discount_line_account, 
department_code, first_location, patient_location, 
receiving_location, revenue_subtype, 
amount, discount_amount, doctor_group,
doctor_type, doctor_code, 
doctor_name, quantity, date, 
episode_number, nationality, file_name
FROM gl_line_full;
*/
SELECT 
        MIN((business_unit)) as business_unit,
        MIN((invoice_no_receipt_no)) as invoice_no_receipt_no,
        MIN((invoice_receipt_line_no)) AS invoice_receipt_line_no,
        MIN((billing_sub_group)) AS billing_sub_group,
        MIN((item_code)) AS item_code,
        MIN((item_description)) AS item_description,
        MIN((package_code)) AS package_code,
        MIN((revenue_account)) AS revenue_account,
        MIN((discount_line_account)) AS discount_line_account,
        MIN((department_code)) AS department_code,
        MIN((first_location)) AS first_location,
        MIN((patient_location)) AS patient_location,
        MIN((receiving_location)) AS receiving_location,
        MIN((revenue_subtype)) AS revenue_subtype,
        MIN((amount)) AS amount,
        MIN((discount_amount)) AS discount_amount,
        MIN((doctor_group)) AS doctor_group,
        MIN((doctor_type)) AS doctor_type,
        MIN((doctor_code)) AS doctor_code,
        MIN((doctor_name)) AS doctor_name,
        MIN((quantity)) AS quantity,
        MIN((date)) AS date,
        --MIN((episode_number)) AS episode_number, -- don't have this column in aws
        MIN((nationality)) AS nationality
        --MIN((order_item_id)) AS order_item_id, -- don't have in sqlite
        --MIN((order_item_sub_id)) AS order_item_sub_id  -- don't have in sqlite
    FROM 
       '{TABLE}'
    WHERE 
        DATETIME(SUBSTR(file_name, 1, INSTR(file_name, '_') - 1)) BETWEEN 
        '{min_date}' AND 
        '{max_date}' 