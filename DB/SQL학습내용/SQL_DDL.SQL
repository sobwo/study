--SQL 학습하기

--	1. DDL(테이블 조작 언어)
/*
	1-1 테이블 생성하기(CREATE)
	CREATE TABLE 테이블이름 (
		컬럼 데이터타입 널여부 기본키or기본값
		);
*/
	CREATE TABLE member(
			midx NUMBER NOT	NULL PRIMARY KEY,
			memberId VARCHAR2(50) NOT NULL,
			memberPw VARCHAR2(50) NOT NULL,
			memberName VARCHAR2(50) NOT NULL,
			memberEmail VARCHAR2(50),
			memberGender VARCHAR2(30),
			memberAddr VARCHAR2(10),
			memberBirth VARCHAR2(20),
			delYn CHAR(1) DEFAULT 'N',
			writeday DATE DEFAULT SYSDATE,
			ip VARCHAR2(30) NULL
	);

--테이블 삭제
	DROP TABLE member;
	DROP TABLE member1230;

	CREATE TABLE member1230(
	midx NUMBER NOT	NULL PRIMARY KEY,
			memberId VARCHAR2(50) NOT NULL,
			memberPw VARCHAR2(50) NOT NULL,
			memberName VARCHAR2(50) NOT NULL,
			memberEmail VARCHAR2(50),
			memberGender VARCHAR2(30),
			memberAddr VARCHAR2(10),
			memberBirth VARCHAR2(20),
			delYn CHAR(1) DEFAULT 'N',
			writeday DATE DEFAULT SYSDATE,
			ip VARCHAR2(30)
	);

/*
	테이블 수정
	ALTER TABLE 테이블 이름 키워드(ADD-추가,MODIFY-수정) 컬럼 데이터타입 NULL여부 기본값;
*/
	ALTER TABLE member1230 MODIFY memberGender VARCHAR2(10);

	ALTER TABLE member1230 DROP COLUMN ip;

	ALTER TABLE member1230 ADD ip VARCHAR(30);

	--EX) 회원 전화번호 컬럼 추가하기
--MEMBERPHONE VARCHAR(12) 추가
	ALTER TABLE member1230 ADD memberPhone VARCHAR(12);

--컬럼 순서 변경
	ALTER TABLE member1230 MODIFY(memberEmail invisible);
	ALTER TABLE member1230 MODIFY(memberGender invisible);
	ALTER TABLE member1230 MODIFY(memberAddr invisible);
	ALTER TABLE member1230 MODIFY(memberBirth invisible);
	ALTER TABLE member1230 MODIFY(delYn invisible);
	ALTER TABLE member1230 MODIFY(writeday invisible);
	ALTER TABLE member1230 MODIFY(ip invisible);

	ALTER TABLE member1230 MODIFY(memberEmail visible);
	ALTER TABLE member1230 MODIFY(memberGender visible);
	ALTER TABLE member1230 MODIFY(memberAddr visible);
	ALTER TABLE member1230 MODIFY(memberBirth visible);
	ALTER TABLE member1230 MODIFY(delYn visible);
	ALTER TABLE member1230 MODIFY(writeday visible);
	ALTER TABLE member1230 MODIFY(ip visible);


