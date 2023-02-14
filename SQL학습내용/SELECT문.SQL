--정렬: 오름차순, 내림차순
	--EX) 회원번호를 최근 등록한 사람들 순으로 정렬하시오.(내림차순)
			SELECT * FROM member1230 ORDER BY midx DESC;
	--EX) 회원번호를 오룸차순 형태로 정렬하시오.
			SELECT * FROM member1230 ORDER BY midx ASC;
	--EX) 회원번호가 4,7,10번인 사람의 일므을 오름차순으로 출력하시오.
			SELECT * FROM member1230 WHERE midx IN(4,7,10) ORDER BY memberName;

--검색 조건
	-- like 조건 : 컬럼 like '%검색어%' / '_검색어_'
		--'%' : 앞 또는 뒤에 글자 수와 상관 없이 검색어가 포함된 데이터 출력
		--'_' : 앞 또는 뒤에 해당 '_' 글자 수 만큼 검색어가 포함된 데이터 출력
		--EX) 성이 김씨인 사람의 데이터를 출력하시오.
				SELECT * FROM member1230 WHERE memberName LIKE '%김%';
				SELECT * FROM member1230 WHERE memberName LIKE '김%';
		--EX) 성이 김씨이고 3글자인 사람의 데이터를 출력하시오.
				SELECT * FROM member1230 WHERE memberName LIKE '김__';
		--EX) 회원들 중에 네이버 메일을 사용하는 회원들의 이름을 출력ㅎ시오.
				SELECT memberName FROM member1230 WHERE memberEmail LIKE '%a.a';
		--EX)  전주에 사는 회원들 중에 90년대생 사람들의 이름을 오름차순으로 정렬하시오.
				SELECT * FROM member1230 WHERE memberAddr='전주' AND memberBirth LIKE '2%' ORDER BY memberName;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--그룹 절 사용
	--SELECT * FROM 테이블이름 GROUP BY 컬럼;
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
				SELECT COUNT(midx) AS 총 인원수 FROM member1230 WHERE delYn='N';
		--EX) 전주에 사는 회원들의 평균나이를 출력하시오.
				SELECT AVG(TO_CHAR(SYSDATE,'yyyy')-SUBSTR(memberBirth,1,4)) AS 평균나이 FROM member1230 WHERE memberAddr='전주';
		--EX) 최근에 등록된 서울에 사는 사람의 이름을 출력하시오.
				SELECT memberName FROM member1230 WHERE midx = (SELECT MAX(midx) FROM member1230 WHERE memberAddr='서울');
		--EX) 회원번호 1번부터 7번까지의 사람들의 나이의 총합을 구하시오.
				SELECT sum(TO_CHAR(SYSDATE,'yyyy')-SUBSTR(memberBirth,1,4)) AS 총합 FROM member1230 WHERE midx BETWEEN 1 AND 7;
		--EX) 핸드폰 끝자리가 5인 사람들의 명단을 지역별 이름 내림차순으로 정렬하시오.
				SELECT memberAddr,memberName FROM member1230 WHERE SUBSTR(memberPhone,-1)='5' GROUP BY memberAddr, memberName ORDER BY memberName DESC;
		--EX) 사는지역별로 사람들의 인원수를 출력하시오
				SELECT memberAddr,COUNT(*) FROM member1230 GROUP BY memberAddr;
		--EX) 지역별 성별 인원수를 출력하시오.
				SELECT memberAddr, memberGender,COUNT(*) FROM member1230 GROUP BY memberAddr, memberGender ORDER BY memberAddr;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--서브쿼리
	--단일값 서브쿼리
		--EX) 회원번호가 회원번호 평균이하면 사람들의 데이터를 출력하시오.
				SELECT * FROM member1230 WHERE midx <= (SELECT AVG(midx) FROM member1230);
		--EX) 나이가 가장 적은 사람의 전화번호를 출력하시오.
				SELECT memberPhone FROM member1230 WHERE memberBirth = (SELECT MAX(memberBirth) FROM member1230);
	--다중값 서브쿼리
		--EX) 회원번호중에 회원번호가 홀수인 사람들의 이름을 서브쿼리를 활용해서 출력하시오
				SELECT midx, memberName FROM member1230 WHERE midx IN (SELECT midx FROM member1230 WHERE MOD(midx,2)=1);
	--스칼라 서브쿼리 : 컬럼 위치 안에 쓰는 서브 쿼리
		--EX) 회워명단을 출력하고 탈퇴된 회원은 탈퇴라고 출력하시오
				SELECT memberName,(SELECT '탈퇴' FROM member1230 b WHERE b.midx=a.midx AND delYn='Y') FROM member1230 a;
	--인라인뷰 서브쿼리 : 단일 테이블이 아닌 제약테이블 사용
		--EX) 각 지역별 여성 인원수를 서브쿼리를 활용해서 출력하시오
				SELECT a.memberAddr AS 지역, COUNT(*) AS 여성인원수 FROM member1230 a,(SELECT * FROM member1230 WHERE memberGender='woman') b WHERE a.midx=b.midx GROUP BY a.memberAddr;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--조건문
	--case 컬럼 when 조건 then 출력값 else 출력값 end
		--EX) 회원의 성별의 man이면 남성이라고 출력하고 woman면 여성이라고 출력하시오
			SELECT midx, CASE memberGender WHEN 'man' THEN '남성' ELSE '여성' END AS 성별 FROM member1230;
			SELECT midx, CASE WHEN memberGender ='man' THEN '남성' WHEN memberGender='woman' THEN '여성' ELSE '모름' END AS 성별 FROM member1230;
		--EX) 회원탈퇴 되었으면 탈퇴라고 출력하고 아니면 가입이라고 출력하시오
			SELECT memberName, CASE delYn WHEN 'Y' THEN '탈퇴' ELSE '가입' END AS 가입여부 FROM member1230;

	--decode()
		--EX) 회원의 성별이 man이면 남성이라고 출력하고 woman면 여성이라고 출력하시오
			SELECT midx, DECODE(memberGender,'man','남성','woman','여성','모름') FROM member1230;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--NULL 체크 함수
	--nvl(), nvl2()
		--EX)회원번호 짝수인 사람의 ip를 null 하고 ip가 null인 사람은 추적불가로 출력하고 아닌 사람은 추적가능이라고 출력하시오
			UPDATE member1230 SET ip = NULL WHERE MOD(midx,2)=0; COMMIT;
			SELECT NVL(ip,'추적불가') FROM member1230;
			SELECT NVL2(ip,'추적가능','추적불가') FROM member1230;

---------------------------------------------------------------------------------------------------
--내장 함수
	--문자열 자르기 SUBSTR(컬럼,자리수,갯수)
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

	--instr() 함수: 검색어의 시작점 위치 뽑기
		--EX) 사람들의 메일 주소의 자리 위치를 출력하시오
				SELECT INSTR(memberEmail,'@') FROM member1230;
		--EX) 회원들의 사용하는 메일 별로 사람들의 인원 수를 출력
				SELECT SUBSTR(memberEmail,INSTR(memberEmail,'@')+1) AS 이메일주소, COUNT(*) AS 인원수 FROM member1230 GROUP BY SUBSTR(memberEmail,INSTR(memberEmail,'@')+1);
