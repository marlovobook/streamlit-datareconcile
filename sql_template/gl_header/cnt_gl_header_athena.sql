--gl_header_athena.sql 
/*
SELECT "_hoodie_commit_time", "_hoodie_commit_seqno", "_hoodie_record_key", 
"_hoodie_partition_path", "_hoodie_file_name", business_unit, 
invoice_no_receipt_no, invoice_date__receipt_date, document_type, 
payment_method, customer_code, customer_type, 
nationality_code, contact_id, contact_percent, currency, 
total_invoice_by_payment_method, total_invoice_amount,
special_discount_account, deposit_reference_no, episode_id, 
patient_id, "_file_date", "_file_updated_date", "_sync_year", 
"_sync_month", "_sync_day", special_discount_by_invoice, 
updated_at, site, added_year, added_month
FROM vtnlake_dev_curated_finance.gl_header;
*/
    SELECT 
        COUNT(distinct(business_unit)) as business_unit,
        COUNT(distinct(invoice_no_receipt_no)) as invoice_no_receipt_no,
        COUNT(distinct(invoice_date__receipt_date)) AS invoice_date__receipt_date,
        -- COUNT(distinct(episode_no)) AS episode_no,
        COUNT(distinct(document_type)) AS document_type,
        COUNT(distinct(payment_method)) AS payment_method,
        COUNT(distinct(customer_code)) AS customer_code,
        COUNT(distinct(customer_type)) AS customer_type,
        -- COUNT(distinct(patient_code__hn)) AS patient_code__hn,
        -- COUNT(distinct(patient_name)) AS patient_name,
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
        gl_header
    WHERE 
        parse_datetime(_file_updated_date, 'yyyy-MM-dd''T''HH:mm:ss''Z') BETWEEN 
        TIMESTAMP '{min_date}' AND 
        TIMESTAMP '{max_date}' 