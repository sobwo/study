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

	COMMIT;

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
	INSERT INTO member1230 VALUES(10,'test10','1010','h','h@a.a','man','전주','20080101',default,SYSDATE,'127.0.0.10');
	COMMIT;

--10명의 회원의전화번호를 01045671990~01045671999
	UPDATE member1230 SET memberPhone='01045671990' WHERE midx=1;
	UPDATE member1230 SET memberPhone='01045671991' WHERE midx=3;
	UPDATE member1230 SET memberPhone='01045671992' WHERE midx=2;
	UPDATE member1230 SET memberPhone='01045671993' WHERE midx=4;
	UPDATE member1230 SET memberPhone='01045671994' WHERE midx=5;
	UPDATE member1230 SET memberPhone='01045671995' WHERE midx=6;
	UPDATE member1230 SET memberPhone='01045671996' WHERE midx=7;
	UPDATE member1230 SET memberPhone='01045671997' WHERE midx=8;
	UPDATE member1230 SET memberPhone='01045671998' WHERE midx=9;
	UPDATE member1230 SET memberPhone='01045671999' WHERE midx=10;
	COMMIT;
/*
	데이터 수정하기
	UPDATE 테이블이름 SET 변형할 컬럼=변경할 컬럽값, 변경할 컬럼=변경할 컬럼값 WHERE 컬럼명=컬럼값;
*/
	UPDATE member1230 SET memberName='홍길순' WHERE midx=1;
	UPDATE member1230 SET memberAddr='전주' WHERE midx BETWEEN 4 AND 8;
	UPDATE member1230 SET memberAddr='서울' WHERE midx =9;
	SELECT memberName FROM member1230;
	COMMIT;
-- EX) 회원번호가 1번인 사람의 email을 sbu@naver.com으로 변경하고, 생년월일을 19990101로 변경
	UPDATE member1230 SET memberEmail='sbu@naver.com', memberBirth='19990101' WHERE midx=1;
	SELECT memberEmail, memberBirth FROM member1230;
	COMMIT;

/*
	데이터 삭제하기 및 복원하기
	DELETE FROM 테이블 이름 WHERE 칼럼= 칼럼값;
*/
--EX) 회원번호 2번인 사람의 데이터를 삭제
	DELETE FROM member1230 WHERE MIDX=2;
	SELECT * FROM member1230;
--COMMIT 하기 전이라면 ROLLBACK(복원)
	ROLLBACK;
	SELECT * FROM member1230;

/*
	데이터 탐색하기
	SELECT 컬럼 FROM 테이블이름 WHERE조건 GROUP BY(조건) ORDER(정렬방식)
*/
	SELECT * FROM member1230;
--EX) 회원번호 5번인 사람의 이름을 출력하시오.
	SELECT memberName FROM member1230 WHERE MIDX=5;
--EX) 회붠번호가 1번,8번,9번인 사람의 데이터를 출력하시오.
	SELECT * FROM member1230 WHERE midx=1 OR midx=8 OR midx=9;
	SELECT * FROM member1230 WHERE midx IN(1,8,9);
--EX) 회원정보가 4번부터 8번까지 회원들의 정보를 출력하시오.
	SELECT * FROM member1230 WHERE midx >= 4 AND midx<=8;
	SELECT * FROM member1230 WHERE midx BETWEEN 4 AND 8;
--EX) 회원번호 2번에서 8번까지 사람들 중에 지역이 서울인 사람의 데이터를 출력하시오.
	SELECT * FROM member1230 WHERE midx BETWEEN 2 AND 8 AND memberAddr ='서울';

--정렬: 오름차순, 내림차순
--EX) 회원번호를 최근 등록한 사람들 순으로 정렬하시오.(내림차순)
	SELECT * FROM member1230 ORDER BY midx DESC;
--EX) 회원번호를 오룸차순 형태로 정렬하시오.
	SELECT * FROM member1230 ORDER BY midx ASC;
--EX) 회원번호가 4,7,10번인 사람의 일므을 오름차순으로 출력하시오.
	SELECT * FROM member1230 WHERE midx IN(4,7,10) ORDER BY memberName;

