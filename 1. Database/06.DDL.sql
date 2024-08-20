-- CHAPTER 06. DDL(Data Difinition Language)

-- DDL�̶� 
--������ ���Ǿ�� ���̺� ���� ����� ��ü�� ����ų� �����ϴ� ���

-- [DDL ��ɾ� ����]
-- CREATE   : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- ALTER    : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- RENAME   : ���̺��� �̸��� �����ϴ� ��ɾ�
-- TRUNCATE : ���̺��� �����͸� �����ϴ� ��ɾ�
-- DROP     : ���̺��� ��ü�� �����ϴ� ��ɾ�

-- ���̺� ������ ���� ����ϴ� �ڷ���
-- VARCHAR (N) : ������ ������, Nũ�⸸ŭ �Է� ����
-- NUMBER (P,S) : ������ ���� P�ڸ���ŭ �Է¹ް� ���� S�ڸ���ŭ �Ҽ��� �Է¹���
--> ����Ŭ �����ͺ��̽��� �Ǽ��� ���� ��� ǥ���� ����
--> �Ұ�ȣ�� �����ϰ� �Ǹ� �ִ밪�� 38 ũ�Ⱑ ��
-- DATE : ���� ��¥ ���� �Է� ����

--  ���������� ���̺��� Ȯ���ؼ� TEST_���������� ��� ���̺��� ������
--> ���������� ���̺���� ������ SHIFT + F4 ������ ���̺� ���� Ȯ�� ����


CREATE TABLE TEST_���������� (
    �л�ID VARCHAR2(9),
    �л��̸� VARCHAR2(50),
    �Ҽӹ� VARCHAR2(5)
);

SELECT * FROM TEST_����������;

-- ����ǥ ���̺��� Ȯ���ؼ� TEST_����ǥ ��� ���̺��� ������
CREATE TABLE TEST_����ǥ (
    �л�ID VARCHAR2(9),
    ���� VARCHAR2(30),
    ���� NUMBER
);



CREATE TABLE INSA_LOGIN (
    ID VARCHAR2(20),
    PW VARCHAR2(20),
    EMAIL VARCHAR2(20),
    NAME VARCHAR2(20)
);

DROP TABLE INSA_LOGIN;


-- ���������̶� ?
--> ���̺� �Է� ������ �����͸� �������� �����ϴ°�
--> �������� ��Ȯ���� �����ϱ� ���� �������� ����
--> ���� ���� ���� ��Ŀ� ���� �������� �����̳� ���� ���ο� ������ ����

-- [ ���� ������ ���� ]
-- PRIMARY KEY(PK)  : �⺻Ű, NOT NULL + UNIQUE -> NULL�Ұ� + �ߺ��Ұ�
-- UNIQUE KEY (UK)  : ����Ű, NULL�� �Է� ����. �ߺ��� �Ұ�
-- NOT NULL         : NULL�� �Ұ���, �� �����ʹ� �� ���� �� �� ����ϴ� ��
-- CHEAK            : ������ �����͸� �Է� ����
-- FOREIGN KEY (FK) : �ܷ�Ű , �� ���̺��� �����ϴ� Ű

-- �������� �Ŵ� ���
-- ALTER TABLE ���̺�� ADD COMSTRAINT ���������̸� �������� (�÷���);



-- ���̺� PK �������� �����ϱ�
SELECT * FROM INSA_LOGIN ;

ALTER TABLE INSA_LOGIN ADD CONSTRAINT INSA_ID_PK PRIMARY KEY (ID);

-- ���̺��� UK �������� �����ϱ�

ALTER TABLE INSA_LOGIN ADD CONSTRAINT EMAIL_UK UNIQUE (EMAIL) ;


-- ���̺� CHEAK ���� ���� �����ϱ�
ALTER TABLE INSA_LOGIN ADD CONSTRAINT PW_CK CHECK(LENGTH(PW) > 3);

-- ���̺� FK ���������� �����ϱ�
-- ALTER TABLE ���̺�� ADD CONSTRAINT ���������̸� �������� (�ش��÷�)
-- REFERENCES �������̺�� (������ �÷�);

ALTER TABLE TEST_����ǥ ADD CONSTRAINT �л�ID_FK FOREIGN KEY(�л�ID)
REFERENCES ����������(�л�ID) ;

