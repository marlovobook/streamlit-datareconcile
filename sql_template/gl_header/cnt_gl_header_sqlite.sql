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
        COUNT(distinct(business_unit)) as business_unit,
        COUNT(distinct(invoice_no_receipt_no)) as invoice_no_receipt_no,
        COUNT(distinct(invoice_date__receipt_date)) AS invoice_date__receipt_date,
        -- COUNT(distinct(episode_no)) AS episode_no, No episode_no in athena
        COUNT(distinct(document_type)) AS document_type,
        COUNT(distinct(payment_method)) AS payment_method,
        COUNT(distinct(customer_code)) AS customer_code,
        COUNT(distinct(customer_type)) AS customer_type,
        -- COUNT(distinct(patient_code__hn)) AS patient_code__hn, No patient_code__hn in athena
        -- COUNT(distinct(patient_name)) AS patient_name, No patient_name in athena
        COUNT(distinct(nationality_code)) AS nationality_code,
        COUNT(distinct(contact_id)) AS contact_id,
        COUNT(distinct(contact_percent)) AS contact_percent,
        COUNT(distinct(currency)) AS currency,
        COUNT(distinct(total_invoice_by_payment_method)) AS total_invoice_by_payment_method,
        COUNT(distinct(total_invoice_amount)) AS total_invoice_amount,
        COUNT(distinct(special_discount_by_invoice)) AS special_discount_by_invoice,
        COUNT(distinct(special_discount_account)) AS special_discount_account,
        COUNT(distinct(deposit_reference_no)) AS deposit_reference_no
    FROM 
        '{TABLE}'
    WHERE 
        DATETIME(SUBSTR(file_name, 1, INSTR(file_name, '_') - 1)) BETWEEN 
        '{min_date}' AND 
        '{max_date}' 