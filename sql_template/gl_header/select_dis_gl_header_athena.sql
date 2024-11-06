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
    SELECT DISTINCT
        COALESCE((invoice_no_receipt_no), '0') AS invoice_no_receipt_no,
        COALESCE((payment_method), '0') AS payment_method
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
        gl_header
    WHERE 
        parse_datetime(_file_updated_date, 'yyyy-MM-dd''T''HH:mm:ss''Z') BETWEEN 
        TIMESTAMP '{min_date}' AND 
        TIMESTAMP '{max_date}' 