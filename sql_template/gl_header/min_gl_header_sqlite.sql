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
    SELECT 
        MIN((business_unit)) as business_unit,
        MIN((invoice_no_receipt_no)) as invoice_no_receipt_no,
        MIN((invoice_date__receipt_date)) AS invoice_date__receipt_date,
        -- MIN((episode_no)) AS episode_no, No episode_no in athena
        MIN((document_type)) AS document_type,
        MIN((payment_method)) AS payment_method,
        MIN((customer_code)) AS customer_code,
        MIN((customer_type)) AS customer_type,
        -- MIN((patient_code__hn)) AS patient_code__hn, No patient_code__hn in athena
        -- MIN((patient_name)) AS patient_name, No patient_name in athena
        MIN((nationality_code)) AS nationality_code,
        MIN((contact_id)) AS contact_id,
        MIN((contact_percent)) AS contact_percent,
        MIN((currency)) AS currency,
        MIN((total_invoice_by_payment_method)) AS total_invoice_by_payment_method,
        MIN((total_invoice_amount)) AS total_invoice_amount,
        MIN((special_discount_by_invoice)) AS special_discount_by_invoice,
        MIN((special_discount_account)) AS special_discount_account,
        MIN((deposit_reference_no)) AS deposit_reference_no
    FROM 
        '{TABLE}'
    WHERE 
        DATETIME(SUBSTR(file_name, 1, INSTR(file_name, '_') - 1)) BETWEEN 
        '{min_date}' AND 
        '{max_date}' 