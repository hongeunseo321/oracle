-- 3장~4장 => 형식 / 순서
/*
	PL/SQL/정규식 (REGEXP_LIKE, REGEXP_COUNT, REGEXP_REPLACE, REGEXP_STRSUB, REGEXP_INSTR)
	=> 그룹 함수 : GROUPING / CUBE / ROLLUP
	=> 데이터베이스 설계 (정규화) / 트랜잭션 사용법
	
	3장
		SELECT => 데이터 검색 => 프로젝트 (80%)
		형식 순서)
			SELECT (DISTINCT|*) * | column_list(연산자(산술),함수)
			FROM table_name | view_name | SELECT ~
		[
			WHERE 조건문(비교연산자, 논리연산자, BETWEEN~AND
						IN, LIKE, NOT, NULL(IS NULL, IS NOT NULL)
			GROUP BY 그룹컬럼|함수(컬럼값동일) => 그룹별 집계
			HAVING 그룹 조건 => GROUP BY가 있는 경우에만 사용 가능
			ORDER BY 정렬할 컬럼 | 함수 (ASC|DESC)
			=> 데이터가 많은 경우 정렬 시에 INDEX
				INDEX_ASC(), INDEX_DESC()
		]

		1) 연산자
			산술 연산자 : +,-, *, / => MOD() : %
				=> ROW 단위 통계 => 제공하는 함수가 없다

			비교 연산자 : =, <>, <, >, <=, >=

			논리 연산자 : AND (범위, 기간 포함), OR (범위, 기간 미포함)
				=> OR은 다중 검색할 경우에 많이 쓰인다

			BETWEEN ~ AND : AND 대신 사용 => 값이 포함
				=> 페이징 기법, 체크인, 예약 기간...

			IN : OR 여러 개인 경우 => MyBatis => forEach
				=> 동적 쿼리

			NOT : 부정 => NOT IN, NOT LIKE, NOT BETWEEN
				=> !는 사용하지 않는다

			NULL : 값이 없는 상태
				=> NullPointerException : 오류 발생
				=> null로 연산 처리 => 결괏값 (null)
				=> IS NULL, IS NOT NULL
				WHERE ename=null => NULL
				WHERE ename IS NULL => (o)
				=> image가 없는 경우

			LIKE 
				% => 문자 제한 X
				_ => 문자 한 글자
				startsWith : 문자% ===> ***Index 적용
				endsWith : %문자
				contains : %문자%

		2) 내장 함수
			= 단일행 함수 : ROW 단위 처리 (한 줄씩 처리)
				문자 함수
					SUBSTR : 문자 자르기
						SUBSTR(컬럼명, 시작 위치, 자를 개수)
						=> 오라클은 1번부터

					INSTR : 문자의 위치
						INSTR(컬럼명, 찾는 문자, 시작 위치, 몇 번째)
	
					LENGTH : 문자의 개수
						LENGTH(컬럼명)
						=> 비밀번호...		
		
					RPAD : 글자 개수가 모자란 경우 (지정된 문자 출력)
						RPAD(컬럼명, 문자 개수(LENGTH), '*')
						=> ad***
						=> 아이디 찾기 / 댓글 ...
					
					***REPLACE : 문자 변경 => &, |, "
						REPLACE(컬럼명, 변경 대상 문자, 변경할 문자)
						=> 웹에서 채팅 (채팅문자 저장)
						=> URL 주소에서 &는 요청값 구분할 때 많이 쓰인다
							웹 프로그램에서 URL은 http://localhost:8080/food_detail.jsp?fno=1&page=3
							fno=1&page=3 => GET / POST / PUT / DELETE / RESTFul
							GET : SELECT
							POST : INSERT
							PUT : UPDATE
							DELETE : DELETE

									
					=> 나머지 함수 : TRIM(), INITCAP, UPPER, LOWER => 자바의 String으로 처리

				숫자 함수
				날짜 함수
				기타 함수
			= 집계 함수 : COLUMN 단위 처리
			*** GROUP BY가 없는 경우 => 단일행, 집계 함수를 같이 사용할 수 없다

		
		3) 조인 / 서브쿼리 => 프로젝트 (반드시 SQLDeveloper)
			자바 => "" (LIKE 문장만 변경) '%A%'
			오라클 => '%'||?||'%'
			MYSQL => CONCAT('%',?,'%') => MARIADB


	4장
		=> CREATE / DROP / TRUNCATE / RENAME / ALTER
		=> DML(INSERT, UPDATE, DELETE)

*/