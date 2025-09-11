-- 224page 서브쿼리 => 조인 / 서브쿼리
set linesize 250 
set pagesize 25
/*
	조인 : SELECT 문장에서만 사용 가능
	서브쿼리 : SELECT, INSERT, UPDATE, DELETE
	
	서브쿼리
		1) WHERE 뒤에 (서브쿼리) => 조건 검색값
			= ***단일행 서브쿼리 : 서브쿼리의 결괏값이 1개인 경우
				예)
					10

			= ***다중행 서브쿼리 : 서브쿼리의 결괏값이 여러 개인 경우
				예)
					10
					20
					30 
					=> 전체 처리 : IN
					=> 한 개 처리 : MIN / MAX, ANY / ALL
						ANY(SOME) / ALL
						> ANY(10,20,30) => 최솟값인 10
						< ANY(10,20,30) => 최댓값인 30
						** ANY와 SOME은 동일하다

						> ALL(10,20,30) => 최댓값인 30
						< ALL(10,20,30) => 최솟값인 10
	
				=> 컬럼을 한 개만 이용한다

			= 다중컬럼 서브쿼리 : 컬럼이 여러 개인 경우

			= 형식
				실행 3. SELECT * 
				실행 1. FROM table_name
				실행 2. WHERE 컬럼명 연산자 (서브쿼리)

		2) SELECT 뒤에 : 컬럼 대신 사용 = 스칼라 서브쿼리

		3) FROM 뒤에 : 테이블 대신 사용 = 인라인뷰 (보안이 뛰어남) 
		
		-------------------------------------------------------------------------------------
					스칼라 서브쿼리							인라인뷰
		------------------------------------------------------------------------------------
		사용위치		SELECT, WHERE, HAVING, ORDER BY	FROM
		결괏값		단일값									다중행, 다중컬럼
		용도(사용처)	계산, 조건 비교							임시테이블, JOIN, GROUP BY, 필터링
		특징		쿼리와 1:1								외부와 조인, 결괏값 가상테이블 형식
		-------------------------------------------------------------------------------------
		=> 뷰 : 저장이 될 때 SQL 문장을 저장


	조인 VS 서브쿼리
		조인 => 데이터 추출 (테이블 1개 이상)
		서브쿼리 => SQL을 통합	

			1) 연결 => 연결에 소모되는 시간이 오래 걸린다 => 미리 여러 개 연결 후에 저장 : Connection Pool
			2) SQL	
			3) 결괏값 읽기
			4) 닫기
			5) 연결
			6) SQL
			7) 결괏값 읽기
			8) 닫기
			9) 연결
			10) SQL
			11) 결괏값 읽기
			12) 닫기
			=> 자바는 네트워크를 통신하기 때문에 최대한 연결을 줄인다 => 서브쿼리 사용
*/
/*
-- 1. 사원 급여와 평균 급여 비교 (스칼라 서브쿼리)
SELECT ename, sal, (
	SELECT ROUND(AVG(sal))
	FROM emp) as avg_sal
FROM emp
WHERE sal> (
	SELECT ROUND(AVG(sal))
	FROM emp);


-- 2. myFood 가격 기준 사원 조회 (스칼라 서브쿼리)
SELECT ename, sal
FROM emp
WHERE sal >= (
	SELECT MIN(price)
	FROM myfood) AND sal <= (
		SELECT MAX(price)
		FROM myfood);


-- 3. 살 수 있는 음식 (인라인뷰 + JOIN)
SELECT ename, sal, name, price
FROM emp
JOIN (
	SELECT *
	FROM myfood) mf
ON sal = mf.price;
-- 조인 대신 사용 / 테이블 대신 사용 => 보안이 뛰어나다
*/
/*
SELECT ename,sal,dname,price
FROM emp 
JOIN dept
ON emp.deptno=dept.deptno
JOIN myFood
ON emp.sal=myFood.price;

SELECT ename,sal, (
	SELECT dname
	FROM dept
	WHERE deptno=emp.deptno) "dname", (
		SELECT DISTINCT price
		FROM myFood
		WHERE price=emp.sal) "price"
FROM emp;
*/
-- 인라인 뷰 => 테이블 대신 사용
/*
-- 가상 테이블
SELECT empno,ename,job,hiredate,sal
FROM (
	SELECT *
	FROM emp); 
*/

SELECT empno,ename,job,dname,loc
FROM (
	SELECT empno,ename,job,dname,loc
	FROM emp,dept
	WHERE emp.deptno = dept.deptno);


