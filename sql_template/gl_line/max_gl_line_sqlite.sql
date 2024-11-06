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
        MAX((business_unit)) as business_unit,
        MAX((invoice_no_receipt_no)) as invoice_no_receipt_no,
        MAX((invoice_receipt_line_no)) AS invoice_receipt_line_no,
        MAX((billing_sub_group)) AS billing_sub_group,
        MAX((item_code)) AS item_code,
        MAX((item_description)) AS item_description,
        MAX((package_code)) AS package_code,
        MAX((revenue_account)) AS revenue_account,
        MAX((discount_line_account)) AS discount_line_account,
        MAX((department_code)) AS department_code,
        MAX((first_location)) AS first_location,
        MAX((patient_location)) AS patient_location,
        MAX((receiving_location)) AS receiving_location,
        MAX((revenue_subtype)) AS revenue_subtype,
        MAX((amount)) AS amount,
        MAX((discount_amount)) AS discount_amount,
        MAX((doctor_group)) AS doctor_group,
        MAX((doctor_type)) AS doctor_type,
        MAX((doctor_code)) AS doctor_code,
        MAX((doctor_name)) AS doctor_name,
        MAX((quantity)) AS quantity,
        MAX((date)) AS date,
        --MAX((episode_number)) AS episode_number, -- don't have this column in aws
        MAX((nationality)) AS nationality
        --MAX((order_item_id)) AS order_item_id, -- don't have in sqlite
        --MAX((order_item_sub_id)) AS order_item_sub_id  -- don't have in sqlite
    FROM 
       '{TABLE}'
    WHERE 
        DATETIME(SUBSTR(file_name, 1, INSTR(file_name, '_') - 1)) BETWEEN 
        '{min_date}' AND 
        '{max_date}' 