-- ����������?
--> SQL���� �����ϴµ� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ����
--  SQL ���ο��� ����ϴ� SELECT���� �ǹ��մϴ�.
-- ���������� �������� �ȿ� ���Ե� �������� �����Դϴ�.

-- �������� : ���������� ������� ����Ͽ� ����� �����ϴ� ����
-- �������� : ���������� ���ǽĿ� ���� ���� �ǹ�

--�������̺��� �̸��� Jack�� �޿� ������ ���

SELECT SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Jack';
 
-- Jack�̶�� ������ �޿����� ���� ������ �̸��� �޿��� ����Ͽ���

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < 8400;

-- ���������� ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < ( SELECT SALARY
                    FROM EMPLOYEES
                   WHERE FIRST_NAME = 'Jack' ) ;


-- �������̺��� James�� �޿����� ���� ������ �̸��� �޿� ������ ��ȸ
-- 1. ���̺��� ���� Ȯ��
-- 2. ������ ������ �Ǵ� James�� �޿��� ������ Ȯ��
-- 3. 2���� ������� ������ �������� ���� ��� ���� ���

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < ( SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'James');
-- ORA-01427: single-row subquery returns more than one row
--> ������ ���������� �ϳ��� �ุ ����� �Ҽ��� �ִ�.

-- ���������� Ư¡ 
-- 1. ���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� ������ ���̸� ()�� ��� ����Ѵ�.
-- 2. ���������� SELECT���� ����� Į����
--    ���������� �񱳴��� ���� �ڷ����� ������ �����ؾ� �Ѵ�
-- 3. ���������� �ִ� SELECT ���� ��� �� ���� �Բ� ����ϴ� ���������� ������ ������
--    ȣȯ �����ؾ��Ѵ�.
--> �� �� �ϳ��� �����ͷθ� ������ ������ �����ڶ�� ���� ������ ��� �� �� �� �ϳ����߸� �Ѵ�.
--> �����ڿ� �Բ� ��ȣ �ۿ��ϴ� ��Ŀ� ���� ������ ���������� ���� �� ���������� ������.

-- ������ ����������?
--> ���� ����� �� �ϳ��� ������ ������ ��������
--> = , >=< , <> , != , ^= (������ ������)



-- �������̺��� Nancy ���� ���� �Ի��� ������ �̸��� �Ի����� ��ȸ

-- ������ �Ǵ� Nancy�� �Ի��� ������ ���
-- 2. 1�� ������ ������ ���������� �̿��ؼ� ����� ���



SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE < (SELECT HIRE_DATE FROM EMPLOYEES WHERE FIRST_NAME = 'Nancy');


-- �������̺��� ��� �޿����� ���� �޿��� �޴� ������ �̸��� �޿� ������ ��ȸ

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);


-- ������ �����ڷδ� �ϳ��� ��� ���� �񱳰��ȴ�.
-- ���������� ������� 2�� �̻��̸� ������ �����ڷδ� �񱳰� �ȵȴ�.
-- �׷��� ������ �����ڷ� �񱳸� �ؾ��Ѵ�.

-- ������ �������� ��?
-- ���� ��� ���� �������� ������ ���������� ���Ѵ�.
-- ������ �����ڴ� ����� �� ���� ���� �� �����ڸ� ����ؾ� �Ѵ�.

-- ������ �������� ����
-- IN : ���������� �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�� �����Ͱ� ������ TRUE ��ȯ
--> IN(��������)
-- ANY : ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� TRUE ��ȯ
--> �񱳿����� ANY (��������)
-- ALL : ���������� ���ǽ��� ���������� ��� ��ΰ� �����ϸ� TRUE ��ȯ
--> �񱳿����� ALL (��������)
-- EXISTS : �������� ��� ���� �����ϴ��� ���θ� Ȯ�� ( �� ���� �Ѱ� �̻��̸� TRUE)
--> EXISTS (��������)


-- �� �μ��� �ְ� �޿� ������ ���

SELECT MAX(SALARY)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;



-- �� �μ��� �ְ� �޿��� ������ �޿��� �޴� ������ ������ ���(�μ����̵� �̸� �޿�)

SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY IN (SELECT MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID);
 
 
 
-- �μ��� �ְ�޿��� ���� �޿��� ������ ��� ������ ��µ�
-- IN �������� ����� �����ϴ� ���� �� ��ġ�ؾ� �Ѵ�.


-- ANY������ Ȱ��

SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY = ANY (SELECT MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID);
 
-- IN �����ڿ� ���� ��� ���� ���´�.
-- ���ǿ� �����ϴ� ����� �ϳ��� ���̸� ���� ��ȯ
--> ANY �� =�����ڸ� ����ϴ� IN�����ڿ� ���� ���� ���

SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= ANY (SELECT MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID);

-- �μ��� �ְ� �޿��� �ϳ��� ���̸� ���� ��ȯ�̱� ������
-- ���� ������ ���� �� � �ϳ��� ������ ���� ������ ����
-- ū ���� ������ ��� ���� ����� �ȴ�.
-- �� �μ��� �ּ� �޿����� ���� ���� �� ����� �ȴ�.

-- ALL ���
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= ALL (SELECT MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID);
 
 
-- ALL�� �������� ����� ���K�� ��� ���鿡 ������ �����ؾ��Ѵ�.
-- ���������� ���� ������ ��� ��� ���� �����ؾ��Ѵ�.
-- ���� ������ ��� �� �� ���� ū ���� 24000�� �񱳸� �ؼ� ũ�ų� ���� ����
-- ���� �����͸� ����� �϶�� ����� ������
-- ��������� �ִ밪���� ū ���� ����� �Ǽ� �ִ밪�� ���ϴ°Ŷ� ����.

-- EXISTS �����ڴ� ���� ���θ� Ȯ���� �Ѵ�.
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EXISTS (SELECT FIRST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID = 110);
 
 
 
-- 