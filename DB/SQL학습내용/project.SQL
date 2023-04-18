CREATE SEQUENCE memberNo_seqNum INCREMENT BY 1 START WITH 1 NOCACHE;
DROP SEQUENCE memberNo_seqNum;

CREATE SEQUENCE roomNo_seqNum INCREMENT BY 1 START WITH 1 NOCACHE;
DROP SEQUENCE roomNo_seqNum;

CREATE SEQUENCE bidx_seqNum INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE originbidx_seqNum INCREMENT BY 1 START WITH 1 NOCACHE;
DROP TABLE member;
DROP TABLE reservation;

CREATE SEQUENCE reservNo_seqNum INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE TABLE member(
	midx NUMBER NOT NULL PRIMARY KEY,
	memberId VARCHAR2(30),
	memberPw VARCHAR2(50),
	memberName VARCHAR2(15),
  memberBirth VARCHAR2(20),
  memberPhone VARCHAR2(20),
  memberEmail VARCHAR2(40),
  delYn CHAR(1) DEFAULT 'N'
);

create TABLE reservMember(
	memberNo NUMBER NOT NULL,
	reservNo NUMBER NOT NULL,
	extraPhone VARCHAR2(30),
	arriveTime VARCHAR2(20),
	request CLOB,
	CONSTRAINTS reserv_memberNo_fk FOREIGN KEY (memberNo) REFERENCES member,
	CONSTRAINTS reserv_reservNo_fk FOREIGN KEY (reservNo) REFERENCES reservation
);
DROP TABLE board;
CREATE TABLE board(
	bidx NUMBER NOT NULL PRIMARY KEY,
	subject VARCHAR(30),
	CONTENTS CLOB,
	writer VARCHAR(30),
	writeday DATE DEFAULT SYSDATE,
	viewCnt number,
	memberNo NUMBER NOT NULL,
	CONSTRAINTS board_memberNo_fk FOREIGN KEY (memberNo) REFERENCES member
);

SELECT * FROM reservation;
SELECT * FROM member;
SELECT * FROM board;
SELECT * FROM roomPrice;
DELETE FROM member;
DELETE FROM reservation;
delete FROM board;
DELETE FROM roomprice;

SELECT * FROM roomPrice WHERE reservYn = 'I';

UPDATE ROOMPRICE SET reservYn = 'Y';

COMMIT;

select a.roomNo, a.roomName, a.price, a.capacity, a.sqft, a.numOfRoom, b.reservYn
from room a, roomPrice b where a.roomno=b.roomno AND b.reservYn='I'
GROUP BY a.roomNo, a.roomName, a.price, a.capacity, a.sqft, a.numOfRoom, b.reservYn;


select a.roomNo, a.roomName, a.price, a.capacity, a.sqft, a.numOfRoom, b.reservYn, b.PRICEPERDAY
from room a, roomPrice b where a.roomno=b.roomno AND b.reservYn='Y' and b.date_ = '2023-04-25'
GROUP BY a.roomNo, a.roomName, a.price, a.capacity, a.sqft, a.numOfRoom, b.reservYn, b.PRICEPERDAY;


ALTER TABLE room DROP COLUMN price


UPDATE roomPrice SET reservYn = 'I' WHERE roomNo = (SELECT r.roomNo FROM reservation r WHERE r.checkIn = ?) AND DATE_ >= TO_DATE(?, 'YYYY-MM-DD') AND DATE_ < TO_DATE(?, 'YYYY-MM-DD') AND reservYn='Y';


select a.roomNo, a.roomName, a.price, a.capacity, a.sqft, a.numOfRoom, b.reservYn, b.pricePerDay, b.date_
from room a, roomPrice b where a.roomno=b.roomno and B.DATE_ between '2023-04-08' AND '2023-04-25'
GROUP BY a.roomNo, a.roomName, a.price, a.capacity, a.sqft, a.numOfRoom, b.reservYn ,b.pricePerDay order by a.roomNo ASC;

SELECT r.roomNo, r.roomName, r.price, r.capacity, r.sqft, r.numOfRoom, p.pricePerDay, p.reservYn, p.date_
FROM room r
JOIN roomPrice p ON r.roomNo = p.roomNo
WHERE p.date_ between '2023-04-08' AND '2023-04-25' -- 조회하려는 날짜
  AND p.reservYn = 'Y' -- 예약 가능한 방만 조회
