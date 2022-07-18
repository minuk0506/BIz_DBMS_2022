create database HelloDB;

use HelloDB;

CREATE TABLE tbl_iolist(
	io_seq		BIGINT			PRIMARY KEY ,
	io_date		VARCHAR(10)		NOT NULL,
	io_time		VARCHAR(10)		NOT NULL,
	io_pname	VARCHAR(50)	NOT NULL,
	io_dname	VARCHAR(50)	NOT NULL,
	io_dceo		VARCHAR(50)	,
	io_inout	VARCHAR(1)		NOT NULL,
	io_qty		INT				NOT NULL,
	io_price	INT				NOT NULL
);