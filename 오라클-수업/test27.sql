-- 뷰 (view)
set linesize 250 
set pagesize 25
/*
	Table / sequence / view / synonym / ps/sql (function,procedure,trigger)
	| select / update / delete / insert
	
	select
	| join / subquery
	----------------------------------------- 데이터베이스 설계 방법론
	VIEW
		= 기존의 테이블로부터 데이터를 참조하는 가상 테이블
		= SQL 문장을 단순화, 보안이 뛰어나다
		= 실제 데이터가 저장되는 것이 아니라 SELECT 문장이 저장된다

		1. 단순 뷰 : 테이블 한 개 연결

		2. 복합 뷰 : 테이블 여러 개 연결 (JOIN / SUBQuery)

		3. 인라인 뷰 : FROM 뒤에서 SELECT 문장 이용
	
		*** 주의 : DML(데이터조작어)이 가능 (INSERT, UPDATE, DELETE...)
			=> 참조하는 테이블 자체가 변경된다

		=> WITH CHECK OPTION / *****READONLY OPTION(view =>읽기 전용)
*/
/*
-- 복합뷰
conn system/happy
GRANT CREATE VIEW TO hr;
conn hr/happy
*/
/*
CREATE VIEW emp_dept AS
SELECT empno,ename,sal,job,hiredate,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno;
*/
/*
	1. 뷰 => 사용 권한이 없다
		권한부여 : GRANT CREATE VIEW TO hr
		권한해제 : REVOKE CREATE VIEW FROM hr
		*** system / sysdba
	
	2. 테이블 1개 이상을 참조해서 새롭게 만들어진 가상 테이블

	3. 뷰의 종류
		단순뷰 (테이블 한 개 연결) 
			=> 사용 빈도가 거의 없다 (테이블 사용)
			=> DML(데이터 조작어) 적용 (INSERT, UPDATE, DELETE...)
			=> VIEW에 적용되는 것이 아니라 실제 참조하는 테이블에 적용

		복합뷰 (테이블 2개 이상 연결) : JOIN / SubQuery 
			=> 복잡한 SQL을 사용 시, 인라인 뷰 활용

	4. 목적
		= 보안 => 가상 테이블이라 노출이 안 된다
			=> VIEW는 실제 데이터를 저장하는 것이 아니다 (SQL 문장만 저장)

		= 편리성 => SQL 문장을 저장하고 있기 때문에 재사용 가능
	
		= 독립적으로 사용 가능

	5. 논리적인 뷰의 종류
		WITH CHECK OPTION = DML 적용 (DEFAULT)
		WITH READ ONLY = 읽기 전용 (SELECT)

	6. 뷰 생성
		CREATE VIEW view_name AS SELECT ~

	7. 뷰의 수정
		CREATE OR REPLACE VIEW view_name AS SELECT ~

	8. 뷰의 삭제
		DROP VIEW view_name

	9. 뷰 확인
		SELECT text
		FROM user_views
		WHERE view_name='대문자'
	
	*** 복잡한 SQL이 계속 사용될 경우 => View를 고안
	*** 보안이 필요한 부분
		Spring Security
*/
/*
SELECT text
FROM user_views
WHERE view_name='EMP_DEPT';
*/

-- 단순뷰 : 테이블 한 개를 참조 => DML이 가능
/*
-- 테이블 복사
CREATE TABLE myDept AS
SELECT *
FROM dept;
*/
/*
CREATE VIEW myView AS
SELECT *
FROM myDept;
*/
/*
INSERT INTO myView VALUES(50,'개발부','서울');
COMMIT;
=> mydept에도 같은 행이 추가된다
*/

/*
-- 단순뷰 => 읽기 전용
-- DROP VIEW myView;

CREATE VIEW myView AS
SELECT *
FROM myDept WITH READ ONLY;

INSERT INTO myView VALUES(50,'개발부','서울');
COMMIT;
=> 읽기 전용 뷰에서는 DML 작업 수행 X
*/
-- DROP VIEW myView;
-- DROP TABLE myDept;

/*
-- 수정
CREATE OR REPLACE VIEW emp_dept AS
SELECT empno,ename,job,hiredate,sal,dname,loc,grade
FROM emp,dept,salgrade
WHERE emp.deptno=dept.deptno
AND sal BETWEEN losal AND hisal;
=> 일반 테이블과 동일하게 사용 가능
*/
/*
-- 조건이 있는 뷰
CREATE OR REPLACE VIEW emp_view1 AS
SELECT empno,ename,job,hiredate,sal, (
	SELECT dname
	FROM dept
	WHERE deptno=emp.deptno) "dname", (
		SELECT loc
		FROM dept
		WHERE deptno=emp.deptno) "loc"
FROM emp
WHERE MOD(empno,2)=1;

SELECT ename,dname
FROM emp_view1;
*/
/*
-- 조인 뷰
CREATE OR REPLACE VIEW emp_view2 AS
SELECT empno,ename,job,sal,hiredate,dname,loc,grade
FROM emp
JOIN dept
ON emp.deptno=dept.deptno
JOIN salgrade
ON sal BETWEEN losal AND hisal;
*/

-- 집계 / 그룹 
CREATE OR REPLACE VIEW emp_view3 AS
SELECT deptno, TO_CHAR(hiredate,'yyyy') "regdate", 
	COUNT(*) "count", 
	MAX(sal) "max_sal",
	MIN(sal) "min_sal", 
	SUM(sal) "sum_sal", 
	ROUND(AVG(sal)) "avg_sal"
FROM emp
GROUP BY deptno, TO_CHAR(hiredate,'yyyy')
HAVING AVG(sal) > 2073
ORDER BY deptno;