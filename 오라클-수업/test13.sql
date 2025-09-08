-- JOIN
set linesize 250 
set pagesize 25

-- 사원 이름이 SCOTT인 사원의 사번, 이름, 부서명, 근무지 출력
SELECT empno,ename,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND ename='SCOTT';

-- 근무지가 DALLAS인 사원의 사번, 이름, 직위, 부서명, 근무지, 입사일 출력
SELEcT empno,ename,job,dname,loc,hiredate
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND loc='DALLAS';

-- 이름 중에 A자가 포함된 사원의 이름, 직위, 부서명, 근무지 출력
SELECT ename,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno
AND ename LIKE '%A%';

/*
	INNER JOIN의 단점 => 연산자 (=) : NULL을 제외
	-------------------------------------------------------
	보완 => null값이 있는 테이블 확인 
		INNER JOIN + (알파) => OUTER JOIN

	OUTER JOIN (관리자 모드)
		1) LEFT OUTER JOIN : 오른쪽 테이블 NULL 처리
			SELECT 컬럼(A), 컬럼(B)
			FROM A, B
			WHERE A.col=B.col(+)

			SELECT 컬럼(A), 컬럼(B)
			FROM A LEFT OUTER JOIN B
			ON A.col=B.col

		2) RIGHT OUTER JOIN : 왼쪽 테이블 NULL 처리
			SELECT 컬럼(A), 컬럼(B)
			FROM A, B
			WHERE A.col(+)=B.col

			SELECT 컬럼(A), 컬럼(B)
			FROM A RIGHT OUTER JOIN B
			ON A.col=B.col

		3) FULL OUTER JOIN 
			SELECT 컬럼(A), 컬럼(B)
			FROM A FULL OUTER JOIN B
			ON A.col=B.col	
		
		사용 목적
			1. 데이터 누락 방지
			2. NULL 처리 => 분석
			3. 통계 목적

		주의점 
			1. 반드시 한 쪽의 테이블은 중복이 없어야 한다 => Primary Key 참조 => Foreign Key
			2. 왼쪽 외부조인인 경우 +기호를 조인 조건의 오른쪽에, 오른쪽 외부조인인 경우 +기호를 왼쪽에 붙인다

	INNER JOIN (=, 포함) : 조건에 맞는 ROW를 연결	
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
-- 모든 사원 출력 + 매니저 정보가 있으면 표시
SELECT e1.empno, e1.ename, e2.empno, e2.ename
FROM emp e1,emp e2
WHERE e1.mgr=e2.empno(+);
*/
/*
	 WHERE emp.deptno=dept.deptno
	------------------------------------
	 LEFT : 왼쪽 테이블         사원
	------------------------------------
	 RIGHT : 오른쪽 테이블    부서
	------------------------------------
*/
SELECT name,saleprice
FROM customer,orders
WHERE customer.custid=orders.custid(+);
