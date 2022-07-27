-- 네이버 유저화면

SELECT 3,4,5,6,7 FROM DUAL
UNION ALL
SELECT 5,6,7,8,9 FROM DUAL
UNION ALL
SELECT 10,11,12,13,14 FROM DUAL;

INSERT INTO tbl_images (i_seq, i_bseq, i_originalName, i_imageName)
SELECT seq_image.NEXTVAL, SUB.* FROM
(
SELECT 1,'image1.jpg','uuid-image1.jpg' FROM DUAL
UNION ALL
SELECT 1,'image1.jpg','uuid-image1.jpg' FROM DUAL
UNION ALL
SELECT 1,'image1.jpg','uuid-image1.jpg' FROM DUAL
) SUB;

SELECT * FROM tbl_images;

DROP TABLE tbl_IMAGES;

CREATE TABLE tbl_images(
		i_seq NUMBER PRIMARY KEY,
		i_bseq NUMBER NOT NULL,
		i_originalName VARCHAR2(255) NOT NULL,
		i_imageName VARCHAR2(255) NOT NULL
		);
        CREATE sequence seq_bbs
        increment by 1 start with 1;