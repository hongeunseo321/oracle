-- �ó�� => ���̺�� ���� ���Ǿ� => ���θ� / ��� �����
set linesize 250 
set pagesize 25
/*
	CREATE �ó��
	CREATE PUBLIC �ó��

	=> ������ ����(hr)�� ����
		���� �ο� : grant create synonym to hr;
		���� ���� : revoke create synonym from hr;

	=> ���̺� / �� / ������ / �Լ� ... ��Ī => SYNONYM

	����)
		���̺� / �� / ������ / �Լ��� ��Ī�� �� ���,
			=> ����ų� ª�� ���� ���

	Ư¡)
		��Ī ����, ���� (����� ����) / �۷ι� (��� �����)
		���� �ο��� �ʿ� : SYSTEM / SYSDBA
			DCL(������ �����) => GRANT / REVOKE
				=>  GRANT CREATE SYNONYM TO hr
					GRANT CREATE VIEW TO hr
				=> REVOKE CREATE SYNONYM FROM hr
			*** table / sequence �ܿ� �ٸ� ������ ������ ���� �ʴ�
*/
/*
CREATE VIEW emp_view AS
	SELECT *
	FROM emp;
-- ���� ����� ���� �߻�
*/

-- Local : ���� �����
-- CREATE SYNONYM emp_as FOR emp;

-- ��� �����
-- CREATE PUBLIC SYNONYM emp_pub FOR emp;

/*
DROP SYNONYM emp_as;
-- ���� �ο�
DROP PUBLIC SYNONYM emp_pub; 
*/
/*
	1. �ٸ� ������� ���̺��� ���ϰ� ������ ����
		=> hr_1 / hr_2 / hr_3

	2. ���̺� �̸� ���� => SYNONYM�� �����ϸ� �ڵ� ���� �ּ�ȭ
		=> �������� ����

	3. ���� ����
		=> PUBLIC ���� ����
*/