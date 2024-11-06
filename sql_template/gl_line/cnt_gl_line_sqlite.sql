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
        --COUNT(distinct(episode_number)) AS episode_number, -- don't have this column in aws
        COUNT(distinct(nationality)) AS nationality
        --COUNT(distinct(order_item_id)) AS order_item_id, -- don't have in sqlite
        --COUNT(distinct(order_item_sub_id)) AS order_item_sub_id  -- don't have in sqlite
    FROM 
       '{TABLE}'
    WHERE 
        DATETIME(SUBSTR(file_name, 1, INSTR(file_name, '_') - 1)) BETWEEN 
        '{min_date}' AND 
        '{max_date}' 