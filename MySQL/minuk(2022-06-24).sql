create table tbl_memo(
m_seq BIGINT primary KEY auto_increment,
m_author VARCHAR(25) NOT NULL,
m_date VARCHAR(10) NOT NULL,
m_time VARCHAR(10) NOT NULL,
m_memo VARCHAR(40) NOT NULL,
m_image VARCHAR(125)
);

drop table tbl_memo;

SELECT * FROM tbl_memo;

SELECT * FROM tbl_memo where m_seq;

INSERT INTO tbl_memo(
m_seq,
m_author,
m_date,
m_time,
m_memo
) values(
1,
'농',
'2022',
'12',
'가나다'
);
SELECT seq_memo.NEXTVAL FROM DUAL;