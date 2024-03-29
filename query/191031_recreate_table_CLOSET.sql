DROP TABLE "CLOSET";

DROP SEQUENCE SEQ_CLOTH;

CREATE TABLE "CLOSET" (
	"CLOTH_NO"	NUMBER NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
    "TYPE_CODE"	VARCHAR2(20)		NOT NULL,
    "STYLE_CODE" VARCHAR2(30) NOT NULL,
    "COLOUR_CODE"	VARCHAR2(30)		NOT NULL,
	"FIT_CODE"	VARCHAR2(10)		NOT NULL,
	"SEASON_CODE"	VARCHAR2(10)		NOT NULL,
	"CLOTH_NAME"	VARCHAR2(100)		NULL,
	"CLOTH_BUYDATE"	DATE		NULL,
	"CLOTH_MEMO"	VARCHAR2(200)		NULL,
	"CLOTH_STATUS"	VARCHAR2(10)	DEFAULT 'Y' 	NULL,
    "LIKE_STATUS" VARCHAR2(3) DEFAULT 'N',
    "CHANGE_DATE" DATE DEFAULT SYSDATE
);

CREATE SEQUENCE SEQ_CLOTH;

INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'HOOD', '1,2', '255,255,255', 'SLIM', 'SF', '�����ٳ�', '2019-10-01', 'ù��', DEFAULT, DEFAULT, '2019-10-01');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'PADDING', '3,6', '10,10,10', 'BASIC', 'SF', 'ž��', '2019-10-02', '�ѿ�', DEFAULT, DEFAULT, '2019-10-02');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'HOOD', '1,7', '15,15,15', 'SLIM', 'SF', '�����ٳ�', '2019-10-03', '3��', DEFAULT, 'Y', '2019-10-03');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'HOOD', '1,10', '25,25,25', 'OVERFIT', 'SF', '����', '2019-10-04', '4��', DEFAULT, DEFAULT, '2019-10-04');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 2, 'PADDING', '3,6', '10,10,10', 'BASIC', 'SF', 'ž��', '2019-10-02', '�ѿ�', DEFAULT, DEFAULT, '2019-10-02');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 2, 'HOOD', '5,7', '15,15,15', 'SLIM', 'SF', '�����ٳ�', '2019-10-03', '3��', DEFAULT, DEFAULT, '2019-10-03');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 2, 'HOOD', '1,10', '25,25,25', 'OVERFIT', 'SF', '����', '2019-10-04', '4��', DEFAULT, 'Y', '2019-10-04');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'HOOD', '1,14', '35,35,35', 'SLIM', 'WI', '����', '2019-10-05', '5��', DEFAULT, DEFAULT, '2019-10-05');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'HOOD', '1,3', '50,50,50', 'SLIM', 'SU', '�����ٳ�', '2019-10-06', '6��', DEFAULT, DEFAULT, '2019-10-06');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'HOOD', '6,7', '100,100,100', 'SLIM', 'SF', '���Ż�', '2019-10-07', '7��', DEFAULT, DEFAULT, '2019-10-07');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'HOOD', '1,3', '110,0,110', 'SLIM', 'SF', '�����ٳ�', '2019-10-08', '8��', DEFAULT, 'Y', '2019-10-08');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'HOOD', '1,3', '255,0,255', 'SLIM', 'SF', '�����ٳ�', '2019-10-09', '9��', 'N', DEFAULT, '2019-10-09');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'HOOD', '1,3', '255,255,0', 'SLIM', 'SF', '�����ٳ�', '2019-10-10', '10��', DEFAULT, DEFAULT, '2019-10-10');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'JEAN', '1,3', '255,255,255', 'SLIM', 'SF', '�����ٳ�', '2019-10-01', 'ù��', DEFAULT, DEFAULT, '2019-10-01');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'LSKIRT', '1,6', '10,10,10', 'BASIC', 'SF', 'ž��', '2019-10-02', '�ѿ�', DEFAULT, DEFAULT, '2019-10-02');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'SSKIRT', '1,7', '15,15,15', 'SLIM', 'SF', '�����ٳ�', '2019-10-03', '3��', DEFAULT, DEFAULT, '2019-10-03');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'COTTON', '1,10', '25,25,25', 'OVERFIT', 'SF', '����', '2019-10-04', '4��', DEFAULT, 'Y', '2019-10-04');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 2, 'JEAN', '1,3', '10,10,10', 'BASIC', 'SF', 'ž��', '2019-10-02', '�ѿ�', DEFAULT, DEFAULT, '2019-10-02');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 2, 'JEAN', '1,7', '15,15,15', 'SLIM', 'SF', '�����ٳ�', '2019-10-03', '3��', DEFAULT, DEFAULT, '2019-10-03');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 2, 'JEAN', '1,10', '25,25,25', 'OVERFIT', 'SF', '����', '2019-10-04', '4��', DEFAULT, DEFAULT, '2019-10-04');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'JEAN', '2,14', '35,35,35', 'SLIM', 'WI', '����', '2019-10-05', '5��', DEFAULT, DEFAULT, '2019-10-05');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'JEAN', '3,13', '50,50,50', 'SLIM', 'SU', '�����ٳ�', '2019-10-06', '6��', DEFAULT, DEFAULT, '2019-10-06');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'JEAN', '2,7', '100,100,100', 'SLIM', 'SF', '���Ż�', '2019-10-07', '7��', DEFAULT, DEFAULT, '2019-10-07');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'JEAN', '1,3', '110,0,110', 'SLIM', 'SF', '�����ٳ�', '2019-10-08', '8��', DEFAULT, DEFAULT, '2019-10-08');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'JEAN', '1,3', '255,0,255', 'SLIM', 'SF', '�����ٳ�', '2019-10-09', '9��', 'N', DEFAULT, '2019-10-09');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'JEAN', '1,3', '255,255,0', 'SLIM', 'SF', '�����ٳ�', '2019-10-10', '10��', DEFAULT, DEFAULT, '2019-10-10');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'SNEAKERS', '2,7', '100,100,100', 'SLIM', 'SF', '���Ż�', '2019-10-07', '7��', DEFAULT, DEFAULT, '2019-10-07');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'SCARF', '1,3', '110,0,110', 'SLIM', 'SF', '�����ٳ�', '2019-10-08', '8��', DEFAULT, DEFAULT, '2019-10-08');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'CAP', '2,3', '255,0,255', 'SLIM', 'SF', '�����ٳ�', '2019-10-09', '9��', 'N', DEFAULT, '2019-10-09');
INSERT INTO CLOSET VALUES(SEQ_CLOTH.NEXTVAL, 3, 'CAP', '2,3', '255,255,0', 'SLIM', 'SF', '�����ٳ�', '2019-10-10', '10��', DEFAULT, 'Y', '2019-10-10');

