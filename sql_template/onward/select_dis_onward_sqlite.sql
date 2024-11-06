--onward_sqiite.sql
/*
SELECT bu, en, orderdate, billing_sub_group, item_code, description, 
package_code, hn, name, account_code, discoun_account, department, first_loc, patient_loc, 
rec_loc, sub_type, nation, curr, amount_before, discount, bill_amount, 
doctor_group, doctor_type, doctor_code, doctor_name, qty, file_name
FROM onward_full;
*/
/*
SELECT bu, en, orderdate, billing_sub_group, item_code, description, 
package_code, hn, name, account_code, discoun_account, department, first_loc,
patient_loc, rec_loc, sub_type, nation, curr, 
amount_before, discount, bill_amount, doctor_group, 
doctor_type, doctor_code, doctor_name, qty, 
order_item_id, order_item_sub_id, bill_doc_no, episode_id, patient_id, file_name
FROM onward_full;
*/
   SELECT DISTINCT
        CAST(order_item_id AS TEXT) AS order_item_id, 
        CAST(order_item_sub_id AS TEXT) AS order_item_sub_id,
        CAST(bill_doc_no AS TEXT) AS bill_doc_no, 
        COALESCE((package_code), '0') AS package_code
    FROM 
        '{TABLE}'
    WHERE 
        DATETIME(SUBSTR(file_name, 1, INSTR(file_name, '_') - 1)) BETWEEN 
        '{min_date}' AND 
        '{max_date}' 