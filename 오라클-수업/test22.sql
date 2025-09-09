-- SEQUENCE : �ڵ� ���� ��ȣ
set linesize 250 
set pagesize 25
/*
	����Ŭ�� ��ü
		=> TABLE / SEQUENCE / VIEW / INDEX
		=> CREATE / DROP

		START WITH ==> ���� ��ȣ
		INCREMENT BY ==> ���� ��ȣ
		NOCACHE : CACHE ==> �̸� ���� (20�� ����)
		NOCYCLE : CYCLE ==> ó������ �ٽ� ����
		
		=> 1 2 3 4 (5 ����) 6 ... => �ʱ�ȭ : SEQUENCE ���� => �ٽ� ����

		=> currval(���� ��) / nextval(���� ��)
			INSERT INTO student VALUES(my_seq.nextval...)

		���̺� ����
			���̺�
			SEQUENCE => PRIMARY KEY : �ߺ� ���� ������
*/
/*
CREATE SEQUENCE my_seq
	START WITH 1
	INCREMENT BY 1
	NOCYCLE
	NOCACHE;
SELECT my_seq.nextval FROM DUAL;
DROP SEQUENCE my_seq;
*/
-- SELECT my_seq.nextval FROM DUAL;

/*
	3��
		DQL / DML / DDL
		DQL : ������ ���Ǿ� => ������ �˻� (SELECT)
		1) SELECT�� ����, ����
			*** SELECT ���� => �÷� / ���̺� / ���� �� ��� ��� ����
				=> �÷� ��� : ��Į�� ��������
				=> ���̺� ��� : �ζ��� ��
				=> ���ǰ� ��� : �Ϲ� ��������

			SELECT * | column_list
			FROM table_name | SELECT ~ | view_name
			[
				WHERE ���ǹ� (������)
				GROUP BY �׷� �÷� | �Լ� => �׷캰 ��� => ������ ������
				HAVING �׷� ����
				ORDER BY �÷� | �Լ� (ASC ���� ���� | DESC)
			]

			���� 
				FROM => WHERE => GROUP BY => HAVING => SELECT => ORDER BY

			������
				��� ������ : SELECT �ڿ�
					=> +�� ������ ���� (���ڿ� ������ ||�� ���)
					=> /�� ����/���� = �Ǽ�
					=> %�� ������� �ʴ´� => MOD() ���

				�� ������ : =, <>(!=), <, >, <=, >=
			
				�� ������ : AND, OR
					=> ||�� ���ڿ� ����
					=> &�� �Է� ���� �޴� ���

				BETWEEN ~ AND : �Ⱓ => ������ ����
					=> ����¡ ���

				IN : OR�� ���� ���� ���
					=> WHERE deptno=10 OR deptno=20 OR deptno=30
					=> WHERE deptno IN (10, 20, 30)
					=> ���� ���� ���� �ִ� ��� => ����

				NOT : ����
					=> NOT IN(), NOT BETWEEN, NOT LIKE ...

				LIKE : �˻�
					=> %�� ���� ���̸� �𸣴� ���
					=> _ �� ���� �� ����
					=> startsWith : A%
					=> endsWith : %A
					=> contains : %A% (�ַ� ���)

					=> �ֽ� : REGEXP_LIKE()
						startsWith : ^[A]
						endsWith : [A]$
						contains : [A]
						
						*** ���Խ� LIKE�� ������ ��쿡 �ַ� ���
							A-Za-z | 0-9 | ��-�R

		���� �Լ�
		���̺� ����
		DML
			INSERT
				INSERT INTO table_name VALUES(��...)
				INSERT INTO table_name(�÷�,�÷�...) VALUES(��...)

			UPDATE
				UPDATE table_name
				SET �÷���=��, �÷���=��
				[WHERE ���ǹ�]

			DELETE
				DELETE FROM table_name
				[WHERE ���ǹ�]

*/
/*
-- A B C D E�� LIKE���� �˻�
SELECT ename
FROM emp
WHERE ename LIKE '%A%' OR
	ename LIKE '%B%' OR
	ename LIKE '%C%' OR
	ename LIKE '%D%' OR
	ename LIKE '%E%';

-- �ֽ� : REGEXP_LIKE()���� �˻�
SELECT ename
FROM emp
WHERE REGEXP_LIKE(ename,'A|B|C|D|E');

SELECT ename
FROM emp
WHERE REGEXP_LIKE(ename,'[A-E]');
*/
/*
INSERT INTO emp VALUES(8000, 'ȫ�浿', '�븮', 7788, SYSDATE, 2500, 0, 10);
COMMIT;
*/
/*
SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'[��-�R]');
*/
/*
INSERT INTO emp VALUES(8001, 'ABCȫ�浿', '�븮', 7788, SYSDATE, 2500, 0, 10);
INSERT INTO emp VALUES(8002, 'ȫ�浿ABC', '�븮', 7788, SYSDATE, 2500, 0, 10);
COMMIT;
*/
/*
SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'^[��-�R]'); -- �ѱ۷� ����
SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'[��-�R]$'); -- �ѱ۷� ����
*/
/*
SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'[^��-�R]'); -- �ѱ۸� �ִ� ename ����
*/
/*
DELETE FROM emp
WHERE empno>=8000;
COMMIT;
*/