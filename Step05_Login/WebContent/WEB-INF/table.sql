
CREATE SEQUENCE board_cafe_seq;

CREATE SEQUENCE board_file_seq;

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


SELECT *
	(SELECT result1.*, ROWNUM AS rnum
	FROM
		(SELECT num, writer, title
		FROM board_cafe
		ORDER BY num DESC) result1)
WHERE rnum BETWEEN 6 AND 10

CREATE TABLE board_file(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100),
title VARCHAR2(100) NOT NULL,
orgFileName VARCHAR2(100) NOT NULL,  --원본 파일명
saveFileName VARCHAR2(100) NOT NULL,  -- 파일 시스템에 실제 저장된 파일명
fileSize NUMBER,                      -- 파일의 크기(byte)
downCount NUMBER DEFAULT 0,           -- 다운로드 횟수
regdate DATE
);


ALTER TABLE users ADD(profile VARCHAR2(50));























