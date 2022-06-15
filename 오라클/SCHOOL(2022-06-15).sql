ALTER TABLE TEACHERS
ADD ACA_TEA_CODE VARCHAR2(20);

ALTER TABLE teachers
ADD CONSTRAINT fk_aca_tea_code
FOREIGN KEY (aca_tea_code)
REFERENCES academy(aca_code)
ON DELETE CASCADE;

SELECT * FROM teachers;

SELECT aca.aca_code, aca.aca_teachers, tc.aca_tea_code, tc.tea_id, tc.tea_name
FROM  academy aca
LEFT JOIN teachers tc
on aca.aca_code = tc.aca_tea_code;

TRUNCATE TABLE ACADEMY;
TRUNCATE TABLE TEACHERS;