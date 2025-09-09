-- 2025-09-04 GROUP BY / JOIN / SUBQUERY
/*
	GROUP BY : 데이터 그룹별로 묶어서 집계 = 관리자 모드
	JOIN : 여러 개 테이블을 연결해서 필요한 데이터를 추출
           ------------- 정규화 => 테이블이 많이 나눠진다
		 => 데이터 추출

	SUBQUERY : 여러 개의 SQL을 한 개의 SQL문장으로 변경
		SELECT 뒤 => 스칼라 서브 쿼리 (컬럼 대신)
		FROM 뒤 => 인라인뷰 (테이블 대신)
		WHERE 뒤 => 서브쿼리 (조건값 대신)

	1. GROUP BY => 159page
	   --------
	   같은 값을 가진 컬럼을 묶어서 따로 통계
		통계 => 집합함수를 이용
		=> COUNT / MAX / MIN / SUM / AVG

		주의점
			1) WHERE / HAVING은 혼합하면 문제가 발생할 수 있다
			2) 단일행 함수를 사용할 수 없다
			3) 그룹으로 지정된 컬럼 외의 다른 컬럼을 사용할 수 없다 
		
		실행 순서
			SELECT ---- 4
			FROM ------ 1
			GROUP BY -- 2
			HAVING ---- 3
			ORDER BY -- 5

		=> 컬럼값 중에 같은 값을 가지고 있는 값을 찾아서 그룹화
			예)
				emp 
				deptno(부서번호) / job(직위)
				=> 입사년도 별로 hiredate로 그룹화

		=> SQL 문장
			GROUP BY 컬럼 / 함수

			SELECT 컬럼명|함수명, 집계 함수...
			FROM table_name
			GROUP BY 컬럼명|함수명
			HAVING 조건 (그룹에 대한 조건) => GROUP BY가 있는 경우 사용 가능
			--------- 필요 시에만 사용
			ORDER BY 컬럼명|함수명
*/
-- 부서별(deptno) 급여 평균을 구한다
set linesize 250
set pagesize 25

SELECT deptno, ROUND(AVG(sal))
FROM emp
GROUP BY deptno
ORDER BY deptno;

-- 부서별 인원 수, 급여 총합, 급여 평균, 최댓값, 최솟값
SELECT deptno "부서", 
	COUNT(*) "인원 수",
	SUM(sal) "급여 총합",
	ROUND(AVG(sal)) "급여 평균",
	MAX(sal) "최댓값",
	MIN(sal) "최솟값"
FROM emp
GROUP BY deptno
ORDER BY deptno ASC;


-- 직위별
SELECT job "직위", 
	COUNT(*) "인원 수",
	SUM(sal) "급여 총합",
	ROUND(AVG(sal)) "급여 평균",
	MAX(sal) "최댓값",
	MIN(sal) "최솟값"
FROM emp
GROUP BY job
ORDER BY job ASC;

-- 입사 년도별
SELECT TO_CHAR(hiredate,'yyyy') "입사 년도", 
	COUNT(*) "인원 수",
	SUM(sal) "급여 총합",
	ROUND(AVG(sal)) "급여 평균",
	MAX(sal) "최댓값",
	MIN(sal) "최솟값"
FROM emp
GROUP BY TO_CHAR(hiredate,'yyyy')
ORDER BY TO_CHAR(hiredate,'yyyy') ASC;

-- 입사 요일별
SELECT TO_CHAR(hiredate,'dy"요일"') "입사 요일", 
	COUNT(*) "인원 수",
	SUM(sal) "급여 총합",
	ROUND(AVG(sal)) "급여 평균",
	MAX(sal) "최댓값",
	MIN(sal) "최솟값"
FROM emp
GROUP BY TO_CHAR(hiredate,'dy"요일"')
ORDER BY TO_CHAR(hiredate,'dy"요일"') ASC;

-- MyBatis => 별칭 주는 연습
-- 1차  프로젝트 => DataBase : MyBatis (XML, Annotation)

-- 그룹 조건 : HAVING
-- 평균 급여가 2000 이상인 부서만 출력
SELECT deptno,COUNT(*),AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVg(sal)>=2000;

-- 부서별 인원이 4명 이상인 부서의 인원 수, 급여의 총합
SELECT deptno,COUNT(*),SUM(sal)
FROM emp
GROUP BY deptno
HAVING COUNT(*)>=4;

/*
	159page
	-------
	GROUP BY에서 사용하는 함수 => 집계 함수 (CUBE / ROLLUP...)
	-------- MIN / MAX / COUNT / AVG / SUM
	 |같은 값을 가지고 있는 컬럼 / 함수

	주의점 / 실행 순서 (161page)
		= 마이페이지 / 관리자페이지
		= 단일행 함수 : ROW 단위
		= 집합 함수 : COLUMN 단위

			=> 단일행 함수와 집합 함수는 혼합 불가
				SELECT ename,UPPER(ename),COUNT(*) => 오류
				***단, 그룹으로 사용하는 경우에는 가능

		= 다중 그룹
			부서별 => 직위별, 입사일별 => 입사요일별
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
	교재에서 사용하는 테이블
	orders : 구매내역, book : 책정보, customer : 회원 정보
	------
		ORDERID => 구매번호 => 중복 없는 데이터 (PRIMARY KEY)
		CUSTID => 회원 ID
		BOOKID => 책 번호
		SALEPRICE => 가격
		ORDERDATE => 구매일
*/

SELECT orderid,name,bookname,saleprice,orderdate
FROM orders,customer,book
WHERE orders.custid=customer.custid
AND orders.bookid=book.bookid;


-- 1. 가장 비싼 책을 출력
SELECT MAX(saleprice)
FROM orders;

SELECT bookname
FROM book
WHERE price=(SELECT MAX(saleprice)
FROM orders);

-- 160page => 교재 예재
-- 가격이 8000원 이상 도서를 구매한 고객별 주문 도서의 총 수량
SELECT custid,COUNT(*) "도서수량" --5
FROM orders --1
WHERE saleprice>=8000 --2
GROUP BY custid --3
HAVING COUNT(*)>2 --4
ORDER BY custid; --6

-- 고객별로 도서 수량, 총액을 출력
SELECT custid "고객 아이디", COUNT(*) "도서수량",SUM(saleprice) "총액"
FROM orders
GROUP BY custid
ORDER BY custid;
