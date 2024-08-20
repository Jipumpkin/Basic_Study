-- CHAPTER 07. DML (Data Manipulation Language)

-- DML�̶�
--> ������ ���۾�� ���̺� �����͸� ��ȸ, �߰�, ����, ���� �� �� ����ϴ� ���Ǿ��̴�.
--> ���̺��� ���ϴ� �����͸� �Է�, ����, ���� �Ѵ�.


-- DML�� ����
-- SELECT : ������ ��ȸ
-- INSERT : ������ �߰�
-- UPDATE : ������ ����
-- DELETE : ������ ����

-- INSERT �����
-- INSERT INTO ���̺�� (�÷�1, �÷�2,...�÷�N)
-- VALUES (��1, ��2,...��N)
--> INSERT�� �Է��� �÷��� VALUES�� �Է��� ���� ������ �ڷ����� �°� ��ߵȴ�.

-- INSERT INTO ���̺��
-- VALUES (��,...)
--> INSERT �� �÷� ����Ʈ ������ DBMS�� �ش� ���̺��� �÷��� �� �ۼ��Ѱ����� �����ؼ�
--> �� ���̺��� �÷� ������ �ڷ����� �°� �� �ۼ��� �ؾ��Ѵ�.

SELECT * FROM INSA_JOIN;

-- 1. ���� ������ �ֱ�
INSERT INTO INSA_JOIN (ID, PW, NAME, REGISTER_DATE, AGE, TEL, EMAIL)
VALUES ('INSA01','12345','����ȣ',SYSDATE,22,'010-6511-7148','qsoqso24@gmail.com');

-- 2.���� ¦���� ������ �ֱ�
INSERT INTO INSA_JOIN (ID, PW, NAME, REGISTER_DATE, AGE, TEL, EMAIL)
VALUES ('INSA02','11111','������',SYSDATE,27,NULL,'');
-- NULL���� ��������� �־���.

-- 3. ���� ģ���� ������ �ֱ�
-- ��ȭ��ȣ�� �̸��� ������ null������ �Է� �Ұ�

INSERT INTO INSA_JOIN (ID, PW, NAME, REGISTER_DATE, AGE)
VALUES ('INSA03', '22222', '�̵���', SYSDATE, 22);
-- NULL���� �Ͻ������� �Է��ߴ�.

SELECT * FROM INSA_JOIN;

-----------------------------------------------------------------------------------
-- ���̺� ������ ���� �� ���� ����Ʈ 

-- 1. �÷�����Ʈ�� �Է� ���� ������ �ٸ� ���
INSERT INTO INSA_JOIN (ID, PW, NAME, REGISTER_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');
 
--  SQL ����: ORA-00913: too many values 
--> �÷� ����Ʈ�� ������ �Է� �� ������ ��ġ�ؾ� �Ѵ�!

-- 2. �ĺ��ڿ� NULL�� �Է��� ���
INSERT INTO INSA_JOIN (ID, PW, NAME, REGISTER_DATE, AGE, TEL, EMAIL)
 VALUES (NULL, '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."ID")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� (�ĺ��ڴ� NOT NULL + UNIQUE �ߺ��Ұ�)

-- 3. NOT NULL�� �÷��� NULL�� ���� ���
INSERT INTO INSA_JOIN (ID, PW, NAME, REGISTER_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."NAME")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� ( NOT NULL ���� )

-- 4. �ڷ����� ���� �ʰ� �Է� ���� ���� ���
INSERT INTO INSA_JOIN (ID, PW, NAME, REGISTER_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, '29��', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> �÷��� ���� �ڷ����� �°� �ۼ��� �Ǿ� �Ѵ�. (AGE�� ������ �ڷ���)

-- 5. �ĺ��� �÷��� �ߺ� ���� ���� ���� ���
INSERT INTO INSA_JOIN (ID, PW, NAME, REGISTER_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> ���� �� ���¿��� �ѹ��� ������ �Ǹ� �ĺ��ڰ� ���� �ߺ��� �Ǽ� ������ ��

SELECT * FROM INSA_JOIN;

------------------------------------------------------------------------------------

INSERT INTO INSA_JOIN
VALUES ('INSA04','33333','�Ź���',SYSDATE,20,'010-2295-0023','SIN@NAVER.COM');


CREATE TABLE INSA_SONGLIST (
    NO NUMBER(3) PRIMARY KEY,
    TITLE VARCHAR2(20) NOT NULL,
    SINGER VARCHAR2(20),
    GENDER VARCHAR2(10) CHECK (GENDER = '����' OR GENDER = '����')
);

INSERT INTO INSA_SONGLIST
VALUES(1,'���˹���','������','����');

INSERT INTO INSA_SONGLIST
VALUES(2,'RAINDROP','������','����');

INSERT INTO INSA_SONGLIST
VALUES(3,'ĵ��','HOT','����');


-- UPDATE : ���̺��� �����͸� �����ϰ� ������ ���

-- �����
--UPDATE ���̺��
--SET    ������ �÷� = �����Ͱ�, ......
--WHERE  �����͸� ������ ���� �����ϱ� ���� ���ǽ�;
--> ** WHERE �������� ������ ��� ���̺� �� ����� ��� �÷��� �����Ͱ� ������ �ȴ�.

SELECT * FROM INSA_JOIN;
UPDATE INSA_JOIN
SET AGE = 29
WHERE NAME = '�̵���';


--> ������ �ɶ��� PK�� �÷��� �Ŵ°��� �ùٸ� ����̴�.

-- DELETE
-- �����
-- DELETE FROM  ���̺��
-- WHERE        ������ ��� ���� �����ϱ� ���� ���ǽ� ; 
-- ** WHERE �������� ������ ��� ���̺��� ��� �����Ͱ� ������ �ȴ�..

-- 28�� ������ ȸ������ ������ ����

DELETE FROM INSA_JOIN
WHERE AGE <= 28;







