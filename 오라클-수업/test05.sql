-- ������ (��������) �� ���� ������ ���� ��쿡 AND, OR
-- AND => ����, �� ���� ������ ���ÿ� true
-- ����(job)�� SALEMAN�̰� �޿�(sal)�� 1500 �̻��� ����� ��� ���� ���
SELECT *
FROM emp
WHERE job='SALEMAN' AND sal>=1500;

-- 81�⿡ �Ի��� ��� ����� ���� ���
SELECT *
FROM emp
WHERE hiredate>='81/01/01' AND hiredate<='81/12/31';

SELECT *
FROM emp
WHERE hiredate LIKE '81'';

SELECT *
FROM emp
WHERE SUBSTR(hiredate,1,2)=81;

-- OR => �� �߿� �� �� �̻��� true�� ���
-- ������ MANAGER�̰ų� CLERK�� ����� ��� ����
SELECT *
FROM emp
WHERE job='MANAGER' OR job='CLERK';
---------------------------------------------------------------------------------------
-- ����Ŭ���� �����ϴ� ������
-- BETWEEN ~ AND : �Ⱓ, ���� = �ڹ� (���� �Ⱓ, üũ�� �Ⱓ, ������)
-- >= AND <=
-- �޿��� 1000~3000 ������ ����� ��� ���� ���
-- ���� / ��¥
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

-- 80�⵵�� �Ի��� ��� ����� ���� ���
SELECT *
FROM emp
WHERE hiredate BETWEEN '80/01/01' AND '80/12/31';

-- 5���� ���
SELECT empno,ename,job,hiredate,rownum
FROM emp
WHERE rownum BETWEEN 1 AND 5;

-- IN => OR�� ���� ���� ��쿡 ���
-- deptno(�μ� ��ȣ) 10�̰ų� 20�̰ų� 30�� ��� ���
SELECT *
FROM emp
WHERE deptno=10 OR deptno=20 OR deptno=30;

-- WHERE �÷��� IN(��...)
SELECT *
FROM emp
WHERE deptno IN(10,20,30);

-- ���� => ���� ���� �˻� : <input type=checkbox>, ��¥(���ڿ�)
-- KING, ADAMS, SCOTT, FORD, MARTIN
SELECT *
FROM emp
WHERE ename='KING' OR ename='ADAMS' OR ename='SCOTT' OR ename='FORD' OR ename='MARTIN';

SELECT *
FROM emp
WHERE ename IN('KING','ADAMS','SCOTT','FORD','MARTIN');

-- NOT (����������)
-- job�� MANAGER, CLERK�� �ƴ� ����� ��� ���� ���
SELECT *
FROM emp
WHERE NOT (job='MANAGER' OR job='CLERK');

-- KING, ADAMS, SCOTT, FORD, MARTIN ����� �ƴ� ����� ��� ���� ���
SELECT *
FROM emp
WHERE ename NOT IN('KING', 'ADAMS', 'SCOTT', 'FORD', 'MARTIN');

-- 81�⿡ �Ի����� ���� ����� ��� ���� ���
SELECT *
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';

-- NOT IN, NOT BETWEEN, NOT LIKE

-- NULL => ���� ���� ���� => ���� ó���� �� �ȴ�
-- ���� ó���� ���� ������ ���� => IS NULL, IS NOT NULL;
-- ���(mgr)�� ���� ����� ��� ���� ���
SELECT *
FROM emp
WHERE mgr IS NULL;

/*
	LIKE === ��ȭ ===> REGEXP_LIKE(ename,'[��-�R]')
	 = % : ������ ������ �𸣴� ��� (���� X)
	 = _ : �� ����

	 === �˻�

	 = ���� ���ڿ� : ���ڿ�% => IN%
	 = ������ ���ڿ� :  %���ڿ� => %EN
	 = ���ԵǴ� ���ڿ� : %EN%
	 = ���� ���� �˰� �ִ� ��� : _ => _______ , ___T__ ...
*/
-- ��� �߿� A�ڷ� �����ϴ� ����� ��� ���� ���
SELECT *
FROM emp
WHERE ename LIKE 'A%';

-- ��� �߿� T�ڷ� ������ ����� ��� ���� ���
SELECT *
FROM emp
WHERE ename LIKE '%T';

-- ��� �̸� �߿� IN�ڷ� �����ų� EN���� ������ ����� ��� ���� ���
SELECT *
FROM emp
WHERE ename LIKE '%IN' OR ename LIKE '%EN';

-- ��� �̸� �߿� O�ڸ� �����ϰ� �ִ� ����� ��� ���� ���
SELECT *
FROM emp
WHERE ename LIKE '%O%';

-- ��� �̸� �߿� A�ڷ� �����ϰ� 5������ ����� ��� ���� ���
SELECT *
FROM emp
WHERE ename LIKE 'A____';

-- ��� �̸� ����� O�̰� 5������ ����� ��� ���� ���
SELECT *
FROM emp
WHERE ename LIKE '__O__';

-- BOOK => �౸�� �����ϰ� �ִ� å ���
SELECT *
FROM book
WHERE bookname LIKE '%�౸%';

-- FOOD => name, type => �ѽ� ����
SELECT name,type
FROM food
WHERE type LIKE '%�ѽ�%';

-- FOOD => name, type => �н� ����
SELECT name,type
FROM food
WHERE type LIKE '%�н�%';

-- FOOD => address => ������
SELECT name,type,address
FROM food
WHERE address LIKE '%����%';

-- emp => ��� �̸� �߿� A, D, K, E, S�� ������ ����� ��� ���� ���
SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'A|D|K|E|S');