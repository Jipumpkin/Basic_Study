CHAPTER 02. WHERE

--WHERE �� �⺻ �����
--SELECT ��ȸ�� �÷� �� ~~
--  FROM ��ȸ�� ���̺��
--  WHERE ��ȸ�� ���� �����ϱ� ���� ���� ��


--�ǽ�) ���� ���̺� �������̵� 105�� ������ �۽�Ʈ���Ӱ� ��Ʈ������ ���

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105;
 
-- �ǽ�2) �μ����̺��� �Ŵ��� ���̵� 100�� �μ��̸��� �μ����̵� ���

SELECT DEPARTMENT_NAME, DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100;


--�������̺��� �޿��� 9000�� ������ �������̵� �����̸� �޿� ������ ���

SELECT EMPLOYEE_ID, SALARY, FIRST_NAME
  FROM EMPLOYEES
 WHERE SALARY = 9000;

DESC EMPLOYEES ;


-- ��� ������ ( +,-,*,/)

-- �� ������ ( >, >=, <, <=)


--�������̺��� �޿��� 5000������ ������ �̸��� �޿� ������ ���

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <= 5000;
 
 --�������̺��� �������̵� IT_PROG �� �ƴ� ������ �̸��� �������̵� ���
 
SELECT *
  FROM EMPLOYEES;
 
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID != 'IT PROG';


--�������� (AND, OR)


--�������̺��� �μ����̵� 90�̰� �޿��� 5000�� ������ 
-- �������̵�� �����̸��� ���

SELECT FIRST_NAME, EMPLOYEE_ID,DEPARTMENT_ID ,SALARY
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90
   AND SALARY >= 5000;
   
   
--�������̺��� �μ����̵� 100�̰ų�
--�Ի����� 06�� 02��02�� ���Ŀ� �Ի��� ������ �̸��� �Ի��� ������ ���

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100
    OR HIRE_DATE > '06/02/02';
    
    
--�������̺��� �μ� ID�� 100�̰ų� 90�� ���� ��
-- ����ID�� 101�� ������ ����ID �̸� ������ ���
-- �� ������ AnnSal�̶�� ��Ī�� ����ؼ� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 100
    OR DEPARTMENT_ID = 90)
   AND EMPLOYEE_ID = 101;
   
-- AND�����ڰ� OR�����ں��� �켱������ ���Ƽ� ������ �켱������ ����
-- ������� �޶�����.

-- NULL���� ������
-- IS NULL :�����Ͱ��� NULL�� ���� ��ȸ
-- IS NOT NULL : ������ ���� NULL�� �ƴ� ���� ��ȸ
--NULL�� �񱳿����ϸ� ������ false

--�������̺��� ���ʽ��� �ִ� ������ �̸��� ���ʽ� ������ ���
SELECT * FROM EMPLOYEES;


SELECT FIRST_NAME, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL;
 
 
 
SELECT DEPARTMENT_ID FROM EMPLOYEES;

-- �μ� ID�� ���� ������ �̸� ���ϱ�

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL ;


IN ������
-- NULL���� �ְԵǸ� ���ܵǴ� Ư���� ������ �մ�
-- -,+,OR�� ������ �����ڱ� ������


SELECT *
  FROM EMLPOYEES
 WHERE DEPARTMENT_ID IN (30,50,90);
 
 
 
-- �������̺��� �Ŵ��� ���̵� 100 102 103�� ������ �̸��� �Ŵ��� ���̵� ���

SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID IN (100,102,103)
    OR MANAGER_ID IS NULL;
    
--NULL���� IS NULL�� ã��


--NOT IN 
--> IN���� ���ǿ� �ش����� �ʴ� �����͸� ���
--> !-,AND �����ڰ� ������ ������
--> NULL�� ������ �����ü�� �ȵ�(AND������ ���TRUE�����ϰ� NULL�� ������ FALSE)


--�������̺��� �Ŵ��� ���̵� 100,120,121�� �ƴ� ��������
-- �̸��� �Ŵ��� ���̵� ���

SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (100,120,121);
 





-- �������̺��� �������̵� AD_VP�ų� ST_MAN�� ������
-- �̸��� �������̵� ���

SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AD_VP', 'ST_MAN');
 
 
-- �������̺��� �Ŵ��� ���̵� 145,146,147,148,149�� �ƴ� ������
-- �̸��� �Ŵ��� ���̵� ���

SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (145,146,147,148,149);
 
 
-- BETWEEN A AND B
-- ���� ���� ���� ���͸� ��ȸ�� �� ���
-- A�� �ּҰ� B�� �ִ밪
-- Ư�� �� ���� �ּ�, �ְ� ������ �����Ͽ� �ش� ���� ���� �����͸� ��ȸ



-- �������̺��� �޿��� 10000�̻� 20000������ ������ �̸��� �޿��� ������ ���

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000; 
 
-- BETWEEN�� �ּҰ� �̻�, �ִ밪 �����̴�.

-- �������̺��� 05�⿡ �Ի��� ������ �̸��� �Ի����� ���

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31';
 
--LIKE ������
-- �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ�Ҷ� ���
--%, _ ��� ���ϵ� ī�带 �̿��ؼ� ��Ī������ �����Ѵ�.
-- % : ���̿� ������� ��� ���� �����͸� �ǹ�
-- _ : � ���̵� ������� �Ѱ��� ���� �����͸� �ǹ�


-- ���� ���̺��� �ڵ�����ȣ�� 650���� �����ϴ� ������ �̸��� �ڵ��� ��ȣ ���

--SELECT FIRST_NAME, PHONE_NUMBER
--  FROM EMPLOYEES
-- WHERE PHONE_NUMBER LIKE '650.___.____';

SELECT FIRST_NAME, PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '650%';
 
 
-- 1) �������̺��� �̸��� S�� �����ϰ� n���� ������ ������ �̸� ã��

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';
 
-- 2) �������̺��� �̸��� it���� ������ �� 4������ ������ �̸� ã��

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '__it';

-- 3) �������̺��� �̸��� �ι�° ���ڰ� e�� ������ �̸� ã��
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_e%';
 
-- 4) �������̺��� 01���� �Ի��� ������ �̸��� �Ի糯¥ ã��
 SELECT FIRST_NAME
   FROM EMPLOYEES
  WHERE HIRE_DATE LIKE '__/01/__';







 
 
 
 
 
 