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
SELECT DISTINCT
        COALESCE(CAST(invoice_no_receipt_no AS TEXT), '0') AS invoice_no_receipt_no,
        COALESCE(CAST(invoice_receipt_line_no AS TEXT), '0') AS invoice_receipt_line_no,
        COALESCE(CAST(order_item_id AS TEXT), '0') AS order_item_id,
        COALESCE(CAST(order_item_sub_id AS TEXT), '0') AS order_item_sub_id
        -- COALESCE(CAST(business_unit AS TEXT), '0') as business_unit,
        -- COALESCE(CAST(billing_sub_group AS TEXT), '0') AS billing_sub_group,
        -- COALESCE(CAST(item_code AS TEXT), '0') AS item_code,
        -- COALESCE(CAST(item_description AS TEXT), '0') AS item_description,
        -- COALESCE(CAST(package_code AS TEXT), '0') AS package_code,
        -- COALESCE(CAST(revenue_account AS TEXT), '0') AS revenue_account,
        -- COALESCE(CAST(discount_line_account AS TEXT), '0') AS discount_line_account,
        -- COALESCE(CAST(department_code AS TEXT), '0') AS department_code,
        -- COALESCE(CAST(first_location AS TEXT), '0') AS first_location,
        -- COALESCE(CAST(patient_location AS TEXT), '0') AS patient_location,
        -- COALESCE(CAST(receiving_location AS TEXT), '0') AS receiving_location,
        -- COALESCE(CAST(revenue_subtype AS TEXT), '0') AS revenue_subtype,
        -- COALESCE(CAST(amount AS TEXT), '0') AS amount,
        -- COALESCE(CAST(discount_amount AS TEXT), '0') AS discount_amount,
        -- COALESCE(CAST(doctor_group AS TEXT), '0') AS doctor_group,
        -- COALESCE(CAST(doctor_type AS TEXT), '0') AS doctor_type,
        -- COALESCE(CAST(doctor_code AS TEXT), '0') AS doctor_code,
        -- COALESCE(CAST(doctor_name AS TEXT), '0') AS doctor_name,
        -- COALESCE(CAST(quantity AS TEXT), '0') AS quantity,
        -- COALESCE(CAST(date AS TEXT), '0') AS date,
        -- --COALESCE(CAST(episode_number AS TEXT), '0') AS episode_number, -- don't have this column in aws
        -- COALESCE(CAST(nationality AS TEXT), '0') AS nationality
    FROM 
       '{TABLE}'
    WHERE 
        DATETIME(SUBSTR(file_name, 1, INSTR(file_name, '_') - 1)) BETWEEN 
        '{min_date}' AND 
        '{max_date}' 