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
        MAX((business_unit)) as business_unit,
        MAX((invoice_no_receipt_no)) as invoice_no_receipt_no,
        MAX((invoice_date__receipt_date)) AS invoice_date__receipt_date,
        -- MAX((episode_no)) AS episode_no, No episode_no in athena
        MAX((document_type)) AS document_type,
        MAX((payment_method)) AS payment_method,
        MAX((customer_code)) AS customer_code,
        MAX((customer_type)) AS customer_type,
        -- MAX((patient_code__hn)) AS patient_code__hn, No patient_code__hn in athena
        -- MAX((patient_name)) AS patient_name, No patient_name in athena
        MAX((nationality_code)) AS nationality_code,
        MAX((contact_id)) AS contact_id,
        MAX((contact_percent)) AS contact_percent,
        MAX((currency)) AS currency,
        MAX((total_invoice_by_payment_method)) AS total_invoice_by_payment_method,
        MAX((total_invoice_amount)) AS total_invoice_amount,
        MAX((special_discount_by_invoice)) AS special_discount_by_invoice,
        MAX((special_discount_account)) AS special_discount_account,
        MAX((deposit_reference_no)) AS deposit_reference_no
    FROM 
        gl_header
     WHERE 
        parse_datetime(_file_updated_date, 'yyyy-MM-dd''T''HH:mm:ss''Z') BETWEEN 
        TIMESTAMP '{min_date}' AND 
        TIMESTAMP '{max_date}' 