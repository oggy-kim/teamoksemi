-- ADM 스타일게시판관리 리스트조회용 VIEW
CREATE OR REPLACE VIEW BLIST
AS SELECT ROWNUM RNUM, A.*
FROM(SELECT ARTICLE_NO, ARTICLE_CONTENTS, MEMBER_NICK, ARTICLE_DATE, ARTICLE_WISHES, ARTICLE_VIEWS 
FROM BOARD
JOIN MEMBER USING (MEMBER_NO)
ORDER BY ARTICLE_NO DESC)A;

