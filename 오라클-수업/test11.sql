-- 2025-09-04 GROUP BY / JOIN / SUBQUERY
/*
	GROUP BY : ������ �׷캰�� ��� ���� = ������ ���
	JOIN : ���� �� ���̺��� �����ؼ� �ʿ��� �����͸� ����
           ------------- ����ȭ => ���̺��� ���� ��������
		 => ������ ����

	SUBQUERY : ���� ���� SQL�� �� ���� SQL�������� ����
		SELECT �� => ��Į�� ���� ���� (�÷� ���)
		FROM �� => �ζ��κ� (���̺� ���)
		WHERE �� => �������� (���ǰ� ���)

	1. GROUP BY => 159page
	   --------
	   ���� ���� ���� �÷��� ��� ���� ���
		��� => �����Լ��� �̿�
		=> COUNT / MAX / MIN / SUM / AVG

		������
			1) WHERE / HAVING�� ȥ���ϸ� ������ �߻��� �� �ִ�
			2) ������ �Լ��� ����� �� ����
			3) �׷����� ������ �÷� ���� �ٸ� �÷��� ����� �� ���� 
		
		���� ����
			SELECT ---- 4
			FROM ------ 1
			GROUP BY -- 2
			HAVING ---- 3
			ORDER BY -- 5

		=> �÷��� �߿� ���� ���� ������ �ִ� ���� ã�Ƽ� �׷�ȭ
			��)
				emp 
				deptno(�μ���ȣ) / job(����)
				=> �Ի�⵵ ���� hiredate�� �׷�ȭ

		=> SQL ����
			GROUP BY �÷� / �Լ�

			SELECT �÷���|�Լ���, ���� �Լ�...
			FROM table_name
			GROUP BY �÷���|�Լ���
			HAVING ���� (�׷쿡 ���� ����) => GROUP BY�� �ִ� ��� ��� ����
			--------- �ʿ� �ÿ��� ���
			ORDER BY �÷���|�Լ���
*/
-- �μ���(deptno) �޿� ����� ���Ѵ�
set linesize 250
set pagesize 25

SELECT deptno, ROUND(AVG(sal))
FROM emp
GROUP BY deptno
ORDER BY deptno;

-- �μ��� �ο� ��, �޿� ����, �޿� ���, �ִ�, �ּڰ�
SELECT deptno "�μ�", 
	COUNT(*) "�ο� ��",
	SUM(sal) "�޿� ����",
	ROUND(AVG(sal)) "�޿� ���",
	MAX(sal) "�ִ�",
	MIN(sal) "�ּڰ�"
FROM emp
GROUP BY deptno
ORDER BY deptno ASC;


-- ������
SELECT job "����", 
	COUNT(*) "�ο� ��",
	SUM(sal) "�޿� ����",
	ROUND(AVG(sal)) "�޿� ���",
	MAX(sal) "�ִ�",
	MIN(sal) "�ּڰ�"
FROM emp
GROUP BY job
ORDER BY job ASC;

-- �Ի� �⵵��
SELECT TO_CHAR(hiredate,'yyyy') "�Ի� �⵵", 
	COUNT(*) "�ο� ��",
	SUM(sal) "�޿� ����",
	ROUND(AVG(sal)) "�޿� ���",
	MAX(sal) "�ִ�",
	MIN(sal) "�ּڰ�"
FROM emp
GROUP BY TO_CHAR(hiredate,'yyyy')
ORDER BY TO_CHAR(hiredate,'yyyy') ASC;

-- �Ի� ���Ϻ�
SELECT TO_CHAR(hiredate,'dy"����"') "�Ի� ����", 
	COUNT(*) "�ο� ��",
	SUM(sal) "�޿� ����",
	ROUND(AVG(sal)) "�޿� ���",
	MAX(sal) "�ִ�",
	MIN(sal) "�ּڰ�"
FROM emp
GROUP BY TO_CHAR(hiredate,'dy"����"')
ORDER BY TO_CHAR(hiredate,'dy"����"') ASC;

-- MyBatis => ��Ī �ִ� ����
-- 1��  ������Ʈ => DataBase : MyBatis (XML, Annotation)

-- �׷� ���� : HAVING
-- ��� �޿��� 2000 �̻��� �μ��� ���
SELECT deptno,COUNT(*),AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVg(sal)>=2000;

-- �μ��� �ο��� 4�� �̻��� �μ��� �ο� ��, �޿��� ����
SELECT deptno,COUNT(*),SUM(sal)
FROM emp
GROUP BY deptno
HAVING COUNT(*)>=4;

/*
	159page
	-------
	GROUP BY���� ����ϴ� �Լ� => ���� �Լ� (CUBE / ROLLUP...)
	-------- MIN / MAX / COUNT / AVG / SUM
	 |���� ���� ������ �ִ� �÷� / �Լ�

	������ / ���� ���� (161page)
		= ���������� / ������������
		= ������ �Լ� : ROW ����
		= ���� �Լ� : COLUMN ����

			=> ������ �Լ��� ���� �Լ��� ȥ�� �Ұ�
				SELECT ename,UPPER(ename),COUNT(*) => ����
				***��, �׷����� ����ϴ� ��쿡�� ����

		= ���� �׷�
			�μ��� => ������, �Ի��Ϻ� => �Ի���Ϻ�
			SELECT deptno,job
			...
			GROUP BY deptno,job				
*/

SELECT deptno,job,COUNT(*),SUM(sal),AVG(sal)
FROM emp
GROUP BY deptno,job
ORDER BY deptno ASC;

SELECT TO_CHAR(hiredate,'yyyy'),TO_CHAR(hiredate,'dy'),COUNT(*),SUM(sal),AVG(sal)
FROM emp
GROUP BY TO_CHAR(hiredate,'yyyy'),TO_CHAR(hiredate,'dy')
ORDER BY TO_CHAR(hiredate,'yyyy') ASC;

/*
	���翡�� ����ϴ� ���̺�
	orders : ���ų���, book : å����, customer : ȸ�� ����
	------
		ORDERID => ���Ź�ȣ => �ߺ� ���� ������ (PRIMARY KEY)
		CUSTID => ȸ�� ID
		BOOKID => å ��ȣ
		SALEPRICE => ����
		ORDERDATE => ������
*/

SELECT orderid,name,bookname,saleprice,orderdate
FROM orders,customer,book
WHERE orders.custid=customer.custid
AND orders.bookid=book.bookid;


-- 1. ���� ��� å�� ���
SELECT MAX(saleprice)
FROM orders;

SELECT bookname
FROM book
WHERE price=(SELECT MAX(saleprice)
FROM orders);

-- 160page => ���� ����
-- ������ 8000�� �̻� ������ ������ ���� �ֹ� ������ �� ����
SELECT custid,COUNT(*) "��������" --5
FROM orders --1
WHERE saleprice>=8000 --2
GROUP BY custid --3
HAVING COUNT(*)>2 --4
ORDER BY custid; --6

-- ������ ���� ����, �Ѿ��� ���
SELECT custid "�� ���̵�", COUNT(*) "��������",SUM(saleprice) "�Ѿ�"
FROM orders
GROUP BY custid
ORDER BY custid;
