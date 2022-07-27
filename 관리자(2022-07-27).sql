Create TableSpace firstDB
DataFile 'C:/oraclexe/data/first.dbf'
Size 1m AutoExtend On Next 1k;

Create User user1 Identified By 12341234
Default TableSpace firstDB;
    
Grant DBA to user1;