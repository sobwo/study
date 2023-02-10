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

----------------------------------------------------------------------------------------------------

--2. 데이터 조작하기(DML) = SELECT, DELETE, INSERT, UPDATE
/*
	데이터 삽입하기
	INSERT INTO 테이블이름(컬럼,컬럼,컬럼 ...) VALUES('값','값','값'...) 숫자의 경우 ''를 쓰지 않고 작성
*/

INSERT INTO member1230(midx,memberId,memberPw,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
	VALUES(1,'test1','1111','홍길동','test1@a.a','man','전주','19000101','127.0.0.1');
INSERT INTO member1230 VALUES(2,'test2','2222','홍길서','s@a.a','man','서울','20000101','Y',SYSDATE,'127.0.0.2');
INSERT INTO member1230 VALUES(3,'test3','3333','a','a@a.a','man','대전','20010101','Y',SYSDATE,'127.0.0.3');
INSERT INTO member1230 VALUES(4,'test4','4444','b','b@a.a','woman','대구','20020101','N',SYSDATE,'127.0.0.4');
INSERT INTO member1230 VALUES(5,'test5','5555','c','c@a.a','woman','부산','20030101','Y',SYSDATE,'127.0.0.5');
INSERT INTO member1230 VALUES(6,'test6','6666','d','d@a.a','man','순천','20041001','N',SYSDATE,'127.0.0.6');
INSERT INTO member1230 VALUES(7,'test7','7777','e','e@a.a','woman','여수','20050101','Y',SYSDATE,'127.0.0.7');
INSERT INTO member1230 VALUES(8,'test8','8888','f','f@a.a','man','강릉','20060101','N',SYSDATE,'127.0.0.8');
INSERT INTO member1230 VALUES(9,'test9','9999','g','g@a.a','man','인천','20070101','N',SYSDATE,'127.0.0.9');
INSERT INTO member1230 VALUES(10,'test10','1010','h','h@a.a','man','경기','20080101',default,SYSDATE,'127.0.0.10');
COMMIT;

/*
	데이터 탐색하기
	SELECT * FROM 테이블이름;
*/

SELECT * FROM member1230;

/*
	데이터 수정하기
	UPDATE 테이블이름 SET 변형할 컬럼=변경할 컬럽값, 변경할 컬럼=변경할 컬럼값 WHERE 컬럼명=컬럼값;
*/
UPDATE member1230 SET memberName='홍길순' WHERE midx=1;
SELECT memberName FROM member1230;
COMMIT;
-- 회원번호가 1번인 사람의 email을 sbu@naver.com으로 변경하고, 생년월일을 19990101로 변경
UPDATE member1230 SET memberEmail='sbu@naver.com', memberBirth='19990101' WHERE midx=1;
SELECT memberEmail, memberBirth FROM member1230;
COMMIT;

/*
	데이터 삭제하기 및 복원하기
	DELETE FROM 테이블 이름 WHERE 칼럼= 칼럼값;
*/
-- 회원번호 2번인 사람의 데이터를 삭제
DELETE FROM member1230 WHERE MIDX=2;
SELECT * FROM member1230;
--COMMIT 하기 전이라면 ROLLBACK(복원)
ROLLBACK;
SELECT * FROM member1230;

--회원번호 5번인 사람의 이름을 출력하시오.
SELECT memberName FROM member1230 WHERE MIDX=5;