ALTER TABLE ACADEMY
ADD ACA_REGION nVARCHAR2(255);

ALTER TABLE ACADEMY
ADD ACA_AGE nVARCHAR2(5);

TRUNCATE TABLE ACADEMY;

ALTER TABLE ACADEMY
ADD ACA_IMGNAME VARCHAR2(255);

