-- [���� 3-1] ��� ������ �̸��� ������ �˻��Ͻÿ�.
    SELECT bookname, price
    FROM book;

-- [���� 3-2] ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��Ͻÿ�.
    SELECT bookid, bookname, publisher, price
    FROM book;
    
-- [���� 3-3] ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.
    SELECT DISTINCT publisher
    FROM book;

-- [���� 3-4] ������ 20,000�� �̸��� ������ �˻��Ͻÿ�.
    SELECT *
    FROM book
    WHERE price < 20000;

-- [���� 3-5] ������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ�.
    SELECT *
    FROM book
    WHERE price BETWEEN 10000 AND 20000;
    
    SELECT *
    FROM book
    WHERE price >= 10000 AND price <= 20000;

-- [���� 3-6] ���ǻ簡 ���½������� Ȥ�� �����ѹ̵� �� ������ �˻��Ͻÿ�.
    SELECT bookname, publisher
    FROM book
    WHERE publisher IN ('�½�����', '���ѹ̵��');

-- [���� 3-7] ���౸�� ���硯�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�.
    SELECT bookname, publisher
    FROM book
    WHERE bookname = '�౸�� ����';
    
-- [���� 3-8] �����̸��� ���౸�� �� ���Ե� ���ǻ縦 �˻��Ͻÿ�.
    SELECT bookname, publisher
    FROM book
    WHERE bookname LIKE '%�౸%';

--[���� 3-9] �����̸��� ���� �� ��° ��ġ�� ��������� ���ڿ��� ���� ������ �˻��Ͻÿ�.
    SELECT *
    FROM book
    WHERE bookname LIKE '_��%';

--[���� 3-10] �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
    SELECT *
    FROM book
    WHERE bookname LIKE '%�౸%' AND price >= 20000;

--[���� 3-11] ���ǻ簡 ���½������� Ȥ�� �����ѹ̵� �� ������ �˻��Ͻÿ�.
    SELECT *
    FROM book
    WHERE publisher IN ('�½�����', '���ѹ̵��');
    
    SELECT *
    FROM book
    WHERE publisher = '�½�����' OR publisher = '���ѹ̵��';

--[���� 3-12] ������ �̸������� �˻��Ͻÿ�. 
    SELECT *
    FROM book
    ORDER BY bookname;

--[���� 3-13] ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�.
    SELECT *
    FROM book
    ORDER BY price, bookname;

--[���� 3-14] ������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ ����Ͻÿ�.
    SELECT *
    FROM book
    ORDER BY price DESC, publisher ASC;

-- ���� �Լ��� GROUP BY �˻� --
--[���� 3-15] ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
    SELECT SUM(saleprice) AS �Ѹ���
    FROM orders;

--[���� 3-16] 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
    SELECT SUM(saleprice) AS �Ѹ���
    FROM orders
    WHERE custid=2;

--[���� 3-17] ���� �ֹ��� ������ �� �Ǹž�, ��հ�, ������, �ְ��� ���Ͻÿ�.
    SELECT SUM(saleprice) AS �Ѿ�,
        AVG(saleprice) AS ��հ�,
        MIN(saleprice) AS ������,
        MAX(saleprice) AS �ְ�
    FROM orders;

--[���� 3-18] ���缭���� ���� �Ǹ� �Ǽ��� ���Ͻÿ�.
    SELECT COUNT(*) AS �ǸŰǼ�
    FROM orders; 

--[���� 3-19] ������ �ֹ��� ������ �� ������ �� �Ǹž��� ���Ͻÿ�.
    SELECT custid, COUNT(*) AS �Ѽ���, SUM(saleprice) AS �Ѿ�
    FROM orders
    GROUP BY custid; 

--[���� 3-20] ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. ��, �� �� �̻� ������ ���� ���Ͻÿ�.
    SELECT custid, COUNT(*) AS �Ѽ���
    FROM orders
    WHERE saleprice >= 8000
    GROUP BY custid
    HAVING COUNT(*) >= 2;

-- �� �� �̻� ���̺��� SQL --
--[���� 3-21] ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�.
    SELECT *
    FROM customer,orders
    WHERE customer.custid = orders.custid;

--[���� 3-22] ���� ���� �ֹ��� ���� �����͸� ������ �����Ͽ� ���̽ÿ�.
    SELECT *
    FROM customer,orders
    WHERE customer.custid = orders.custid
    ORDER BY customer.custid;

--[���� 3-23] ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
    SELECT name AS ����, saleprice AS �ǸŰ���
    FROM customer,orders
    WHERE customer.custid = orders.custid;

--[���� 3-24] ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
    SELECT name AS ����, SUM(saleprice) AS ���Ǹž�
    FROM customer,orders
    WHERE customer.custid = orders.custid
    GROUP BY customer.name
    ORDER BY customer.name;

--[���� 3-25] ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�. 
    SELECT customer.name AS ����, book.bookname AS ������
    FROM customer,orders,book
    WHERE customer.custid = orders.custid 
        AND orders.bookid = book.bookid;

--[���� 3-26] ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
    SELECT customer.name AS ����, book.bookname AS ������
    FROM customer,orders,book
    WHERE customer.custid = orders.custid
        AND orders.bookid = book.bookid
        AND book.price = 20000;

--[���� 3-27] ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.
    SELECT customer.name AS ����, saleprice AS �ǸŰ���
    FROM customer LEFT OUTER JOIN orderse 
        ON customer.custid = orders.custid;

--[���� 3-28] ���� ��� ������ �̸��� ���̽ÿ�.
    SELECT bookname
    FROM book
    WHERE price = (
        SELECT MAX(price) 
        FROM book
    );
    
--[���� 3-29] ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
    SELECT name
    FROM customer
    WHERE custid IN (
        SELECT custid 
        FROM orders
    );

--[���� 3-30] �����ѹ̵����� ������ ������ ������ ���� �̸��� ���̽ÿ�.
    SELECT DISTINCT name AS ����
    FROM customer
    WHERE custid IN(
        SELECT custid 
        FROM orders 
        WHERE bookid IN(
            SELECT bookid
            FROM book
            WHERE publisher='���ѹ̵��'
        )
    );

--[���� 3-31] ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�. 
    SELECT b1.bookname
    FROM book b1
    WHERE b1.price > (
        SELECT AVG(b2.price)
        FROM book b2
        WHERE b2.publisher = b1.publisher
    );

--[���� 3-32] ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�. 
    SELECT name AS ����
    FROM customer
    MINUS
    SELECT name
    FROM customer
    WHERE custid IN(SELECT custid FROM orders);

--[���� 3-33] �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.
    SELECT DISTINCT name AS ����, address AS �ּ�
    FROM customer cs
    WHERE EXISTS (
        SELECT *
        FROM orders od
        WHERE cs.custid=od.custid
    );

-- ������ ���Ǿ� --
--[���� 3-34] Customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� �����ѹα� �λꡯ���� �����Ͻÿ�.
    UPDATE customer
    SET address = '���ѹα� �λ�'
    WHERE custid = 5;

--[���� 3-35] Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.
    UPDATE customer
    SET address = (
        SELECT address 
        FROM customer 
        WHERE name = '�迬��'
    )
    WHERE name = '�ڼ���';

--[���� 3-36] Customer ���̺��� ����ȣ�� 5�� ���� ������ �� ����� Ȯ���Ͻÿ�.
    DELETE FROM customer
    WHERE custid = 5;
    
    SELECT * FROM customer;  -- ��� Ȯ��

--[���� 3-37] ��� ���� �����Ͻÿ�.
    DELETE FROM customer;

    SELECT * FROM customer;  -- ��� Ȯ��