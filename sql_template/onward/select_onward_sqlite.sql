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
    SELECT
        ((order_item_id)) AS order_item_id, 
        ((order_item_sub_id)) AS order_item_sub_id,
        ((bill_doc_no)) AS bill_doc_no, 
        ((package_code)) AS package_code,
        ((bu)) as bu,
        -- ((en)) as en, -- no en in athena
        ((orderdate)) AS orderdate,
        ((billing_sub_group)) AS billing_sub_group,
        ((item_code)) AS item_code,
        ((description)) AS description,
        -- ((hn)) AS hn,  -- no hn in athena
        -- ((name)) AS name, -- no name in athena
        ((account_code)) AS account_code,
        ((discoun_account)) AS discoun_account,
        ((department)) AS department,
        ((first_loc)) AS first_loc,
        ((patient_loc)) AS patient_loc,
        ((rec_loc)) AS rec_loc,
        ((sub_type)) AS sub_type,
        ((nation)) AS nation,
        ((curr)) AS curr,
        ((amount_before)) AS amount_before,
        ((discount)) AS discount,
        ((bill_amount)) AS bill_amount,
        ((doctor_group)) AS doctor_group,
        ((doctor_type)) AS doctor_type,
        ((doctor_code)) AS doctor_code,
        ((doctor_name)) AS doctor_name,
        ((qty)) AS qty,
        ((episode_id)) AS episode_id,
        ((patient_id)) AS patient_id
    FROM 
        '{TABLE}'
    WHERE 
        DATETIME(SUBSTR(file_name, 1, INSTR(file_name, '_') - 1)) BETWEEN 
        '{min_date}' AND 
        '{max_date}' 