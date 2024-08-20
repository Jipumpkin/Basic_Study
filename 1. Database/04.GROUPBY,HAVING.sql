-- CHAPTER 04. GROUP BY / HAVING


-- �����Լ��� ����
-- ������ �Լ� : �Էµ� �ϳ��� ��� ����� �ϳ��� ������ �Լ�
--> ������, ������, ��¥��, ��ȯ��, NULL�����Լ�, �����Լ�
-- ������ �Լ� : ���� ���� �Է¹޾� �ϳ��� ��� ������ ����� �Ǵ� �Լ�
--> ������ �Լ��� "�����Լ�" ��� �θ���.

-- ������ �Լ�(�����Լ�)�� Ư¡
-- 1. �����Լ��� NULL���� �����ϴ� Ư���� ������ �ִ�.
-- 2. �����Լ��� �׷�ȭ(GROUP BY)�� �Ǿ� �ִ� ���¿����� ����� �����ϴ�.

-- �����Լ� ����
-- COUNT() : ������ �������� ���� ��ȯ
-- SUM() : ������ �������� �� ��ȯ
-- MAX() : ������ ������ �� �ִ� ��ȯ
-- MIN() : ������ ������ �� �ּҰ� ��ȯ
-- AVG() : ������ �������� ��� �� ��ȯ

--�������̺��� ����ID�� ���� ������ ��ȸ
SELECT COUNT(EMPLOYEE_ID)
  FROM EMPLOYEES;SELECT COUNT(EMPLOYEE_ID)
  FROM EMPLOYEES;
--GROUP BY(); �����Ȱ�

--> EMPLOYEES���̺��� �ϳ��� �׷����� �����ɷ� �ν��� �ϴ� ��

SELECT COUNT(EMPLOYEE_ID) -- 1���� ��
      , EMPLOYEE_ID -- 107���� ��
  FROM EMPLOYEES;
--> ����ϰ��� �ϴ� ���� ������ ���� �ʾƼ� ������ ����.
--> �ذ����� �׷���̷� Ư�� �÷��� �׷�ȭ ����� �ȴ�.

-- �������̺��� �μ�ID�� ���� ������ ��ȸ

SELECT COUNT(DEPARTMENT_ID)
  FROM EMPLOYEES;

-- COUNT�Լ��� *(�ƽ�Ÿ����ũ) ��밡��
--> �ٸ� �����Լ��� �Ұ���
--> *(�ƽ�Ÿ����ũ)�� ����ϸ� NULL������ �����ؼ� ����� ���ش�.

SELECT COUNT(*)
  FROM EMPLOYEES;
  

 
--����1) ���� ���̺��� �޿��� �� �հ踦 ��� (SUM�Լ�)
SELECT SUM(SALARY)
  FROM EMPLOYEES;
--����2) �������̺��� ������� �ִ� �޿��� �ּ� �޿��� ���
SELECT MAX(SALARY), MIN(SALARY)
  FROM EMPLOYEES;
--����3) �������̺��� �μ�ID�� 100�� ������ ��� �޿��� ��� (AVG�Լ�)
-- ������� �Ҽ��� 1���ڸ������� ���
SELECT ROUND(AVG(SALARY),1 )
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100;
 
 
 
 
 DROP TABLE �л��������� ;
DROP TABLE ���������� ; 
DROP TABLE ����ǥ ; 

CREATE TABLE ���������� (
�л�ID   VARCHAR2(9) PRIMARY KEY , 
�л��̸�  VARCHAR2(50) NOT NULL , 
�Ҽӹ�    VARCHAR2(5) 
); 

CREATE TABLE ����ǥ ( 
    �л�ID VARCHAR2(9) , 
    ����   VARCHAR2(30) , 
    ����   NUMBER  , 
    CONSTRAINT PK_����ǥ PRIMARY KEY(�л�ID , ����) , 
    CONSTRAINT FK_����ǥ FOREIGN KEY(�л�ID) REFERENCES ����������(�л�ID) 
)  ; 

