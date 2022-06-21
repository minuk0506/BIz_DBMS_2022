CREATE TABLE academy(
                "ACA_CODE" VARCHAR2(20 BYTE), 
	"ACA_NAME" NVARCHAR2(50), 
	"ACA_SUBJECT" NVARCHAR2(10), 
	"ACA_ADDR" NVARCHAR2(255), 
	"ACA_INFO" NVARCHAR2(1024), 
	"ACA_IMG" NVARCHAR2(255),
    aca_teacher nVARCHAR2(10),
    aca_region nVARCHAR2(10), 
    aca_age nVARCHAR2(5)
    );
    
    CREATE TABLE users(
    username varchar2(20),
		        password varchar2(30),	
		        email varchar2(50),	
		        name nvarchar2(10),	
		        nickname nvarchar2(10),		
		        role nvarchar2(10),
		        aca_code varchar2(30)	
    );
    
    insert into users (
    username,
    password,	
		        email,	
		        name,	
		        nickname,		
		        role,
		        aca_code
    ) VALUES (
    'minuk',
    '!Korea8080',
    'minuk@naver.com',
    '민',
    '욱',
    'ADMIN',
    1
    );
    