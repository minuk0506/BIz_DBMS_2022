-- 2022-06-03

CREATE TABLE TBL_BOOKS(
    isbn VARCHAR2(13) PRIMARY KEY,
    title NVARCHAR2(50) NOT NULL,
    author NVARCHAR2(50) NOT NULL,
    publisher NVARCHAR2(50) NOT NULL,
    price NUMBER,
    discount NUMBER,
    description NVARCHAR2(2000),
    pubdate VARCHAR2(10),
    link VARCHAR2(125),
    image VARCHAR2(125)
)INSERT INTO tbl_books (
    isbn,
    title,
    author,
    publisher,
    price,
    discount,
    description,
    pubdate,
    link,
    image
) VALUES (
    :v0,
    :v1,
    :v2,
    :v3,
    :v4,
    :v5,
    :v6,
    :v7,
    :v8,
    :v9
);
UPDATE tbl_books
SET
    a = b
WHERE
        isbn = :v0
    AND title = :v1
    AND author = :v2
    AND publisher = :v3
    AND price = :v4
    AND discount = :v5
    AND description = :v6
    AND pubdate = :v7
    AND link = :v8
    AND image = :v9;