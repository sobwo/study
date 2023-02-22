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

-------------------------------------------------------------------------------------------------------------------------
/*
	데이터 수정하기
	UPDATE 테이블이름 SET 변형할 컬럼=변경할 컬럽값, 변경할 컬럼=변경할 컬럼값 WHERE 컬럼명=컬럼값;
*/
--10명의 회원의전화번호를 01045671990~01045671999로 변경
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

	UPDATE member1230 SET memberName='홍길순' WHERE midx=1;
	UPDATE member1230 SET memberAddr='전주' WHERE midx BETWEEN 4 AND 8;
	UPDATE member1230 SET memberAddr='서울' WHERE midx =9;

-- EX) 회원번호가 1번인 사람의 email을 sbu@naver.com으로 변경하고, 생년월일을 19990101로 변경
	UPDATE member1230 SET memberEmail='sbu@naver.com', memberBirth='19990101' WHERE midx=1;
	SELECT memberEmail, memberBirth FROM member1230;
--EX) 3번 회원이 회원탈퇴를 하였다. 회원탈퇴여부(delyn)를 Y로 변경하시오
 	UPDATE member1230 SET delyn='Y' WHERE midx=3;

-------------------------------------------------------------------------------------------------------------------------
/*
	데이터 탐색하기
	SELECT 컬럼 FROM 테이블이름 WHERE조건 GROUP BY(조건) ORDER(정렬방식)
*/
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


-------------------------------------------------------------------------------------------------------------------------
/*
	DCL
	데이터 삭제하기 및 복원하기
	DELETE FROM 테이블 이름 WHERE 칼럼= 칼럼값;
*/
--EX) 회원번호 2번인 사람의 데이터를 삭제
	DELETE FROM member1230 WHERE MIDX=2;
--COMMIT 하기 전이라면 ROLLBACK(복원)
	ROLLBACK;
	SELECT * FROM member1230;