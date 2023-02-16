-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--JOIN
	--테이블 생성
	--board1230
		CREATE TABLE board1230(
			bidx NUMBER NOT NULL PRIMARY KEY,
			subject VARCHAR(30) NOT NULL,
			contents VARCHAR(1000),
			writer VARCHAR(20),
			delYn CHAR(1) DEFAULT 'N',
			writeday DATE DEFAULT SYSDATE,
			ip VARCHAR(30),
			midx NUMBER NOT NULL,
			CONSTRAINT midx_fk FOREIGN KEY(midx) REFERENCES member1230);

		INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(1,'첫번째글입니다','첫번째내용입니다.','김연수','111.222.333.444',1);
		INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(2,'두번째글입니다','두번째내용입니다.','행인','222.222.333.444',2);
		INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(3,'세번째글입니다','세번째내용입니다.','아이언맨','222.222.333.555',1);
		INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(4,'네번째글입니다','네번째내용입니다.','토르',NULL,3);
		INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(5,'다섯번째글입니다','다섯번째내용입니다.','스파이더맨',NULL,4);
		INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(6,'여섯번째글입니다','여섯번째내용입니다.','슈퍼맨',NULL,3);
		INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(7,'일곱번째글입니다','일곱번째내용입니다.','원더우먼',NULL,5);
		INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(8,'여덜번째글입니다','여덜번째내용입니다.','배트맨',NULL,6);
		INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(9,'아홉번째글입니다','아홉번째내용입니다.','이순신',NULL,1);
		INSERT INTO board1230(bidx,subject,contents,writer,ip,midx) VALUES(10,'열번째글입니다','열번째내용입니다.','김순자',NULL,9);

--------------------------------------------------------------------------------------------------------------------------------------------
-- inner join : 공통된 칼럼으로 묶어서 하나의 테이블로 만드는 작업)
-- 형식 ( 테이블 A inner join 테이블 B on A.PK = B.FK 컬럼
	--EX) 3번째 글을 쓴 사람의 나이를 알려주세요
			SELECT TO_CHAR(SYSDATE,'yyyy')-SUBSTR(A.memberBirth,1,4) AS 나이 FROM member1230 A INNER JOIN board1230 B ON A.midx=B.midx WHERE B.bidx=3;
			SELECT TO_CHAR(SYSDATE,'yyyy')-SUBSTR(A.memberBirth,1,4) AS 나이 FROM member1230 A, board1230 B WHERE A.midx=B.midx AND B.bidx=3;
	--EX) 홍길순인 사람이 쓴 글의 갯수를 출력하시오.
			SELECT COUNT(B.bidx) AS cnt FROM member1230 A, board1230 B WHERE A.midx=B.midx AND A.memberName = '홍길순';
	--EX) 각 지역별로 게시물을 쓴 사람들의 인원수를 출력하시오
			SELECT A.memberAddr, COUNT(DISTINCT A.midx) AS cnt FROM member1230 A, board1230 B WHERE A.midx=B.midx GROUP BY A.memberAddr;
	--EX) 게시글 내용중에 다섯이라는 글자가 포함된 글을 쓴 사람의 ID를 출력하시오
			SELECT A.memberId FROM member1230 A, board1230 B WHERE A.midx = B.midx AND B.contents LIKE '%다섯%';
	--EX) 회원번호 1번,8번에 해당하는 사람이 쓴 게시글의 ip를 추출하고 없으면 ip없음으로 출력하시오
			SELECT NVL2(B.ip,B.ip,'ip없음') AS ip주소 FROM member1230 A, board1230 B WHERE A.midx=B.midx AND A.midx IN(1,8);
	--EX) 게시글 쓴 사람의 닉네임이 3글자 이상인 사람의 성별을 출력하시오
			SELECT B.writer, A.memberGender FROM member1230 A, board1230 B WHERE A.midx=B.midx AND B.writer LIKE '%___%';
	--EX) 성별로 글쓴 사람의 인원수를 출력하시오
			SELECT A.memberGender AS 성별, COUNT(DISTINCT A.midx) AS cnt FROM member1230 A INNER JOIN board1230 B ON A.midx=B.midx GROUP BY A.memberGender;

-- left outer join : 왼쪽에 있는 테이블 모든것과오른쪽에 있는 공통된 데이터
-- 형식 ( 테이블 A left outer join 테이블 B on A.공통컬럼=B.공통컬럼
			SELECT * FROM member1230 A LEFT JOIN board1230 B ON A.midx=B.midx; -- 표준쿼리
			SELECT * FROM member1230 A, board1230 B WHERE A.midx=B.midx(+); --오라클에서 사용
	--EX) 각 지역별로 글쓴 사람의 인원수를 출력하시오.
			SELECT A.memberAddr,COUNT(DISTINCT B.midx) FROM member1230 A LEFT JOIN board1230 B ON A.midx=B.midx GROUP BY A.memberAddr;


	--EX) 게시글을 쓴 사람들 중에 최고로 나이 많은 사람의 나이와 가장 나이 어린 사람의 나이를 출력하시오
			SELECT TO_CHAR(SYSDATE,'yyyy')-SUBSTR(MIN(A.memberBirth),1,4) AS 최고령자,TO_CHAR(SYSDATE,'yyyy')-SUBSTR(MAX(A.memberBirth),1,4) AS 최저연령자 FROM member1230 A, board1230 B WHERE A.midx=B.midx;
	--EX) 회원번호 3,5번인 사람이 쓴 글의 내용중에 안녕이라는 글자가 포함된 글의 번호를 출력하시오
			SELECT B.bidx AS 글번호 FROM member1230 A INNER JOIN board1230 B ON A.midx=B.midx WHERE A.midx IN (3,5) AND B.contents LIKE '%안녕%';
