-- [질의 3-1] 모든 도서의 이름과 가격을 검색하시오.
    SELECT bookname, price
    FROM book;

-- [질의 3-2] 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오.
    SELECT bookid, bookname, publisher, price
    FROM book;
    
-- [질의 3-3] 도서 테이블에 있는 모든 출판사를 검색하시오.
    SELECT DISTINCT publisher
    FROM book;

-- [질의 3-4] 가격이 20,000원 미만인 도서를 검색하시오.
    SELECT *
    FROM book
    WHERE price < 20000;

-- [질의 3-5] 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오.
    SELECT *
    FROM book
    WHERE price BETWEEN 10000 AND 20000;
    
    SELECT *
    FROM book
    WHERE price >= 10000 AND price <= 20000;

-- [질의 3-6] 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’ 인 도서를 검색하시오.
    SELECT bookname, publisher
    FROM book
    WHERE publisher IN ('굿스포츠', '대한미디어');

-- [질의 3-7] ‘축구의 역사’를 출간한 출판사를 검색하시오.
    SELECT bookname, publisher
    FROM book
    WHERE bookname = '축구의 역사';
    
-- [질의 3-8] 도서이름에 ‘축구’ 가 포함된 출판사를 검색하시오.
    SELECT bookname, publisher
    FROM book
    WHERE bookname LIKE '%축구%';

--[질의 3-9] 도서이름의 왼쪽 두 번째 위치에 ‘구’라는 문자열을 갖는 도서를 검색하시오.
    SELECT *
    FROM book
    WHERE bookname LIKE '_구%';

--[질의 3-10] 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
    SELECT *
    FROM book
    WHERE bookname LIKE '%축구%' AND price >= 20000;

--[질의 3-11] 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’ 인 도서를 검색하시오.
    SELECT *
    FROM book
    WHERE publisher IN ('굿스포츠', '대한미디어');
    
    SELECT *
    FROM book
    WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

--[질의 3-12] 도서를 이름순으로 검색하시오. 
    SELECT *
    FROM book
    ORDER BY bookname;

--[질의 3-13] 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오.
    SELECT *
    FROM book
    ORDER BY price, bookname;

--[질의 3-14] 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 출력하시오.
    SELECT *
    FROM book
    ORDER BY price DESC, publisher ASC;

-- 집계 함수와 GROUP BY 검색 --
--[질의 3-15] 고객이 주문한 도서의 총 판매액을 구하시오.
    SELECT SUM(saleprice) AS 총매출
    FROM orders;

--[질의 3-16] 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오.
    SELECT SUM(saleprice) AS 총매출
    FROM orders
    WHERE custid=2;

--[질의 3-17] 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구하시오.
    SELECT SUM(saleprice) AS 총액,
        AVG(saleprice) AS 평균값,
        MIN(saleprice) AS 최저가,
        MAX(saleprice) AS 최고가
    FROM orders;

--[질의 3-18] 마당서점의 도서 판매 건수를 구하시오.
    SELECT COUNT(*) AS 판매건수
    FROM orders; 

--[질의 3-19] 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.
    SELECT custid, COUNT(*) AS 총수량, SUM(saleprice) AS 총액
    FROM orders
    GROUP BY custid; 

--[질의 3-20] 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 단, 두 권 이상 구매한 고객만 구하시오.
    SELECT custid, COUNT(*) AS 총수량
    FROM orders
    WHERE saleprice >= 8000
    GROUP BY custid
    HAVING COUNT(*) >= 2;

-- 두 개 이상 테이블에서 SQL --
--[질의 3-21] 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
    SELECT *
    FROM customer,orders
    WHERE customer.custid = orders.custid;

--[질의 3-22] 고객과 고객의 주문에 관한 데이터를 고객별로 정렬하여 보이시오.
    SELECT *
    FROM customer,orders
    WHERE customer.custid = orders.custid
    ORDER BY customer.custid;

--[질의 3-23] 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
    SELECT name AS 고객명, saleprice AS 판매가격
    FROM customer,orders
    WHERE customer.custid = orders.custid;

--[질의 3-24] 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
    SELECT name AS 고객명, SUM(saleprice) AS 총판매액
    FROM customer,orders
    WHERE customer.custid = orders.custid
    GROUP BY customer.name
    ORDER BY customer.name;

--[질의 3-25] 고객의 이름과 고객이 주문한 도서의 이름을 구하시오. 
    SELECT customer.name AS 고객명, book.bookname AS 도서명
    FROM customer,orders,book
    WHERE customer.custid = orders.custid 
        AND orders.bookid = book.bookid;

--[질의 3-26] 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
    SELECT customer.name AS 고객명, book.bookname AS 도서명
    FROM customer,orders,book
    WHERE customer.custid = orders.custid
        AND orders.bookid = book.bookid
        AND book.price = 20000;

--[질의 3-27] 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
    SELECT customer.name AS 고객명, saleprice AS 판매가격
    FROM customer LEFT OUTER JOIN orderse 
        ON customer.custid = orders.custid;

--[질의 3-28] 가장 비싼 도서의 이름을 보이시오.
    SELECT bookname
    FROM book
    WHERE price = (
        SELECT MAX(price) 
        FROM book
    );
    
--[질의 3-29] 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
    SELECT name
    FROM customer
    WHERE custid IN (
        SELECT custid 
        FROM orders
    );

--[질의 3-30] ‘대한미디어’에서 출판한 도서를 구매한 고객의 이름을 보이시오.
    SELECT DISTINCT name AS 고객명
    FROM customer
    WHERE custid IN(
        SELECT custid 
        FROM orders 
        WHERE bookid IN(
            SELECT bookid
            FROM book
            WHERE publisher='대한미디어'
        )
    );

--[질의 3-31] 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오. 
    SELECT b1.bookname
    FROM book b1
    WHERE b1.price > (
        SELECT AVG(b2.price)
        FROM book b2
        WHERE b2.publisher = b1.publisher
    );

--[질의 3-32] 도서를 주문하지 않은 고객의 이름을 보이시오. 
    SELECT name AS 고객명
    FROM customer
    MINUS
    SELECT name
    FROM customer
    WHERE custid IN(SELECT custid FROM orders);

--[질의 3-33] 주문이 있는 고객의 이름과 주소를 보이시오.
    SELECT DISTINCT name AS 고객명, address AS 주소
    FROM customer cs
    WHERE EXISTS (
        SELECT *
        FROM orders od
        WHERE cs.custid=od.custid
    );

-- 데이터 정의어 --
--[질의 3-34] Customer 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산’으로 변경하시오.
    UPDATE customer
    SET address = '대한민국 부산'
    WHERE custid = 5;

--[질의 3-35] Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.
    UPDATE customer
    SET address = (
        SELECT address 
        FROM customer 
        WHERE name = '김연아'
    )
    WHERE name = '박세리';

--[질의 3-36] Customer 테이블에서 고객번호가 5인 고객을 삭제한 후 결과를 확인하시오.
    DELETE FROM customer
    WHERE custid = 5;
    
    SELECT * FROM customer;  -- 결과 확인

--[질의 3-37] 모든 고객을 삭제하시오.
    DELETE FROM customer;

    SELECT * FROM customer;  -- 결과 확인