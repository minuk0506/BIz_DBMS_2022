CREATE TABLE "SCHOOL"."PERIOD"(
"S_CODE" VARCHAR2(20 BYTE), 
"PERI_TIME" VARCHAR2(9 BYTE)
);

ALTER TABLE PERIOD
ADD CONSTRAINT FK_SCHE_CODE
FOREIGN KEY (S_CODE) REFERENCES SCHEDULE(sche_code);