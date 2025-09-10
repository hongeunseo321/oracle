/*
Oracle = JDBC = *Connection Pool* => *MyBatis = *JPA
                        |
JavaScript = Jquery = Ajax = *Vue = React = Next
-------------------          ---- Spring ����
 = NodeJS / *TypeScript
   ------ TypeORM
SpringFrame = Spring-Boot(������̼� ���)
-----------
 = CI / CD = Git Action / Docker => *�����Ƽ�� = *��Ų��
*/

-- 142page ~ 178page DQL (SELECT�� => �˻�)
/*
	1) SQL ���ڿ� ����
	 	DQL : ����Ŭ���� ���� ���� ���Ǵ� ���
			SELECT
		DML : INSERT / UPDATE / DELETE
		DDL : ���̺� ����, �� ����...
			CREATE / ALTER(����) / DROP / RENAME
		DCL : ���� ���
			GRANT / REMOVE
		TCL : ���� / ���
			COMMIT / ROLLBACK

	2) �� ����
		SELECT : ������ ��ȸ
		WHERE : ���� �˻�
		GROUP BY : �׷캰 ���� 
		JOIN : �ٸ� ���̺� ����
		SUBQUERY : SQL ���� ���� �� => �� ���� ����
		DDL : ����
		DML : ����
		TCL : Ʈ����� ����

	3) ������ �˻�
		SELECT 
		����)
			���̺��� ���� : �÷��� / �������� => DESC table_name
			------------------------------------------------------
			SELECT (DISTINCT|ALL) => ����(column_list) | * 
			FROM table_name | view_name | SELECT
			------------------------------------------------------ �ʼ�
			[
				WHERE ���ǹ� (������)
				GROUP BY => ��� / ���� 
					=> ���� ���� ������ �ִ� �÷�
					=> �Լ�
				HAVING => �׷쿡 ���� ����
				ORDER BY => ���� (�÷�)
			]

			1. ������
				��� ������ : +, -, *, / => %(MOD)
					/ : ���� / ���� = �Ǽ�
					+ : ���� ��ɸ� 
					|| : ���ڿ� ����

				�� ������ : =, !=(<>), <, >, <=, >=
					=> ������������ �ַ� ���

				�� ������ : AND / OR
					AND : ���� ����
					OR : �� �߿� �� �� �̻� true

				BETWEEN ~ AND : �Ⱓ, ������ ����
			
				IN : OR�� ���� ��쿡 ��ü

				NOT : ���� ������

				LIKE : �˻� �ÿ� �ַ� ���
					_ : ���� ���� ������ ��� 
					% : ���� �� ������
				
				NULL : ���� ó�� X	
					IS NULL / IS NOT NULL

			2. ���� �Լ�
			   --------
				*** ���� �Լ�, ������ �Լ��� ���� ����� �� ����
				*** ���� ����Ϸ��� GROUP BY�� ����Ѵ�

				������ �Լ�
					���� �Լ�
						SUBSTR : ���� �ڸ���
							=> SUBSTR(���ڿ�|�÷�, ���� ��ġ, �ڸ� ����)
							=> ����Ŭ�� ���� ��ȣ : 1

						INSTR : ������ ��ġ Ȯ��
							=> INSTR(���ڿ�|�÷�, ã�� ����, ���� ��ġ, �� ��°)
							=> indexOf / lastIndexOf
							=> ��) ����� ���ʱ� ~��...

						REPLACE : ����
							=> REPLACE(���ڿ�|�÷�, ã�� ����, ������ ����)
							=> ��) �̹��� URL => &

						LENGTH : ���� ����
							=> LENGTH(���ڿ�|�÷�)

						RPAD : ���ڰ� ������ �������� ���� ��� �ٸ� ���ڷ� ��ü
							=> RPAD(����|�÷�, ��� ���� ��, ��ü ����)
							=> ��) ���̵� ã��

					���� �Լ�
						MOD : ������
							=> MOD(10,2) => 10%2

						ROUND : �ݿø�	
							=> ROUND(�Ǽ�,�ڸ���)
	
						CEIL : �ø�
							=> CEIL(�Ǽ�)
							=> �Ҽ����� 1�̻��̸� �ø� 
							=> ��) ��������

					��¥ �Լ�
						SYSDATE : �ý����� ���� ��¥ / �ð�
							=> ��) �Խ���, ȸ��, ����, ����...

						MONTHS_BETWEEN : ������ �Ⱓ�� ���� ��
							=> MONTHS_BETWEEN(����, ����)

					��ȯ �Լ�
						TO_CHAR : ���ڿ� ��ȯ
							=> ��¥
								YYYY / RRRR : �⵵
								MM : ��
								DD : ��
								HH / HH24 : �ð� (���, ��������...)	
								MI : ��
								SS : ��
								DY : ����
								
							=> ����
								��) 9,999,999...			

					��Ÿ �Լ�				
						NVL : NULL���� ��쿡 �ٸ� ������ ����
							=> NVL(�÷�, ��ü��)
							=> �÷��� ��������, ��ü ���� �������� ��ġ
	
				���� �Լ�
					COUNT : ROW�� ����
						COUNT(*) / COUNT(�÷�)
						    |          |
						NULL����    NULL����

						=> ��) �α���, ���̵� ã��, ��ٱ��� ����, �˻� �Ǽ�...

					MAX : ROW�� ��ü �ִ�
						=> ��) �ڵ� ���� ��ȣ => CREATE SEQUENCE

					SUM : ROW�� ����

					AVG : ROW�� ���


	4) SQL ��
		-----------------------------------------------------------------------
		1. GROUP BY : ���� ���� ���� �÷��� �׷����� ���� => �׷캰 ���
			=> ��) ���̵� / �μ��� / �Ի� �⵵

		2. HVING : GROUP�� ���� ���� ����

		3. ORDER BY : ����
			=> ORDER BY �÷�|�Լ� ASC|DESC
			=> ���� ���� 
				ORDER BY �÷�, �÷�
				              ----  ---- ���� ���� ������ �ִ� ���
				=> ��) ����, ���� ���ϱ�

		4. JOIN : �� �� �̻��� ���̺��� �����ؼ� ������ ����
			=> ���̺��� ����ȭ�� ���� ���� ���� ������ �۾�

			INNER JOIN : ���� ���� ������ �ְų�, �����ϴ� ���
				���� �� : =
				���� : BETWEEN, �� ������
				=> ���� ���� ���Ǵ� JOIN 

				1) ORACLE JOIN
					SELECT �÷�(A), �÷�(B)
					FROM A, B
					WHERE A.col = B.col

				2) ANSI JOIN
					SELECT �÷�(A), �÷�(B)
					FROM A JOIN B
					ON A.col = B.col

			OUTER JOIN : ���� ����
				1) ORACLE JOIN
					SELECT �÷�(A), �÷�(B)
					FROM A, B
					WHERE A.col = B.col(+)

				2) ANSI JOIN
					SELECT �÷�(A), �÷�(B)
					FROM A LEFT OUTER JOIN B
					ON A.col = B.col

				1) ORACLE JOIN
					SELECT �÷�(A), �÷�(B)
					FROM A, B
					WHERE A.col(+) = B.col

				2) ANSI JOIN
					SELECT �÷�(A), �÷�(B)
					FROM A RIGTH OUTER JOIN B
					ON A.col = B.col


			SELF JOJIN : �ڽ��� ���̺� (���� ���̺��� ������ ����)
		-----------------------------------------------------------------------
		���� ���� : ���� �ȿ� �ٸ� ���� ���� �߰�
			=> ���� ���� SQL������ �� ���� ����
			=> MainQuery ������ (��������)
						        --------- ���� => �ᱣ�� MainQuery

			=> SQL������ ������ ���� ó���� �� ���
			=> ������ �ܰ躰�� ������ �ۼ� => �������� ����
			=> �ӵ��� ������ (����Ŭ���� ���� �� �ƴ� �ڹٶ� ������ �� ������)
				���� ����Ŭ ���� => Connection Pool�� �̸� ������ ���Ѽ� �ּҰ��� ���� ���� ���			
			=> SQL ������ ��������� => �м��ϱ� ��ƴ�
		
			1) ���� => ���������� SELECT�� ����
				���� => SELECT
				�������� => SELECT, INSERT, UPDATE, DELETE

				SELECT �� : SELECT ename, (SELECT ~) 
					=> �÷� ��� ��� : ��Į�� ��������

				FROM �� : SELECT ~
					=> ���̺� ��� ��� : �ζ��κ�
					=> ���ȼ��� �پ��

				WHERE �� : ���ǰ�
					=> ��������
					   -------
						1. ������ �������� => �÷� 1��
							�� ������

						2. ������ �������� => �÷� 1��
							IN / ANY / SOME / ALL
							IN : ������������ ���� ���� �� �� �ϳ��� ��ġ�ϸ� ��
								=> IN(SELECT DISTINCT deptno FROM emp)
									IN(10, 20, 30)

							ANY : �� ��� �� �� �ϳ��� ������ �����ϸ� ��
								> ANY(SOME)
								ANY(SELECT DISTINCT deptno FROM emp)
								> ANY(10, 20, 30) => 10�� ����

								< ANY(SOME)
								ANY(SELECT DISTINCT deptno FROM emp)
								< ANY(10, 20, 30) => 30�� ����

							ALL : �� ��� �� �� ��� ���� ���� ������ �����ؾ� ��
								> ALL(10, 20, 30) => 30 ����
								< ALL(10, 20, 30) => 10 ����


						3. �����÷� ��������

						4. ���� ��������
							����)
								-- �޿��� ����� ���Ͻÿ�.
								SELECT AVG(sal) FROM emp => 2073

								-- ��պ��� ���� ���
								SELECT * FROM emp
								WHERE sal<2073
								------------- �������� ------------- 
								SELECT * FROM emp
								WHERE sal<(SELECT AVG(sal) FROM emp)
												|1. ����
								=> MainQuery ����
								-----------------------------------
*/
set linesize 250 
set pagesize 25
/*							
-- KING�� ���� �μ��� �ִ� ��� ����� ���� ���
-- KING�� �μ� ã�� => WHERE ����
SELECT *
FROM emp
WHERE deptno=(SELECT deptno FROM emp WHERE ename='KING');
*/
/*
	** �÷��� 1�� / �÷��� ���� �� => ���� �÷� ��������
		1. �ڹٿ��� ����Ŭ ������ ���� �ÿ��� �ִ��� Ƚ���� ���δ�
		2. �ӵ��� ����ȭ

	** JOIN�� ���̺� �ִ� ������ ����
	** SubQuery�� SQL���� ����
*/ 
/*
-- SCOTT�� �޴� �޿��� ������ �޿��� �޴� ��� ���
SELECT *
FROM emp
WHERE sal=(
	SELECT sal 
	FROM emp 
	WHERE ename='SCOTT'
)
AND ename<>'SCOTT';

-- �޿��� ���� ���� ����� ���� �μ��� �ִ� ����� ��� ����
SELECT *
FROM emp
WHERE deptno=(
	SELECT deptno 
	FROM emp 
	WHERE sal=(
		SELECT MIN(sal) 
		FROM emp
	)
);

-- ������ CLECK�� ����� �μ��� ��� ��� ���� ���
SELECT deptno FROM emp WHERE job='CLERK';

SELECT *
FROM emp
WHERE deptno IN(
	SELECT deptno 
	FROM emp 
	WHERE job='CLERK'
);

SELECT *
FROM emp
WHERE deptno > ANY( -- �ּڰ��� 10������ ū �μ��� ���
	SELECT deptno 
	FROM emp 
	WHERE job='CLERK'
);

SELECT *
FROM emp
WHERE deptno < ANY( -- �ִ��� 30������ ���� �μ��� ���
	SELECT deptno 
	FROM emp 
	WHERE job='CLERK'
);

SELECT *
FROM emp
WHERE deptno > ALL( -- 30 => ��� X
	SELECT deptno 
	FROM emp 
	WHERE job='CLERK'
);

SELECT *
FROM emp
WHERE deptno < ALL( -- 10 => ��� X
	SELECT deptno 
	FROM emp 
	WHERE job='CLERK'
);

SELECT *
FROM emp
WHERE deptno = (
	SELECT MIN (deptno) 
	FROM emp 
	WHERE job='CLERK'
);

SELECT *
FROM emp
WHERE deptno = ALL(
	SELECT MAX (deptno) 
	FROM emp 
	WHERE job='CLERK'
);
*/

