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
        AVG((business_unit)) as business_unit,
        AVG((invoice_no_receipt_no)) as invoice_no_receipt_no,
        AVG((invoice_receipt_line_no)) AS invoice_receipt_line_no,
        AVG((billing_sub_group)) AS billing_sub_group,
        AVG((item_code)) AS item_code,
        AVG((item_description)) AS item_description,
        AVG((package_code)) AS package_code,
        AVG((revenue_account)) AS revenue_account,
        AVG((discount_line_account)) AS discount_line_account,
        AVG((department_code)) AS department_code,
        AVG((first_location)) AS first_location,
        AVG((patient_location)) AS patient_location,
        AVG((receiving_location)) AS receiving_location,
        AVG((revenue_subtype)) AS revenue_subtype,
        AVG((amount)) AS amount,
        AVG((discount_amount)) AS discount_amount,
        AVG((doctor_group)) AS doctor_group,
        AVG((doctor_type)) AS doctor_type,
        AVG((doctor_code)) AS doctor_code,
        AVG((doctor_name)) AS doctor_name,
        AVG((quantity)) AS quantity,
        AVG((date)) AS date,
        --AVG((episode_number)) AS episode_number, -- don't have this column in aws
        AVG((nationality)) AS nationality
        --AVG((order_item_id)) AS order_item_id, -- don't have in sqlite
        --AVG((order_item_sub_id)) AS order_item_sub_id  -- don't have in sqlite
    FROM 
       '{TABLE}'
    WHERE 
        DATETIME(SUBSTR(file_name, 1, INSTR(file_name, '_') - 1)) BETWEEN 
        '{min_date}' AND 
        '{max_date}' 