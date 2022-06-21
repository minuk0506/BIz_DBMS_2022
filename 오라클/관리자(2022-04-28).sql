-- �뿬湲곕뒗 愿�由ъ옄 �솕硫�
-- C:\oraclexe\data

/*
�삤�씪�겢 DBMS�뿉 �뜲�씠�꽣瑜� ���옣�븯怨� 愿�由ы븯湲� �쐞�븳 �젅李�

愿�由ъ옄 �젒�냽�븯�뿬
1. TableSpace �깮�꽦
2.�궗�슜�옄�깮�꽦 諛� TableSpace �뿰寃�
3. �궗�슜�옄�뿉寃� 沅뚰븳遺��뿬
*/
CREATE TABLESPACE school
DATAFILE 'C:/oraclexe/data/school.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER user2 IDENTIFIED BY 12341234
DEFAULT TABLESPACE school;

GRANT DBA TO user2;