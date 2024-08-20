CHAPTER 01. SELECT

-- �ּ�

-- ���� ũ�� Ű��� : ���� > ȯ�漳�� > �ڵ������� > �۲�
-- ���� ũ�� Ű��� : ���� > ȯ�漳�� > �ڵ������� > PL/SQL
-- �ּ� ����  /**/
/*
1.sql���忡�� ��ҹ��ڸ� �������� �ʴ´�.
2.���⳪ �ٹٲ� ���� ���࿡ ������ ���� �ʴ´�.
3.SQL ���� ������ �� ����Ŭ��(;)�� ������ �Ѵ�
4.SQL ���� ����Ű : ctrl + enter , F9
*/

select first_name from employees ;

SELECT FIRST_NAME
  FROM EMPLOYEES;
--���� ���̺��� ������ �̸��� ������ ���

SELECT EMAIL FROM EMPLOYEES;
-- SELECT �� �⺻ �����
--2. SELECT ��ȸ�� �÷���1,2,3 ...N
--1. FROM ��ȸ�� ���̺� �̸�

SELECT FIRST_NAME, EMPLOYEE_ID, PHONE_NUMBER, SALARY
  FROM EMPLOYEES ;
  
  -- * ���ϱ�
  -- SELECT ���� *�� ���� �Ǹ� �ƽ�Ÿ����ũ ��� ���ϵ�ī��� ���Ѵ�.
  -- *(�ƽ�Ÿ����ũ) -> ��ü�� �ǹ̸� �Ѵ�.
  -- �������̺��� ��ü ������ ����ϱ�
  SELECT *
    FROM EMPLOYEES;
    
-- �μ� ���̺��� ��ü ������ ����ϰ� ���� ������ ��Դϱ�?
SELECT *
  FROM DEPARTMENTS;
-- �μ��� �� 27���� �����Ǿ��ִ�.

--�ǽ�1) �������̺� ����ID,FIRST_NAME,�Ŵ��� ID�� ���
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES;
-- �ǽ�2) �μ����̺� �μ�ID, �μ���, ��ġID�� ���
SELECT DEPARTMENT_ID,DEPARTMENT_NAME,LOCATION_ID
  FROM DEPARTMENTS;
-- �������̺��� ������ �μ� ID�� ���
SELECT DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- ������ �ߺ� �����ϱ�
-- DISTINCT : ������ �ߺ� ����
-- SELECT [DISTINCT / ALL] ��ȸ�� �÷���
-- FROM

SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- �ǽ�) �������̺��� JOB_ID �÷��� �ߺ��� �����Ͽ� ���

SELECT DISTINCT JOB_ID
  FROM EMPLOYEES;
  
  --�ǽ�) �������̺��� JOB_ID�� �μ�ID�� �ߺ� �����Ͽ� ���
  
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES;
  
--TIP 
-- > �÷��� ���� ������ �����ϴ� ( +, -, *, /)
-- ���� ���̺��� ������ �̸��� �޿��� ������ ���

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES;
  
-- ������ �̸��� �޿��� ������ ������ ���

SELECT FIRST_NAME,SALARY,SALARY*12
  FROM EMPLOYEES;

-- ��Ī�� ����ϱ�
-- ALIAS ��� �ϸ� �Ѵ��� ���� ���� ���� �� �� �ִ�.
-- AS ��� Ű���带 ����ؼ� ��Ī�� �����Ѵ�.

-- ��Ī �����
-- 1. SELECT �÷� ��Ī
-- 2. SELECT �÷� "��Ī"
-- 3. SELECT �÷� AS ��Ī
-- 4. SELECT �÷� AS "��Ī"

SELECT FIRST_NAME AS �̸�, SALARY * 12 AS "AnnSal"
  FROM EMPLOYEES ;
  
  
-- ���� ���̺��� ������ �̸��� �Ի���(HIRE_DATE), �Ի��� �������� ������ ���

SELECT HIRE_DATE �Ի���, HIRE_DATE +1 "�Ի��� ������"
  FROM EMPLOYEES ;
  
SELECT HIRE_DATE "�Ի���", HIRE_DATE +1 "�Ի��� ������"
  FROM EMPLOYEES ;
  
SELECT HIRE_DATE AS �Ի���, HIRE_DATE +1 AS "�Ի��� ������"
  FROM EMPLOYEES ;
  
SELECT HIRE_DATE AS "�Ի���", HIRE_DATE +1 AS "�Ի��� ������"
  FROM EMPLOYEES ;

SELECT HIRE_DATE AS "�Ի���", HIRE_DATE +1 AS "�Ի��� ������"
  FROM EMPLOYEES ;
  
-- ORDERBY  �� 
-- Ư�� �÷��� �������� ���ĵ� ���·� ����ϰ��� �� �� ����Ѵ�
-- SQL���� �������� ���� �������� ����ȴ�
-- ������ ���Ĺ���� �������� ������ �⺻������ ��������(ASC)�� ����ȴ�
-- ���Ĺ��
-- ASC(Ascending) : �������� ���� ( 1,2,3~)
-- DESC (Descending) : �������� ���� ( 10,9,8,7~)

DESC EMPLOYEES;
-- DESC(DESCRITE)
-- ���̺��� ������ Ȯ���ϴ� ��ɾ�

-- �ǽ�) �������̺��� ��� ������ ������ ����ϴµ� �޿� ��������
-- ������������ �����Ͽ� ���

SELECT * 
  FROM EMPLOYEES
  ORDER BY SALARY ASC ;
  
-- �������̺��� �ֱٿ� �Ի��� ��¥�� �������� ������ �̸��� �Ի糯¥�� ���

SELECT FIRST_NAME, HIRE_DATE,SALARY
  FROM EMPLOYEES
  ORDER BY HIRE_DATE DESC;
  
-- �������̺��� ���� ID �μ�ID �̸� �޿� ������ ���
--  �� �μ�ID�� ������������ ����  �޿��� ������������ ����
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID,DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
  ORDER BY DEPARTMENT_ID ASC, SALARY DESC;

-- ���� �μ����� �ٹ��ϰ� �ִ� �����鳢�� ���� �޿��� ���� ������� ���
-- > ���� �μ����̵� ������������ ������ �� �޿��� ������������ ��������

--NULL �̶�?
-- NULL���̶� �������� ���� ������ ����ִ� ���¸� ���Ѵ�
-- ���� �������� �ʰų� �������� ���� ���� �ǹ��մϴ�.
--> ���� 0 �� ���ڿ� ' ' �� NULL���� �ƴϴ�.
-- NULL �� �����ϸ� ��� ���� NULL���� ���´�.
-- NULL�� �񱳸��ϸ� ������� ������ FALSE�� ���´�.


-- ���� ���̺��� ����ID�� ���ʽ�, ���ʽ��ι� �� ������ ���

SELECT EMPLOYEE_ID, SALARY*COMMISSION_PCT, 2*SALARY*COMMISSION_PCT AS "UP_BONUS"
  FROM EMPLOYEES
  ORDER BY COMMISSION_PCT ;
  
--UP_BONUS ���� �׷��� ���� ����
-- ���ʽ��� ���� ���� ������ �ֱ� ������ NULL���� �����ϰ�
-- NULL���� ����Ǹ� NULL���� �Ǳ� �����̴�.


-- NULL���� ������ ����ִ� ���¸� �ǹ��ϱ� ������
-- NULL���� ������ü�� �Ұ����ϱ⿡ ������� ������ NULL�� ���´�.















  
  
  
  
  
  
  