-- index => PL / SQL
/*
	DQL / DML => �� ������ ���
	= SELECT / INSERT / UPDATE / DELETE
		: JOIN / SubQuery
		���� / ���� ����
	= DDL = CREATE / DROP / ALTER (ADD,MODIFY,DROP)
			TRUNCATE / RENAME
		| SEQUENCE (�ڵ� ����)
		| VIEW
		| INDEX
	= DCL = GRANT / REVOKE
	= TCL = COMMIT / ROLLBACK / SAVEPOINT => 8��
	= PL/SQL = FUNCTION / PROCEDURE / TRIGGER
	= �����ͺ��̽� ���� => ����ȭ
	= ���α׷�(��) ����
	----------------------------------------------------------
	1. JSP ������Ʈ : ȣ���� (AWS) => �����ͺ��̽� ���
	2. Spring ������Ʈ : CI/CD => �ǹ��� �ش�
	3. ���� ������Ʈ : �ű�� => ���� �ɷ�
	----------------------------------------------------------

	1) VIEW : ���̺� ���� => �ʿ��� �����͸� �����ؼ� ���� (SELECT �������� ����)
		= �ϳ� �̻��� ���̺��� �����ؼ� ���� ���� ���̺�
		= ������ �����͸� �����ϴ� ���� �ƴϴ� (SELECT ����)
			SELECT text
			FROM user_views
			WHERE view_name='VIEW��(�빮��)';

		= View => ���� ���̺�ó�� ��� ����
				SELECT ~
				FROM (table_name|view_name|SELECT~)
		
		= ������ ������ �ִ� ��� => SQL�� �ܼ�ȭ
		= �޸𸮿� ���� (���ȼ�)
		= DML ��� ���� (���༺)
			=> �ܼ���(���̺� 1���� ����)������ ��� ����
			=> ***DISTINCT, GROUP BY, JOIN, �����Լ�, UNION => DML ��� �Ұ�

		= ���
			DML ���� : WITH CHECK OPTION
				** ���� �����ϴ� ���̺� ����
			DML �Ұ��� : WITH READ ONLY

		= ���� ���
			CREATE VIEW view_name AS 
				������ SELECT ����

		= ���� ���
			DROP VIEW view_name

		= ���� ���
			CREATE OR REPLACE VIEW view_name AS
				������ SELECT ����

		= ����
			=> SQL ���� ���� (������ ������ �ܼ�ȭ)
				CREATE VIEW emp_view AS
				SELECT empno,ename,job,hiredate,sal,dname,loc,grade
				FROM emp,dept,salgrade
				WHERE emp.deptno=dept.deptno
				AND sal BETWEEN losal AND hisal
				=> SELECT * FROM emp_view

			=> ���� ��ȭ (�÷��� ���ߴ� ���) : SQL Injection
				��ť�� �ڵ� (URL, username, password, �÷�, ���̺� => ���Ͽ� ����)

			=> ���������� ��� ����

		= ����
			=> ���� ���� �߻� (���� �ø��� ���� ���̺� ��ȸ)
			=> ���ѵ� DML ���
			=> DML ��� �ÿ� ���� ���̺� ������ �ش�

	
	2) �ε���(INDEX)
		= �����ͺ��̽� �˻� �ӵ��� ���
			B-Tree ������ ���� 
				��) 1 2 3 4 5 6 7 => �߰��� �ִ� 4�� Root
							
							4
							|
						--------------
						|		|
						2		6
						|		|
					     ------         ------	
					     |     |          |     |
					     1    3         5    7

		= å ã�ƺ��� => �ε��� => Ư�� ���� ������ ã�� �� �ְ� �����
*/