--검색 조건
-- like 조건 : 컬럼 like '%검색어%'
--EX) 성이 김씨인 사람의 데이터를 출력하시오.
SELECT * FROM member1230 WHERE memberName LIKE '%김%';
SELECT * FROM member1230 WHERE memberName LIKE '김%';
--EX) 회원들 중에 네이버 메일을 사용하는 회원들의 이름을 출력ㅎ시오.
SELECT memberName FROM member1230 WHERE memberEmail LIKE '%a.a';
--EX)  전주에 사는 회원들 중에 90년대생 사람들의 이름을 오름차순으로 정렬하시오.
SELECT * FROM member1230 WHERE memberAddr='전주' AND memberBirth LIKE '2%' ORDER BY memberName;

--문자열 자르기
--SUBSTR(컬럼,자리수,갯수)
--EX) 김씨 성을 가진 회원 들의 이름만 출력하시오.
	SELECT SUBSTR(memberName,2) AS 이름 FROM member1230 WHERE membername LIKE '김%';
--EX) 홍씨 성을 가진 회원의 중간 한자리 이름만 출력하시오.
	SELECT SUBSTR(memberName,2,1) AS 이름 FROM member1230 WHERE memberName LIKE '홍%';
--EX) 회원이름의 마지막 글자만을 출력하시오.
	SELECT SUBSTR(memberName,-1,1) AS 이름 FROM member1230;
--EX) 길순이라는 사람의 이메일주소를 출력하시오.
 SELECT memberEmail AS 이메일 FROM member1230 WHERE SUBSTR(memberName,-2)='길서';

--EX) 전주에 사는 90년대생 사람들의 전화번호 뒷자리 4개를 출력하시오.
	SELECT SUBSTR(memberPhone,-4) AS 전화번호 뒷자리 FROM member1230 WHERE memberAddr='전주' AND memberBirth LIKE '199%';
	SELECT * FROM member1230;
--EX) 이름이b와 이메일이b@a.a 인 사람의 ID찾기
	SELECT memberId FROM member1230 WHERE membername='b' AND memberEmail='b@a.a';
--EX) 3번 회원이 회원탈퇴를 하였다. 회원탈퇴여부(delyn)를 Y로 변경하시오
 	UPDATE member1230 SET delyn='Y' WHERE midx=3;
--EX) 모든 가입한 회원정보를 출력하시오.
	SELECT * FROM member1230 WHERE delyn='N';

--그룹 절 사용
-- SELECT * FROM 테이블이름 GROUP BY 컬럼;
--EX) 회원들의 지역을 지역별로 출력
	SELECT memberAddr FROM member1230 GROUP BY memberAddr;
--EX) 회원들의 지역별로 인원수를 출력하시오.
	SELECT memberAddr, COUNT(*) AS cnt FROM member1230 GROUP BY memberAddr;
--EX) 지역별로 각 회원의 회원번호 합을 출력하시오.
	SELECT memberAddr, SUM(midx) AS SUM FROM member1230 GROUP BY memberAddr;
--EX) 지역별로 각 회원의 회원번호 평균을 출력하시오.
	SELECT memberAddr, AVG(midx) AS AVG FROM member1230 GROUP BY memberAddr;
--EX) 지역별로 각 회원의 회원번호 최대값, 최소값을 출력하시오.
	SELECT memberAddr, MAX(midx) AS MAX, MIN(midx) AS MIN FROM member1230 GROUP BY memberAddr;
--EX) 전체 그룹에 대해서 최근 회원번호,최초 회원번호, 인원수, 합, 평균를 출력하시오.
	SELECT MAX(midx) AS MAX FROM member1230;
	SELECT MIN(midx) AS MIN FROM member1230;
	SELECT COUNT(midx) AS CNT FROM member1230;
	SELECT SUM(midx) AS SUM FROM member1230;
	SELECT AVG(midx) AS AVG FROM member1230;
--EX) 가입된 회원의 총 인원수를 출력하시오.
	SELECT COUNT(midx) AS 총 인원수 FROM member1230;
--EX) 전주에 사는 회원들의 평균나이를 출력하시오.
	SELECT AVG(TO_CHAR(SYSDATE,'yyyy')-SUBSTR(memberBirth,1,4)) AS 평균나이 FROM member1230 WHERE memberAddr='전주';
--EX) 최근에 등록된 서울에 사는 사람의 이름을 출력하시오.
	SELECT memberName FROM member1230 WHERE midx = (SELECT MAX(midx) FROM member1230 GROUP BY memberAddr HAVING memberAddr='서울');
--EX) 회원번호 1번부터 7번까지의 사람들의 나이의 총합을 구하시오.
SELECT sum(TO_CHAR(SYSDATE,'yyyy')-SUBSTR(memberBirth,1,4)) AS 총합 FROM member1230 WHERE midx BETWEEN 1 AND 7;