GROUP BY r.roomNo
ORDER BY r.roomNo ASC;

  SELECT roomNo,reservYn
  FROM roomPrice
  WHERE (date_ BETWEEN '2023-04-08' AND '2023-04-25') AND reservYn = 'Y';

SELECT r.roomNo, r.roomName, r.price, r.capacity, r.sqft, r.numOfRoom, MAX(p.pricePerDay) AS pricePerDay, MAX(p.reservYn) as reservYn
FROM room r
JOIN roomPrice p ON r.roomNo = p.roomNo
WHERE p.date_ between '2023-04-09' AND '2023-04-20' -- 조회하려는 날짜
  AND p.reservYn = 'Y' -- 예약 가능한 방만 조회
  AND r.roomNo NOT IN (
    SELECT roomNo FROM roomPrice
    WHERE date_ between '2023-04-09' AND '2023-04-20' -- 이미 I로 예약된 방 제외
    AND reservYn = 'I'
  )
GROUP BY r.roomNo, r.roomName, r.price, r.capacity, r.sqft, r.numOfRoom
ORDER BY r.roomNo ASC;

SELECT r.roomNo, r.roomName, r.price, r.capacity, r.sqft, r.numOfRoom, p.pricePerDay, p.reservYn
FROM room r
JOIN (
  SELECT roomNo, MAX(pricePerDay) AS pricePerDay, MAX(reservYn) as reservYn
  FROM roomPrice
  WHERE date_ BETWEEN '2023-04-09' AND '2023-04-20'
    AND reservYn = 'Y'
    AND roomNo NOT IN (
      SELECT roomNo FROM roomPrice
      WHERE date_ BETWEEN '2023-04-09' AND '2023-04-20'
        AND reservYn = 'I'
    )
  GROUP BY roomNo
) p ON r.roomNo = p.roomNo
WHERE p.pricePerDay = (
  SELECT MIN(pricePerDay) FROM (
    SELECT DISTINCT pricePerDay
    FROM (
      SELECT roomNo, pricePerDay
      FROM roomPrice
      WHERE date_ BETWEEN '2023-04-09' AND '2023-04-20'
        AND reservYn = 'Y'
        AND roomNo NOT IN (
          SELECT roomNo FROM roomPrice
          WHERE date_ BETWEEN '2023-04-09' AND '2023-04-20'
            AND reservYn = 'I'
        )
      GROUP BY roomNo, pricePerDay
    )
  )
) OR p.pricePerDay = (
  SELECT DISTINCT pricePerDay
  FROM (
    SELECT roomNo, pricePerDay
    FROM roomPrice
    WHERE date_ BETWEEN '2023-04-09' AND '2023-04-20'
      AND reservYn = 'Y'
      AND roomNo NOT IN (
        SELECT roomNo FROM roomPrice
        WHERE date_ BETWEEN '2023-04-09' AND '2023-04-20'
          AND reservYn = 'I'
      )
    GROUP BY roomNo, pricePerDay
  )
  WHERE pricePerDay NOT IN (
    SELECT MIN(pricePerDay) FROM (
      SELECT DISTINCT pricePerDay
      FROM (
        SELECT roomNo, pricePerDay
        FROM roomPrice
        WHERE date_ BETWEEN '2023-04-09' AND '2023-04-20'
          AND reservYn = 'Y'
          AND roomNo NOT IN (
            SELECT roomNo FROM roomPrice
            WHERE date_ BETWEEN '2023-04-09' AND '2023-04-20'
              AND reservYn = 'I'
          )
        GROUP BY roomNo, pricePerDay
      )
    )
  )
)

SELECT *
FROM ROOM r, roomprice p
WHERE r.roomNo = p.roomNo and r.roomNo NOT IN (SELECT roomNo FROM roomprice WHERE DATE_ BETWEEN '2023-04-09' AND '2023-04-29' AND RESERVYN='I' GROUP BY ROOMNO)
ORDER BY r.roomNo ASC;

SELECT * FROM board1230;

DELETE FROM member1230;
DELETE FROM board1230;

COMMIT;

ALTER TABLE member1230 MODIFY memberpw VARCHAR2(70);

ALTER TABLE board1230 ADD fileName VARCHAR2(100);

DELETE FROM board1230 WHERE subject = 'test4';