ALTER TABLE QNA MODIFY (ENROLL_DATE DEFAULT SYSDATE);
ALTER TABLE QNA MODIFY (ANSWER_CONTENTS DEFAULT '미등록');

ALTER TABLE QNA
DROP CONSTRAINT PK_QNA;

ALTER TABLE QNA
ADD CONSTRAINT PK_QNA PRIMARY KEY(QNA_NO);