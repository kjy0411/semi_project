-- 항공사를 등록하는 쿼리
INSERT INTO AIRLINE(AL_NAME) VALUES("아시아나항공");

-- 항공사를 삭제하는 쿼리
DELETE FROM AIRlINE WHERE AL_NAME = "아시아나항공";

-- 비행기를 등록하는 쿼리
INSERT INTO AIRPLANE(AP_NUM, AP_AL_NAME, AP_AM_MODEL)
VALUES
	("HL5320" ,"아시아나항공", "B737"),
	("HL5321" ,"아시아나항공", "B737"),
	("HL5322" ,"아시아나항공", "B737"),
	("HL5323" ,"아시아나항공", "B737"),
	("HL5324" ,"아시아나항공", "B737"),
	("HL5325" ,"아시아나항공", "B737"),
	("HL5630" ,"아시아나항공", "B763"),
	("HL5631" ,"아시아나항공", "B763"),
	("HL5780" ,"아시아나항공", "B78X"),
	("HL5781" ,"아시아나항공", "B78X");

-- 비행기를 삭제하는 쿼리
DELETE FROM AIRPLANE WHERE AP_NUM = "";

INSERT INTO ROUTE(RO_AI_START, RO_AI_END)
VALUES
	("ICN","CJU"), ("CJU","ICN"), ("ICN","KUV"), ("KUV","ICN"),
	("ICN","TAE"), ("TAE","ICN"), ("ICN","USN"), ("USN","ICN"),
	("CJU","KUV"), ("KUV","CJU"), ("CJU","TAE"), ("TAE","CJU"),
	("CJU","USN"), ("USN","CJU"), ("KUV","TAE"), ("TAE","KUV"),
	("KUV","USN"), ("USN","KUV"), ("TAE","USN"), ("USN","TAE"),
	("ICN","IAD"), ("ICN","IAD"), ("ICN","HND"), ("HND","ICN");