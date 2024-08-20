-- ��ü(object)

-- VIEW��
-- �ϳ� �̻��� ���̺��� ���� ������ ���� ��������� '������ ���̺�'

-- ���� ��� ����
-- ���� : ���� ����ϴ� SELECT ������ �����ϱ� ���� ���
-- ���ȼ� : ���̺��� Ư�� �����͸� �����Ű�� �ʱ� ���� ���

-- �� ���� �ϴ� ���
-- CREATE VIEW �� �̸�
-- AS ������ SELECT ��

-- ������� ���� (����ID, �̸�, �̸���, �������̵�, �޿�)
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, JOB_ID, SALARY
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100;

-- �� ���� : VIEW_EMP100

CREATE VIEW VIEW_EMP100
AS SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, JOB_ID, SALARY
     FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100;


-- ������ ���̺� ��ȸ
SELECT * FROM VIEW_EMP100;



-- ��������?
-- Ư�� ��Ģ�� �´� ���Ӽ��ڸ� �����ϴ� ��ü
-- ��� ����ǥó�� ��� ����ȣ�� ������ִ� ������ �Ѵ�
-- �ַ� PK �÷����� ������ ���� ���鶧 ���

-- ������ �����
-- ������ �̸�.CURRVAL : ������ ���� ��ȣ�� ��ȯ
-- ������ �̸�.NEXTVAL : ���� ��ȣ�� ��ȯ

-- ������ ����
CREATE SEQUENCE ��������
INCREMENT BY 1 --1�� �����ϰڴ�
START WITH 10 -- ���۹�ȣ�� 10���� �����ϰڴ�.
MAXVALUE 20 -- 20������ ��ȣ�� �ްڴ�.
MINVALUE 0
NOCYCLE ; -- �ƽ�������� �����ϸ� �ߴ��ϰڴ�.
   
-- ������ ��ȸ
SELECT * FROM USER_SEQUENCES;

CREATE TABLE BK_SEQUENCE (
   ID NUMBER PRIMARY KEY ,
   NAME VARCHAR2(10),
   CLASS VARCHAR2(50)
);


-- ������ Ȱ���غ���

INSERT INTO BK_SEQUENCE ( ID, NAME, CLASS )
 VALUES (��������.NEXTVAL, '���ؿ�', '����ݽ�����');
 
SELECT * FROM BK_SEQUENCE;

INSERT INTO BK_SEQUENCE ( ID, NAME, CLASS )
 VALUES (��������.NEXTVAL, '����ȭ', '����ݽ�����');



