INSERT INTO ���������� VALUES ('SMHRD1' , '���ؿ�' , 'A') ; 
INSERT INTO ���������� VALUES ('SMHRD2' , '�ڼ���' , 'A') ; 
INSERT INTO ���������� VALUES ('SMHRD3' , '�ں���' , 'B') ; 
INSERT INTO ���������� VALUES ('SMHRD4' , '�̸���' , 'B') ; 
INSERT INTO ���������� VALUES ('SMHRD5' , '����ȣ' , 'B') ; 
INSERT INTO ���������� VALUES ('SMHRD6' , '����ǥ' , 'C') ; 
INSERT INTO ���������� VALUES ('SMHRD7' , '�ֿ�ȭ' , 'C') ; 
INSERT INTO ���������� VALUES ('SMHRD8' , '����ȣ' , 'C') ; 
INSERT INTO ���������� VALUES ('SMHRD9' , '�ӽ�ȯ' , 'C') ; 

INSERT INTO ����ǥ VALUES('SMHRD1'  ,'JAVA' , 90); 
INSERT INTO ����ǥ VALUES('SMHRD1'  ,'DATABASE' , 85); 
INSERT INTO ����ǥ VALUES('SMHRD1'  ,'PYTHON' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD2'  ,'JAVA' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD2'  ,'DATABASE' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD2'  ,'PYTHON' , 20); 
INSERT INTO ����ǥ VALUES('SMHRD3'  ,'JAVA' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD3'  ,'DATABASE' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD3'  ,'PYTHON' , 20); 
INSERT INTO ����ǥ VALUES('SMHRD4'  ,'JAVA' , 85); 
INSERT INTO ����ǥ VALUES('SMHRD4'  ,'DATABASE' , 40); 
INSERT INTO ����ǥ VALUES('SMHRD4'  ,'PYTHON' , 60); 
INSERT INTO ����ǥ VALUES('SMHRD5'  ,'JAVA' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD5'  ,'DATABASE' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD5'  ,'PYTHON' , 100); 
INSERT INTO ����ǥ VALUES ( 'SMHRD6' , 'JAVA' , NULL ) ; 
INSERT INTO ����ǥ VALUES ( 'SMHRD6' , 'DATABASE' , NULL ) ; 
INSERT INTO ����ǥ VALUES ( 'SMHRD6' , 'PYTHON' , NULL ) ; 

COMMIT;








DROP TABLE �л��������� ;
DROP TABLE ���������� ; 
DROP TABLE ����ǥ ; 

CREATE TABLE ���������� (
�л�ID   VARCHAR2(9) PRIMARY KEY , 
�л��̸�  VARCHAR2(50) NOT NULL , 
�Ҽӹ�    VARCHAR2(5) 
); 

CREATE TABLE ����ǥ ( 
    �л�ID VARCHAR2(9) , 
    ����   VARCHAR2(30) , 
    ����   NUMBER  , 
    CONSTRAINT PK_����ǥ PRIMARY KEY(�л�ID , ����) , 
    CONSTRAINT FK_����ǥ FOREIGN KEY(�л�ID) REFERENCES ����������(�л�ID) 
)  ; 

INSERT INTO ���������� VALUES ('SMHRD1' , '���ؿ�' , 'A') ; 
INSERT INTO ���������� VALUES ('SMHRD2' , '�ڼ���' , 'A') ; 
INSERT INTO ���������� VALUES ('SMHRD3' , '�ں���' , 'B') ; 
INSERT INTO ���������� VALUES ('SMHRD4' , '�̸���' , 'B') ; 
INSERT INTO ���������� VALUES ('SMHRD5' , '����ȣ' , 'B') ; 
INSERT INTO ���������� VALUES ('SMHRD6' , '����ǥ' , 'C') ; 
INSERT INTO ���������� VALUES ('SMHRD7' , '�ֿ�ȭ' , 'C') ; 
INSERT INTO ���������� VALUES ('SMHRD8' , '����ȣ' , 'C') ; 
INSERT INTO ���������� VALUES ('SMHRD9' , '�ӽ�ȯ' , 'C') ; 

INSERT INTO ����ǥ VALUES('SMHRD1'  ,'JAVA' , 90); 
INSERT INTO ����ǥ VALUES('SMHRD1'  ,'DATABASE' , 85); 
INSERT INTO ����ǥ VALUES('SMHRD1'  ,'PYTHON' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD2'  ,'JAVA' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD2'  ,'DATABASE' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD2'  ,'PYTHON' , 20); 
INSERT INTO ����ǥ VALUES('SMHRD3'  ,'JAVA' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD3'  ,'DATABASE' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD3'  ,'PYTHON' , 20); 
INSERT INTO ����ǥ VALUES('SMHRD4'  ,'JAVA' , 85); 
INSERT INTO ����ǥ VALUES('SMHRD4'  ,'DATABASE' , 40); 
INSERT INTO ����ǥ VALUES('SMHRD4'  ,'PYTHON' , 60); 
INSERT INTO ����ǥ VALUES('SMHRD5'  ,'JAVA' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD5'  ,'DATABASE' , 100); 
INSERT INTO ����ǥ VALUES('SMHRD5'  ,'PYTHON' , 100); 
INSERT INTO ����ǥ VALUES ( 'SMHRD6' , 'JAVA' , NULL ) ; 
INSERT INTO ����ǥ VALUES ( 'SMHRD6' , 'DATABASE' , NULL ) ; 
INSERT INTO ����ǥ VALUES ( 'SMHRD6' , 'PYTHON' , NULL ) ; 

COMMIT;









SELECT * FROM ����������;
  
SELECT * FROM ����ǥ;


--  GROUP BY : Ư�� �÷��� �������� �׷�ȭ (����)

-- 4.SELECT     ���ϴ� �÷���
-- 1.FROM       ��ȸ�� ���̺��
-- 2.WHERE      ���ϴ� ���� �����ϱ� ���� ���ǽ�
-- 3.GROUP BY   Ư�� �÷��� �������� �׷�ȭ

--������ ���� ���̺��� �Ҽӹ� �� �л��� �ο����� ��ȸ

SELECT �Ҽӹ�, COUNT(�л�ID) 
  FROM ����������
GROUP BY �Ҽӹ� ;

-- ����??
-- SQL�� �ۼ� ����
-- SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY
-- *** SQL ���� ����
-- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY
-- �ۼ� ������ ���� ������ �ٸ���.

-- ����ǥ ���̺��� ���񺰷� �ְ� ������ ���� ������ ���

SELECT ����, MAX(����), MIN(����)
  FROM ����ǥ
GROUP BY ����;

-- �׷���� ���� ����Ҷ� ��������
-- 1. ���� ��µǴ� ���� �����ϱ� ������ �׷���� ������ �ʰ� ����Ǵ�����
-- HAVING, SELECT, ORDER BY������ ��� �Ҽ� �ִ� ���� ���ѵȴ�.
-- 2. ��� �����Լ��� ó���ϴ� �÷��� ����� �����ϴ�.



-- ����ǥ ���̺��� �л����� ��� ������ ���
-- �� �Ҽ��� 1�ڸ������� ���

SELECT �л�ID, ROUND(AVG(����), 1)
  FROM ����ǥ
GROUP BY �л�ID;


-- ����ǥ ���̺��� �л����� JAVA�� DATABASE�� ������ �ո� ���

SELECT �л�ID, SUM(����)
  FROM ����ǥ
-- WHERE ���� = 'JAVA' OR ���� = 'DATABASE'
 WHERE ���� IN ('JAVA','DATABASE')
GROUP BY �л�ID;



-- HAVING�� : GROUP BY���� �����Ҷ��� ��밡��
--> ���谡 �Ϸ�� ����� ������ ���ؼ� ���͸� �ϴ� ����
--> ������ ���� ����� ����� �ȴٴ� �������� WHERE���� ���������,
-- HAVING���� �׷�ȭ�� ��󿡼� ����� �ȴ�.

--����) ����ǥ ���̺��� �л��� ��� ������ ���ϰ�,
-- ��� ������ 75 ������ �л��鸸 ���

SELECT �л�ID, ROUND(AVG(����), 1)
  FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) <= 75;



-- ������ �������̺��� �Ҽӹݺ� �ο����� 3���̻��� �ݸ� ���

SELECT �Ҽӹ�, COUNT(�л�ID)
  FROM ����������
GROUP BY �Ҽӹ�
HAVING COUNT(�л�ID) >= 3;

-- �������̺��� �μ��� �ְ����� 100000�� �μ��� ���

SELECT DEPARTMENT_ID, MAX(SALARY)*12 AS �ְ���10���̻�
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY)*12>=100000;












