-- �μ��� �ְ� �޿� ��� ��ȸ
SELECT deptno, MAX(sal)
FROM emp
GROUP BY deptno;

SELECT ename,deptno,sal
FROM emp
WHERE (deptno,sal) IN( -- ���� �÷� ��������
	SELECT deptno, MAX(sal)
	FROM emp
	GROUP BY deptno
);

/*
-- ���� ���Ǵ� SQL => FUNCTION
-- ��ť�� �ڵ�
	<h1>aaa</h1> | &lt;h1&gt;aaa&lt;/hu&gt;
	lt : <
	gt : >
*/

-- ����� �̸�, �Ի���, �޿�, �μ���, �ٹ���
-- �̸�, �Ի���, �޿� => emp / �μ���, �ٹ��� => dept
-- ���� �� �޴� �÷� 1�� => ������ / �÷� ���� �� => ���� �÷�
SELECT ename,hiredate,sal,dname,loc
FROM emp,dept
WHERE emp.deptno = dept.deptno;
-- ��Į�� ��������
SELECT ename,hiredate,sal,(
	SELECT dname
	FROM dept
	WHERE deptno = emp.deptno
) "dname",(
	SELECT loc
	FROM dept
	WHERE deptno = emp.deptno
) "loc"
FROM emp;

SELECT ename,hiredate,sal
FROM (SELECT * FROM emp);

