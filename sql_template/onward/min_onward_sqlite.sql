--onward_sqiite.sql
/*
SELECT bu, en, orderdate, billing_sub_group, item_code, description, 
package_code, hn, name, account_code, discoun_account, department, first_loc, patient_loc, 
rec_loc, sub_type, nation, curr, amount_before, discount, bill_amount, 
doctor_group, doctor_type, doctor_code, doctor_name, qty, file_name
FROM onward_full;
*/
    SELECT 
        MIN((bu)) as bu,
        -- MIN((en)) as en, -- no en in athena
        MIN((orderdate)) AS orderdate,
        MIN((billing_sub_group)) AS billing_sub_group,
        MIN((item_code)) AS item_code,
        MIN((description)) AS description,
        MIN((package_code)) AS package_code,
        -- MIN((hn)) AS hn,  -- no hn in athena
        -- MIN((name)) AS name, -- no name in athena
        MIN((account_code)) AS account_code,
        MIN((discoun_account)) AS discoun_account,
        MIN((department)) AS department,
        MIN((first_loc)) AS first_loc,
        MIN((patient_loc)) AS patient_loc,
        MIN((rec_loc)) AS rec_loc,
        MIN((sub_type)) AS sub_type,
        MIN((nation)) AS nation,
        MIN((curr)) AS curr,
        MIN((amount_before)) AS amount_before,
        MIN((discount)) AS discount,
        MIN((bill_amount)) AS bill_amount,
        MIN((doctor_group)) AS doctor_group,
        MIN((doctor_type)) AS doctor_type,
        MIN((doctor_code)) AS doctor_code,
        MIN((doctor_name)) AS doctor_name,
        MIN((qty)) AS qty
    FROM 
        '{TABLE}'
    WHERE 
        DATETIME(SUBSTR(file_name, 1, INSTR(file_name, '_') - 1)) BETWEEN 
        '{min_date}' AND 
        '{max_date}' 