-- �������� ����
-- ALTER TABLE ���̺�� MODIFY �÷��� �ٲ��������� ;

ALTER TABLE INSA_LOGIN MODIFY NAME NOT NULL;

-- �������� ����
-- ALTER TABLE ���̺�� DROP CONSTRAINT �������� �̸�;
ALTER TABLE INSA_LOGIN DROP CONSTRAINT PW_CK ;

-- ������ ���Ἲ�̶�?
--> �������� ������ ���� ���¸� �ǹ�
--> �� �����Ͱ� ��Ȯ�ϰ� ��ȿ�ϰ� ���� �� ����

-- ���Ἲ �������� ����

-- ��ä ���Ἲ(PK) : �⺻Ű �����̶�� �ϸ�, �ϳ��� ���̺� �ߺ��� ���� �������� �ʵ��� ����

-- ���� ���Ἲ(FK) : ���� �Է�, ����, ���� �Ҷ� �����Ǿ��ִ� �ٸ� ���̺����
--                  �����Ͱ� ��Ȯ�ϰ� �����ǵ��� ����.


CREATE TABLE TB_TEST1 (
    PK�׽�Ʈ NUMBER PRIMARY KEY,
    UK�׽�Ʈ NUMBER UNIQUE,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER CHECK(LENGTH(CK�׽�Ʈ) > 5)
);

DROP TABLE TB_TEST1;

CREATE TABLE TB_TEST2 (
    PK�׽�Ʈ NUMBER,
    UK�׽�Ʈ NUMBER,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER,
    FK�׽�Ʈ NUMBER,
    CONSTRAINT PK�׽�Ʈ_PK PRIMARY KEY (PK�׽�Ʈ),
    CONSTRAINT UK�׽�Ʈ_UK UNIQUE (UK�׽�Ʈ),
    CONSTRAINT CK�׽�Ʈ_CK CHECK (CK�׽�Ʈ > 0),
    CONSTRAINT FK�׽�Ʈ_FK FOREIGN KEY (FK�׽�Ʈ) REFERENCES TB_TEST1 (PK�׽�Ʈ)
);


DROP TABLE TB_TEST2;



-- ���̺��� �÷� �߰� �ϱ�
-- ALTER TABLE ���̺���� ADD �÷��� �ڷ���(ũ��) ; 

ALTER TABLE INSA_LOGIN ADD PHONE_NUMBER VARCHAR2(10);

-- �÷� �̸� �����ϱ�
-- ALTER TABLE ���̺�� RENAME COLUMN �����÷��� TO �ٲ��÷��� ;
ALTER TABLE INSA_LOGIN RENAME COLUMN PHONE_NUMBER TO TEL;

-- �÷��� �ڷ����� �����ϱ�
-- ALTER TABLE ���̺�� MODIFY �÷��� �ٲ���������(����);\
ALTER TABLE INSA_LOGIN MODIFY TEL VARCHAR(20) ;

-- Ư�� �÷� �����ϱ�
-- ALTER TABLE ���̺� �� DROP COULMN �÷���;
ALTER TABLE INSA_LOGIN DROP COLUMN TEL;

-- ���̺� �̸� �����ϱ�
-- RENAME ���� ���̺� �̸� TO �ٲ� ���̺� �̸�
RENAME INSA_LOGIN TO IN_LOGIN ;

-- ���̺� �����ϱ�
-- DROP TABLE ���̺��;
DROP TABLE TEST_����������;

-- TRUNCATE : ������ ���� ����
-- DELETE : ������ ����

-- DLELET ���̺��̸� ;



-- ���̺� �����ϴ� ������
CREATE TABLE DROP_����ǥ AS SELECT * FROM ����ǥ;
SELECT * FROM DROP_����ǥ;


DELETE DROP_����ǥ ;

ROLLBACK; -- �ǵ����� ��ɾ�

TRUNCATE TABLE DROP_����ǥ;



CREATE TABLE INSA_JOIN(
    ID VARCHAR2(20) PRIMARY KEY,
    PW VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(10) NOT NULL,
    REGISTER_DATE DATE,
    AGE NUMBER(3),
    TEL VARCHAR2(20),
    EMAIL VARCHAR2(50) UNIQUE
);









