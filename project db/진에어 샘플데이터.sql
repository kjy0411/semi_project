-- 진에어 항공사 등록
INSERT INTO AIRLINE (AL_NAME) VALUES ('진에어');

-- 진에어 항공사 삭제
-- DELETE FROM AIRLINE WHERE AL_NAME = '진에어';

-- 비행기 등록 쿼리
INSERT INTO AIRPLANE (AP_NUM, AP_AL_NAME, AP_AM_MODEL)
VALUES
    ('KR101A', '진에어', 'B737'),
    ('KR102A', '진에어', 'B738'),
    ('KR103A', '진에어', 'B763'),
    ('KR104A', '진에어', 'B78X'),
    ('KR105A', '진에어', 'A320'),
    ('KR106A', '진에어', 'A333'),
    ('KR107A', '진에어', 'A388'),
    ('KR108A', '진에어', 'A148'),
    ('KR109A', '진에어', 'A158'),
    ('KR110A', '진에어', 'T204');

-- 비행기 삭제 쿼리
DELETE FROM AIRPLANE WHERE AP_NUM = '';

-- 진에어 노선 등록 쿼리
INSERT INTO ROUTE(RO_AI_START, RO_AI_END)
VALUES
	("ICN","CJU"), ("CJU","ICN"), ("ICN","KUV"), ("KUV","ICN"),
	("ICN","TAE"), ("TAE","ICN"), ("ICN","USN"), ("USN","ICN"),
	("CJU","KUV"), ("KUV","CJU"), ("CJU","TAE"), ("TAE","CJU"),
	("CJU","USN"), ("USN","CJU"), ("KUV","TAE"), ("TAE","KUV"),
	("KUV","USN"), ("USN","KUV"), ("TAE","USN"), ("USN","TAE"),
	("ICN","IAD"), ("ICN","IAD"), ("ICN","HND"), ("HND","ICN");

-- 스케쥴 등록 쿼리
INSERT INTO SCHEDULE (SK_AP_NUM, SK_RO_NUM, SK_START_TIME, SK_TIME, SK_PRICE)
VALUES
    ('KR101A', 1, '2023-09-15 08:00:00', '03:00:00', 300000), 
    ('KR102A', 2, '2023-09-15 15:00:00', '02:45:00', 280000),
    ('KR103A', 3, '2023-09-16 09:30:00', '03:30:00', 320000),
    ('KR104A', 4, '2023-09-16 16:30:00', '02:45:00', 290000);
