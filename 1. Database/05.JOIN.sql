-- CHAPTER 05. JOIN

-- JOIN : ���� ���̺��� �ʿ��� �����͸� �ѹ��� �������� ���

-- �� ���� (Non EQUI JOIN)
--> �� ���� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ���� ���� ��� Ȱ���ϴ� ����
--> �������(=) �� �ƴ� �����ڵ��� ����� ������ �ǹ�(>,>=,<,<=,BETWEEN)

--> � ���� (EQUI JOIN)
--> �ΰ��� ���̺��� ���� ��Ȯ�ϰ� ��ġ�ϴ� ��� Ȱ��Ǵ� ����
--> ������ڸ� ����ؼ� ������ �ǹ� (=)
--> ���� ���� ���Ǵ� ����

-- ������� �����
--SELECT ���̺�1.�÷���, ���̺�2.�÷���
--  FROM ���̺�1, ���̺�2 --> ���̺�1�� ���̺�2�� JOIN �ϰڴ�.
-- WHERE ���̺�1.�÷��� = ���̺�2.�÷��� ; --> ���� ������ ���

-- ���������� ���̺�� ����ǥ ���̺��� �л�ID, �л��̸�, ����, ���� ������ ���

--1. ������ ��� ���̺��� ������ Ȯ��
--2. FROM���� ������ ���̺��� ,(�ĸ�) �������� �ۼ�
--3. ���� ������ �Ǵ� Ư�� �÷��� Ȯ���Ͽ�, WHERE �������� ���� ������ �ۼ�
--> ���������� �Ǵ� Ư�� �÷� : ������ ���̺� ���� ���� ��� ���� ������ �÷�
--> ���������� �Ǵ� �÷��� ��κ� PK�� FK ����� �̷������.(���δ� �ƴ�)
--4. SELECT ���� ����ϰ��� �ϴ� �÷��� �ۼ�


SELECT * FROM ����������;


SELECT ��.�л�ID , ��.�л��̸� , ��.���� , ��.����
  FROM ���������� ��, ����ǥ ��
 WHERE ��.�л�ID = ��.�л�ID ;
 
 
-- ������ ����ID, FIRST_NAME, DEPARTMENT_NAME ������ ���

SELECT * FROM EMPLOYEES;

SELECT * FROM DEPARTMENTS;

SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME
     , D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID ;
 
 
-- �������̵� 100�� ������ �̸� �μ��̸��� ���

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.EMPLOYEE_ID = 100;
 
-- ASNI ���ι��� : �̱� ǥ����ȸ���� ���� ��� DBMS���� ��밡���� ���� �����̴�.

-- INNER JOIN : �������� �̶�� �ϸ�, ���� ���ǿ��� ������ ���� �ִ� �ุ ��ȯ
-- EQUI(�����)�� ������ ����


-- INNER JOIN�� �����
--SELECT 
--  FROM ���̺�1 INNER JOIN  ���̺�2 -> ���̺� INNER JOIN �ϰڴ�.
--    ON ( ���̺�1.�÷� = ���̺�2.�÷� ) -> ���� ������ ���
-- WHERE �Ϲ� ������ ��� -> ���� ���� �� ������ ���


-- �������̺��� ����ID, �μ�ID, 
-- �μ����̺��� �μ��̸��� ���

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);


-- ������ ���̺��� �ܵ� �÷��̸� SELECT���� .(���)�� �������൵ ���������
-- ������ �������� ���� ���°����� ����

-- ���� ������ �Ǵ� �÷��� PK�� FK����� ���� �̷������.
-- ������ ��� �׷����� �ʴ�.(����)




-- ����ID, ����ID, ���� Ÿ�̺��� ������ ������� ���

SELECT * FROM JOBS;

SELECT E.EMPLOYEE_ID, E.JOB_ID, J.JOB_TITLE
  FROM EMPLOYEES E JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID;
    

-- CROSS JOIN : ���� �������� �����ʰ� ���̺��� ��� �����͸� ������ ���� ���
--> ���� ������ ���� ��� ����� �ִ� ��� �������� ������ ��ȸ
--> īƼ�� �� �̶�� �θ���.
--> īƼ�� �� : ��� ����� ���� ������ ��

-- �������̺��� ����ID, �μ�ID
-- �μ����̺��� �μ��̸��� ��� (CROSS JOIN)

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D;
  
-- CROSS�� ���������ϸ� ON�� ������ CROSS JOIN�̴�.
-- ���� ���� �Ⱦ�
-- �������̺��� ��(107) ���ϱ� �μ����̺��� ��(27) = 2889���� ���� ��� (īƼ�� ��)



-- OUTER JOIN : �ܺ������̶�� �ϸ�, �ΰ��� ���̺� ���� �������� ��ȸ�ϰ�
-- ���� ���̺��� �ִ� �����͵� ���Խ��Ѽ� ��ȸ�ϰ� ������ ����ϴ� ���� ����
--> ���� �������� NULL���� ����ϰ��� �Ҷ� ����ϴ°�

-- LEFT OUTER JOIN : ���� ���̺��� �������� NLUU���� �����Ͽ� ���
-- ����Ŭ ���� ���ν� : ���������� �ݴ��� ������ �÷��� (+)��ȣ�� �ۼ�

--RIGHT OUTER JOIN : ������ ���̺��� �������� NULL���� �����Ͽ� ���
-- ����Ѥ� ���� ���ν� : ���� �������� �ݴ��� ���� �÷��� (+)��ȣ�� �ۼ�

-- FULL OUTER JOIN :  ������ NULL���� �����Ͽ� ���
-- ����Ŭ �������� �������� ������ UNIOM �����ڸ� �̿��ؼ� ���� ���� ����ϴ� �����



-- �� �μ��� �Ŵ��� �������� �μ� �̸�, �Ŵ������̵� , �̸��� ���

SELECT * FROM EMPLOYEES;

SELECT * FROM DEPARTMENTS;


SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON E.EMPLOYEE_ID = D.MANAGER_ID;
    
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM EMPLOYEES E , DEPARTMENTS D
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
   AND D.MANAGER_ID = E.EMPLOYEE_ID ;
   
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM EMPLOYEES E , DEPARTMENTS D
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID
   AND D.DEPARTMENT_ID = E.DEPARTMENT_ID ;

SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM EMPLOYEES E , DEPARTMENTS D
 WHERE E.EMPLOYEE_ID = D.MANAGER_ID;
-- �� 11��

-- LEFT OUTER JOIN (27���� ��. �μ�����)
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID;

-- ����Ŭ����
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE E.EMPLOYEE_ID = D.MANAGER_ID(+);
 
-- RIGHT OUTER JOIN (107�� ��. ������)
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON E.EMPLOYEE_ID = D.MANAGER_ID;
    
-- ����Ŭ ����
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID(+) = E.EMPLOYEE_ID;
 
 
-- FULL OUTER JOIN (27+107 -11(������)= 123�� ��)
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID;
    
-- OUTRT Ű����� ���� ����












