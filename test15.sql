set linesize 250 
set pagesize 25
/*
	���� ���� ���̺�
		book : å 
			bookid / bookname / publisher / price
		customer : ȸ��
			custid / name / address / phone
		orders : ����
			orderid / custid / bookid / saleprice / orderdate
*/

-- å �߿� ���� ��� å
SELECT bookname
FROM book
WHERE price=(
	SELECT MAX(price)
	FROM book
);
-- MAX ���� ������ �ͼ� => price => WHERE => SELECT 
-- ���� ����) ( ) => FROM => WHERE => SELECT // �������� => ��������

-- ������ ������ ���� ���� �� �̸� ���
SELECT name
FROM customer
WHERE custid NOT IN(
	SELECT DISTINCT custid
	FROM orders
);


SELECT name
FROM (
	SELECT customer.name, COUNT(orders.orderid) AS order_cnt
	FROM customer
	JOIN orders ON customer.custid=orders.custid
	GROUP BY customer.name
	ORDER BY order_cnt DESC
)
WHERE rownum=1;

SELECT c.name, COUNT(o.orderid) AS order_cnt
FROM customer c JOIN orders o
ON c.custid = o.custid
GROUP BY c.custid, c.name
HAVING COUNT(o.orderid) >= ALL(
	SELECT COUNT(o2.orderid)
	FROM orders o2
	GROUP BY o2.custid
);
