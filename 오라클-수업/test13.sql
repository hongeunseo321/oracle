-- JOIN
set linesize 250 
set pagesize 25

-- ��� �̸��� SCOTT�� ����� ���, �̸�, �μ���, �ٹ��� ���
SELECT empno,ename,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND ename='SCOTT';

-- �ٹ����� DALLAS�� ����� ���, �̸�, ����, �μ���, �ٹ���, �Ի��� ���
SELEcT empno,ename,job,dname,loc,hiredate
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND loc='DALLAS';

-- �̸� �߿� A�ڰ� ���Ե� ����� �̸�, ����, �μ���, �ٹ��� ���
SELECT ename,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND ename LIKE '%A%';

/*
	INNER JOIN�� ���� => ������ (=) : NULL�� ����
	-------------------------------------------------------
	���� => null���� �ִ� ���̺� Ȯ�� 
		INNER JOIN + (����) => OUTER JOIN

	OUTER JOIN (������ ���)
		1) LEFT OUTER JOIN : ������ ���̺� NULL ó��
			SELECT �÷�(A), �÷�(B)
			FROM A, B
			WHERE A.col=B.col(+)

			SELECT �÷�(A), �÷�(B)
			FROM A LEFT OUTER JOIN B
			ON A.col=B.col

		2) RIGHT OUTER JOIN : ���� ���̺� NULL ó��
			SELECT �÷�(A), �÷�(B)
			FROM A, B
			WHERE A.col(+)=B.col

			SELECT �÷�(A), �÷�(B)
			FROM A RIGHT OUTER JOIN B
			ON A.col=B.col

		3) FULL OUTER JOIN 
			SELECT �÷�(A), �÷�(B)
			FROM A FULL OUTER JOIN B
			ON A.col=B.col	
		
		��� ����
			1. ������ ���� ����
			2. NULL ó�� => �м�
			3. ��� ����

		������ 
			1. �ݵ�� �� ���� ���̺��� �ߺ��� ����� �Ѵ� => Primary Key ���� => Foreign Key
			2. ���� �ܺ������� ��� +��ȣ�� ���� ������ �����ʿ�, ������ �ܺ������� ��� +��ȣ�� ���ʿ� ���δ�

	INNER JOIN (=, ����) : ���ǿ� �´� ROW�� ����	
*/
/*
-- RIGHT OUTER JOIN
SELECT ename,dname,loc
FROM emp,dept
WHERE emp.deptno(+)=dept.deptno;

SELECT ename,dname,loc
FROM emp RIGHT OUTER JOIN dept
ON emp.deptno=dept.deptno;

SELECT ename,dname,loc
FROM emp FULL OUTER JOIN dept
ON emp.deptno=dept.deptno;
*/
/*
-- LEFT OUTER JOIN
-- ��� ��� ��� + �Ŵ��� ������ ������ ǥ��
SELECT e1.empno, e1.ename, e2.empno, e2.ename
FROM emp e1,emp e2
WHERE e1.mgr=e2.empno(+);
*/
/*
	 WHERE emp.deptno=dept.deptno
	------------------------------------
	 LEFT : ���� ���̺�         ���
	------------------------------------
	 RIGHT : ������ ���̺�    �μ�
	------------------------------------
*/
SELECT name,saleprice
FROM customer,orders
WHERE customer.custid=orders.custid(+);
