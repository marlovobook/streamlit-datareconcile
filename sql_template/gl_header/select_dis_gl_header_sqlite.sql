--gl_header_sqiite.sql
/*
SELECT business_unit, invoice_no_receipt_no, invoice_date__receipt_date, 
episode_no, document_type, payment_method, 
customer_code, customer_type, patient_code__hn, 
patient_name, nationality_code, contact_id, 
contact_percent, currency, total_invoice_by_payment_method, 
total_invoice_amount, special_discount_by_invoice, 
special_discount_account, deposit_reference_no, 
file_name
FROM headers_full;
*/
/*
SELECT business_unit, invoice_no_receipt_no, invoice_date__receipt_date, 
episode_no, document_type, payment_method, 
customer_code, customer_type, patient_code__hn, 
patient_name, nationality_code, contact_id, 
contact_percent, currency, total_invoice_by_payment_method, 
total_invoice_amount, special_discount_by_invoice, 
special_discount_account, deposit_reference_no, 
episode_id, patient_id, file_name
FROM headers_full;
*/
    SELECT DISTINCT 
        COALESCE(CAST(invoice_no_receipt_no AS TEXT), '0') as invoice_no_receipt_no,
        COALESCE(CAST(payment_method AS TEXT), '0') AS payment_method
        -- CAST(business_unit AS TEXT) as business_unit,
        -- CAST(invoice_date__receipt_date AS TEXT) AS invoice_date__receipt_date,
        -- -- CAST(episode_no AS TEXT) AS episode_no, --No episode_no in athena
        -- CAST(document_type AS TEXT) AS document_type,
        -- CAST(customer_code AS TEXT) AS customer_code,
        -- CAST(customer_type AS TEXT) AS customer_type,
        -- -- CAST(patient_code__hn AS TEXT) AS patient_code__hn, No patient_code__hn in athena
        -- -- CAST(patient_name AS TEXT) AS patient_name, No patient_name in athena
        -- CAST(nationality_code AS TEXT) AS nationality_code,
        -- CAST(contact_id AS TEXT) AS contact_id,
        -- CAST(contact_percent AS TEXT) AS contact_percent,
        -- CAST(currency AS TEXT) AS currency,
        -- CAST(total_invoice_by_payment_method AS TEXT) AS total_invoice_by_payment_method,
        -- CAST(total_invoice_amount AS TEXT) AS total_invoice_amount,
        -- CAST(special_discount_by_invoice AS TEXT) AS special_discount_by_invoice,
        -- CAST(special_discount_account AS TEXT) AS special_discount_account,
        -- CAST(deposit_reference_no AS TEXT) AS deposit_reference_no
        -- CAST(patient_id AS TEXT) AS patient_id
    FROM 
        '{TABLE}'
    WHERE 
        DATETIME(SUBSTR(file_name, 1, INSTR(file_name, '_') - 1)) BETWEEN 
        '{min_date}' AND 
        '{max_date}' 