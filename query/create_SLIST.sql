-- ADM 제휴쇼핑몰관리페이지 목록조회용 뷰 SLIST 
CREATE OR REPLACE VIEW SLIST
AS SELECT ROWNUM RNUM, A.*
FROM(SELECT SHOP_NO, SHOP_NAME, SHOP_STATUS, SHOP_GRADE_CODE, CONTRACT_DATE, EXPIRE_DATE, CONTRACT_MONEY, SHOP_CONTACT 
FROM SHOPLIST
ORDER BY SHOP_NO DESC)A;