-- ���ϴ� ������ŭ ���
-- emp => ���������� 5�� ��� => rownum
SELECT empno, ename,hiredate,job,rownum
FROM emp
WHERE rownum<=5;

-- �޿��� ���� ����� 5�� ���
SELECT ename,sal
FROM emp
ORDER BY sal DESC;

SELECT empno, ename,hiredate,sal,rownum
FROM (
	SELECT * 
	FROM emp 
	ORDER BY sal DESC
)
WHERE rownum<=5;

-- rownum�� ���� => TOP-N
SELECT empno, ename,hiredate,sal,rownum
FROM (
	SELECT *
	FROM emp 
	ORDER BY sal DESC
)
WHERE rownum BETWEEN 1 AND 5;

-- �ζ��κ� (����, ����¡) =>
SELECT empno,ename,hiredate,job,num
FROM (
	SELECT empno,ename,hiredate,job,rownum as num
	FROM (
		SELECT empno,ename,hiredate,job
		FROM emp ORDER BY sal  DESC
	)
)
WHERE num BETWEEN 6 AND 10;

/*
	***������ �������� 
	***������ �������� => IN, MAX / MIN
	���� �÷� �������� => GROUP BY
	���� �������� 
		EXISTS => ���� ���� (true => ���� ����, false => ���� ���� X)
*/

-- �μ� ���̺�(dept)�� �����ϴ� �μ��� ���� ����� �̸�, �μ� ��ȣ ���
SELECT ename,deptno
FROM emp e
WHERE EXISTS (
	SELECT 1
	FROM dept d
	WHERE d.deptno=e.deptno
);
/*
	���� ��������
		=> ���������� ���������� ���� ����

	��� ��������
		=> ������������ ROW���� �ݺ� ����
*/
-- ��� ��������
-- �� �μ��� ��� �޿����� ���� ��� ��ȸ
SELECT e1.ename, e1.sal, e1.deptno
FROM emp e1
WHERE e1.sal > (
	SELECT AVG(e2.sal)
	FROM emp e2
	WHERE e2.deptno = e1.deptno
);

/*
	������ / ������(IN)
	��Į�� ��������
	�ζ��κ�

	=> �������� ����
		1. �������� ���� => �ᱣ�� ��ȯ
		2. �޸��������� �ᱣ���� �޾Ƽ� ���� / ���̺� Ȱ��
		3. ���ο��� ���� �ᱣ��
*/