/*
oracle -> mysql 변환
1. 데이터타입
	number -> int 타입
	varchar(2) -> VARCHAR
	date -> datetime
	sysdate -> now()
	sequence -> auto_increment(순서 자동입력)

2. MYSQL은 자동커밋
*/

-- 테이블 생성
	CREATE TABLE member1230(
			midx INT NOT	NULL PRIMARY KEY AUTO_INCREMENT,
			memberId VARCHAR(50) NOT NULL,
			memberPw VARCHAR(50) NOT NULL,
			memberName VARCHAR(50) NOT NULL,
			memberEmail VARCHAR(50),
			memberGender VARCHAR(30),
			memberAddr VARCHAR(10),
			memberBirth VARCHAR(20),
			delYn CHAR(1) DEFAULT 'N',
			writeday DATETIME DEFAULT NOW(),
			ip VARCHAR(30)
	)default charset='utf8';
drop table member1230;
-- 데이터 삽입
	INSERT INTO member1230(memberId,memberPw,memberName,memberEmail,memberGender,memberAddr,memberBirth,ip)
		VALUES('test1','1111','홍길동','test1@a.a','man','전주','19000101','127.0.0.1'),
			('test2','2222','홍길서','s@a.a','man','서울','20000101','127.0.0.2'),
			('test3','3333','a','a@a.a','man','대전','20010101','127.0.0.3'),
			('test4','4444','b','b@a.a','woman','서울','20020101','127.0.0.4'),
			('test5','5555','c','c@a.a','woman','대전','20030101','127.0.0.5'),
			('test6','6666','d','d@a.a','man','전주','20041001','127.0.0.6'),
			('test7','7777','e','e@a.a','woman','인천','20050101','127.0.0.7'),
			('test8','8888','f','f@a.a','man','강릉','20060101','127.0.0.8'),
			('test9','9999','g','g@a.a','man','인천','20070101','127.0.0.9'),
			('test10','1010','h','h@a.a','man','전주','20080101','127.0.0.10');

-- 데이터 탐색
	SELECT * FROM MEMBER1230;
	--EX) 회원번호를 내림차순으로 정렬하고 상위 5개만 출력하시오
		select * from member1230 order by midx desc limit 0,5;
	--EX) 회원번호 내림차순으로 정렬하고 7번째부터 2개를 출력하시오
		select * from member1230 order by midx desc limit 6,2;

