--------------------------------------------------------
--  파일이 생성됨 - 일요일-6월-12-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SCHEDULE
--------------------------------------------------------

  CREATE TABLE "SCHOOL"."SCHEDULE" 
   (	"SCHE_CODE" VARCHAR2(20 BYTE), 
	"SCHE_DAY" VARCHAR2(3 BYTE), 
	"SCHE_PERIOD" VARCHAR2(9 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SCHOOL_TABLESPACE" ;
--------------------------------------------------------
--  Constraints for Table SCHEDULE
--------------------------------------------------------

  ALTER TABLE "SCHOOL"."SCHEDULE" MODIFY ("SCHE_PERIOD" NOT NULL ENABLE);
  ALTER TABLE "SCHOOL"."SCHEDULE" MODIFY ("SCHE_DAY" NOT NULL ENABLE);
