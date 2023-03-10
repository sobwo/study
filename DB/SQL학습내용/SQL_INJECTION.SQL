--SQl injection(쿼리를 주입)
--ex) 비밀번호를 몰라도 내용 추출이 가능한 쿼리
SELECT * FROM member1230 WHERE MEMBERID='test1' AND memberPw='' OR '1'='1';