COMMENT ON COLUMN CLOSET.CLOTH_NO IS '�ʹ�ȣ';
COMMENT ON COLUMN CLOSET.MEMBER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN CLOSET.TYPE_CODE IS 'Ÿ���ڵ�';
COMMENT ON COLUMN CLOSET.STYLE_CODE IS '��Ÿ���ڵ�';
COMMENT ON COLUMN CLOSET.COLOUR_CODE IS 'Į���ڵ�';
COMMENT ON COLUMN CLOSET.FIT_CODE IS '���ڵ�';
COMMENT ON COLUMN CLOSET.SEASON_CODE IS '�����ڵ�';
COMMENT ON COLUMN CLOSET.CLOTH_NAME IS '���̸�';
COMMENT ON COLUMN CLOSET.CLOTH_BUYDATE IS '�ʱ�������';
COMMENT ON COLUMN CLOSET.CLOTH_MEMO IS '����޸�';
COMMENT ON COLUMN CLOSET.CLOTH_STATUS IS '�ʻ�������';
COMMENT ON COLUMN CLOSET.LIKE_STATUS IS '��ȣ����';
COMMENT ON COLUMN CLOSET.CHANGE_DATE IS '����������';

ALTER TABLE "CLOSET" ADD CONSTRAINT "PK_CLOSET" PRIMARY KEY (
	"CLOTH_NO"
);