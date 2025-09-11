-- index => PL / SQL
/*
	DQL / DML => 웹 개발자 담당
	= SELECT / INSERT / UPDATE / DELETE
		: JOIN / SubQuery
		형식 / 동작 순서
	= DDL = CREATE / DROP / ALTER (ADD,MODIFY,DROP)
			TRUNCATE / RENAME
		| SEQUENCE (자동 증가)
		| VIEW
		| INDEX
	= DCL = GRANT / REVOKE
	= TCL = COMMIT / ROLLBACK / SAVEPOINT => 8장
	= PL/SQL = FUNCTION / PROCEDURE / TRIGGER
	= 데이터베이스 설계 => 정규화
	= 프로그램(웹) 응용
	----------------------------------------------------------
	1. JSP 프로젝트 : 호스팅 (AWS) => 데이터베이스 사용
	2. Spring 프로젝트 : CI/CD => 실무에 해당
	3. 개인 프로젝트 : 신기술 => 직무 능력
	----------------------------------------------------------

	1) VIEW : 테이블 참조 => 필요한 데이터를 추출해서 저장 (SELECT 문장으로 저장)
		= 하나 이상의 테이블을 참조해서 만든 가상 테이블
		= 실제로 데이터를 저장하는 것은 아니다 (SELECT 문장)
			SELECT text
			FROM user_views
			WHERE view_name='VIEW명(대문자)';

		= View => 실제 테이블처럼 사용 가능
				SELECT ~
				FROM (table_name|view_name|SELECT~)
		
		= 복잡한 쿼리가 있는 경우 => SQL을 단순화
		= 메모리에 저장 (보안성)
		= DML 사용 가능 (제약성)
			=> 단순뷰(테이블 1개만 참조)에서만 사용 가능
			=> ***DISTINCT, GROUP BY, JOIN, 집계함수, UNION => DML 사용 불가

		= 방식
			DML 가능 : WITH CHECK OPTION
				** 실제 참조하는 테이블에 적용
			DML 불가능 : WITH READ ONLY

		= 생성 방법
			CREATE VIEW view_name AS 
				저장할 SELECT 문장

		= 삭제 방법
			DROP VIEW view_name

		= 수정 방법
			CREATE OR REPLACE VIEW view_name AS
				저장할 SELECT 문장

		= 장점
			=> SQL 문장 재사용 (복잡한 쿼리를 단순화)
				CREATE VIEW emp_view AS
				SELECT empno,ename,job,hiredate,sal,dname,loc,grade
				FROM emp,dept,salgrade
				WHERE emp.deptno=dept.deptno
				AND sal BETWEEN losal AND hisal
				=> SELECT * FROM emp_view

			=> 보안 강화 (컬럼을 감추는 경우) : SQL Injection
				시큐어 코딩 (URL, username, password, 컬럼, 테이블 => 파일에 저장)

			=> 독립적으로 사용 가능

		= 단점
			=> 성능 저하 발생 (실행 시마다 참조 테이블 조회)
			=> 제한된 DML 기능
			=> DML 사용 시에 원본 테이블에 영향을 준다

	
	2) 인덱스(INDEX)
		= 데이터베이스 검색 속도를 향상
			B-Tree 데이터 구조 
				예) 1 2 3 4 5 6 7 => 중간에 있는 4가 Root
							
							4
							|
						--------------
						|		|
						2		6
						|		|
					     ------         ------	
					     |     |          |     |
					     1    3         5    7

		= 책 찾아보기 => 인덱스 => 특정 값을 빠르게 찾을 수 있게 만든다
*/