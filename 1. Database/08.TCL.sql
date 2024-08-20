-- CHAPTER 08. TCL (Transaction Control Language)

-- Ʈ������̶�?
--> �����ͺ��̽��� ���¸� ��ȭ��Ű�� ���ؼ� �����ϴ� �ּ� �������
--> �� ������ ó���ϱ� ���� �ּ� ���� ���� �̴�.

-- Ʈ������� 4���� Ư�� - ACID
-- Automicity(���ڼ�) : All or nothing , ��� ����ǰų� ���� ������� �ʰų�
-- Consistency(�ϰ���) : ������ �ϰ��� �ִ� ���·� ���� �ϴ°�
-- isolation(����) : Ʈ����� ���� �� �ٸ� Ʈ������� ������ ���� �ʴ� ��
-- Durability(���Ӽ�) : ���������� ����� Ʈ������� ������ �ݿ��Ǵ°�

--  TCL ��ɾ�
-- COMMIT    : DB�� ���������� ����, ������ COMMIT ���� ������ Ʈ����� ����� ����
-- ROLLBACK  : Ʈ������� ���, ������ COMMIT ���� ������ ����
-- SAVEPOINT : �ϳ��� Ʈ������� �۰� �����Ͽ� �����ϴ� ����� �����ϴ� ��ɾ�

-- ���̺� ����
CREATE TABLE TCL_EMP AS SELECT * FROM EMPLOYEES;
-- �������� PK,FK ������ ���簡 �ȵ�
-- ������ �����͸� �����

SELECT * FROM TCL_EMP;

DELETE FROM TCL_EMP
 WHERE EMPLOYEE_ID = 100;

ROLLBACK ; -- �ǵ����� ��ɾ� 

COMMIT ; -- ��������(�����Ұ�)

ROLLBACK ; -- �ȵ��ƿ�

DELETE FROM TCL_EMP
 WHERE EMPLOYEE_ID = 101;
 
SELECT * FROM TCL_EMP;

COMMIT;

-- �б� �ϰ����̶� 
-- Ʈ������� �Ϸ�Ǳ� ������ �����͸� ���� �����ϴ� ����(Session) �ܿ�
-- �ٸ� ���ǿ����� ������ ���� �� ������ �����͸� ��ȸ �����ϴ�.
-- �� Ȯ���� �����͸� �˻��� �ȴ�.
-- �̰��� �б� �ϰ����� �����Ѵ� ��� �Ѵ�.


-- LOCK �̶�
--> Ʈ�����ǿ��� �������� �����ʹ� Ʈ������� �Ϸ�(COMMIT, ROLLBACK)�� �Ǳ� ��������
--> �ٸ� ���ǿ����� �ش� �����͸� ������ �� ���� ����
--> �� �̻��� ������ ���� ���� �����Ϸ��� �� �� �浹�ϴ� ����

-- ���̺� ����
CREATE TABLE TCL_DEMP AS SELECT * FROM DEPARTMENTS;

SELECT * FROM TCL_DEMP;

UPDATE TCL_DEMP
   SET DEPARTMENT_NAME = 'BIGDATA'
 WHERE DEPARTMENT_ID = 100;

-- �ΰ� ������ ������ ���� �� ���� �ٸ� ���ǿ��� ���� ���� �����ϰԵǸ�
-- ���� ������ �ϰԵǴ� ������ Ŀ���� �ϱ� �������� �۾��� �Ұ���

SELECT * FROM TCL_DEMP;
















