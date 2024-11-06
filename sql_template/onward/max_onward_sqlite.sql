--onward_sqiite.sql
/*
SELECT bu, en, orderdate, billing_sub_group, item_code, description, 
package_code, hn, name, account_code, discoun_account, department, first_loc, patient_loc, 
rec_loc, sub_type, nation, curr, amount_before, discount, bill_amount, 
doctor_group, doctor_type, doctor_code, doctor_name, qty, file_name
FROM onward_full;
*/
    SELECT 
        MAX((bu)) as bu,
        -- MAX((en)) as en, -- no en in athena
        MAX((orderdate)) AS orderdate,
        MAX((billing_sub_group)) AS billing_sub_group,
        MAX((item_code)) AS item_code,
        MAX((description)) AS description,
        MAX((package_code)) AS package_code,
        -- MAX((hn)) AS hn, -- no hn in athena
        -- MAX((name)) AS name, -- no name in athena
        MAX((account_code)) AS account_code,
        MAX((discoun_account)) AS discoun_account,
        MAX((department)) AS department,
        MAX((first_loc)) AS first_loc,
        MAX((patient_loc)) AS patient_loc,
        MAX((rec_loc)) AS rec_loc,
        MAX((sub_type)) AS sub_type,
        MAX((nation)) AS nation,
        MAX((curr)) AS curr,
        MAX((amount_before)) AS amount_before,
        MAX((discount)) AS discount,
        MAX((bill_amount)) AS bill_amount,
        MAX((doctor_group)) AS doctor_group,
        MAX((doctor_type)) AS doctor_type,
        MAX((doctor_code)) AS doctor_code,
        MAX((doctor_name)) AS doctor_name,
        MAX((qty)) AS qty
    FROM 
       '{TABLE}'
    WHERE 
        DATETIME(SUBSTR(file_name, 1, INSTR(file_name, '_') - 1)) BETWEEN 
        '{min_date}' AND 
        '{max_date}' 