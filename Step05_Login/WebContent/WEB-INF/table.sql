CREATE TABLE users
(id VARCHAR2(30) PRIMARY KEY,
pwd VARCHAR2(20) NOT NULL,
email VARCHAR2(30),
regdate DATE);


CREATE TABLE board_cafe(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL
	content CLOB,
	viewCount NUMBER,
	regdate DATE
);

CREATE SEQUENCE board_cafe_seq;

SELECT *
	(SELECT result1.*, ROWNUM AS rnum
	FROM
		(SELECT num, writer, title
		FROM board_cafe
		ORDER BY num DESC) result1)
WHERE rnum BETWEEN 6 AND 10


