-- 2025-09-03 집합 함수
/*
	1. 형식 / 동작 순서 / 연산자 / 내장 함수 => 단일 테이블
		다중 테이블 : 조인, 서브 쿼리 => SELECT

	1) SELECT 문장의 형식
		*** 개발자 => 오라클에 요청 (데이터 추출) => 142page

							   SQL
		자바(JDBC = Mybatis = JPA) =====> 오라클 
		 |					<===== 
		 |					  실행결과 ResultSet (메모리 공간)
                 ㄴ콘솔, 윈도우, 브라우저

                *** SELECT => 오라클 데이터 검색(추출)을 요청 => 문자열                      
		SELECT *(전체) | column_list (화면 출력 부분)
		FROM table_name
		[
			WHERE => 조건에 맞는 데이터만 추출
		                         ----------------------------- 연산자
			GROUP BY => 그룹별로 묶어서 통계, 기능 처리 ==> 관리자 모드
			HAVING => GROUP BY가 있는 경우에만 사용 (그룹 조건)
			ORDER BY => 정렬 (최신 데이터 => DESC)
			----------- 단순한 데이터 (데이터가 많은 경우 INDEX 사용)
		]

		WHERE 문장 사용 => 연산자
			산술 연산자 : + (산술 연산), -, *, / (정수/정수=실수)
					  --- 문자열 결합 => ||
					       '100'+1 => 101 (속도가 느리다)
					       TO_NEMBER('100')+1
			
			비교 연산자 : =, !=(<>), <, >, <=, >=
			논리 연산자 : AND (범위 포함), OR (범위 미포함)
			BETWEEN ~ AND : 기간, 범위 >= AND <=
			                                         -------------- 권장
			=> 브라우저 : 쓰레드 (문자열, 이미지)
			IN : OR가 많은 경우
			NULL : 컬럼 값이 NULL일 경우 => 연산 처리가 안 된다 (결괏값 : NULL)
				   컬럼=null => IS NULL
				   컬럼!=null => IS NOT NULL  
			NOT : 부정
				  NOT IN, NOT BETWEEN, NOT LIKE
			LIKE : % => 개수 제한 X 
				 _  => 한 글자
				 컬럼 LIKE 'A&' => 자동 완성기
				 컬럼 LIKE '%A'
				 컬럼 LIKE '%A%' => 주로 검색

		내장 함수
			ROW 단위 처리 => 단일행 함수
				문자 함수
					LENGTH : 문자 개수 => LENGTH(컬럼명)
					SUBSTR : 문자 자르기 => SUBSTR(컬럼명, 시작 위치, 자를 개수)
							** 자바는 문자열 번호 0번부터
							** 오라클은 문자열 번호 1번부터
					INSTR : 문자 찾기 => indexOf, LastIndexOf
						=> INSTR(컬럼|문자열, 찾는 문자, 시작 위치, 몇 번째)
					RPAD : 문자가 없는 경우에 다른 문자 대체
						=> ID 찾기에 보통 쓰인다
					REPLACE : 다른 문자로 대체 => &, ||
						REPLACE(문자열|컬럼, 찾는 문자, 변경할 문자)

				숫자 함수
					MOD : 나머지 => MOD(10, 3) => 10%3
					ROUND : 반올림 => ROUND(실수,자릿수) 
						=> 평균 구하기
					CEIL : 올림 => CEIL(실수) => 정수 => 소수점이 1 이상
						=> 총 페이지 구하기

				날짜 함수
					SYSDATE : 시스템의 날짜 / 시간 => 등록일
					MONTHS_BETWEEN : 해당 기간의 달 수
						=> MONTHS_BETWEEN(최근, 과거)

				변환 함수
					TO_CHAR : 날짜, 숫자 => 문자열화
						날짜 => YYYY (RRRR) / MM / DD
						시간 => HH (HH24) / MI / SS
						요일 => DY

				기타 함수
					NVL : NULL을 대체해서 출력
						=> NVL(컬럼명, 대체 값)
						=> 컬럼명과 데이터형과 동일
						=> 컬럼 VARCHAR2 => 문자열
							    NUMBER => 숫자
							    DATE => 날짜형
		
			컬럼 전체 단위 처리 => 집계 함수, 집합 함수 (통계)
				***COUNT => ROW의 개수
					COUNT(컬럼명) => NULL값 제외
					COUNT(*) => NULL값 포함
						=> 로그인 처리 (ID 존재 여부)
						=> 검색 결과
						=> ID 중복 체크
						=> 장바구니 빈 상태 확인

				***MAX / MIN : 전체 대상의 최댓값 / 최솟값 
				AVG : 전체 대상의 평균
				***SUM : 전체 대상의 총합
				RANK() : 순위 결정 => DESC / ASC
					=> RANK() OVER(ORDER BY 컬럼 ASC|DESC)
						예) 
							1등
							2등
							2등
							4등 => 기록 경기

					=> DENSE_RANK() OVER(ORDER BY 컬럼 ASC|DESC)
						예)
							1등
							2등
							2등
							3등 => 노래 순위, 영화 순위...

				*** 집합 함수 사용 시에는 컬럼, 단일행 함수를 사용할 수 없다
					단, 컬럼을 사용할 때는 GROUP BY를 사용하면 가능하다
*/
/*
-- emp에 있는 인원 확인 => COUNT
SELECT COUNT(*) "총 인원", COUNT(mgr) "사수가 있는 사원", COUNT(comm) "성과급을 받는 사원"
FROM emp;
*/
/*
-- emp 안에 급여를 가장 많이 받는 사원의 급여, 가장 적게 받는 사원의 급려
-- MAX(컬럼명) / MIN(컬럼명)
-- MAX는 자동 증가 번호를 만들 때 주로 쓰인다 => MAX+1 => SEQUENCE
SELECT MAX(sal) "가장 많이 받는 사원의 급여", MIN(sal) "가장 적게 받는 사원의 급여"
FROM emp;
*/
/*
-- emp 안의 급여 평균 / 총합
-- AVG(컬럼명) / SUM(컬럼명)
SELECT ROUND(AVG(sal)),SUM(sal)
FROM emp; 
*/
/*
-- 부서번호가 10번 => 급여 총합 / 평균 / 가장 많은 급여 / 가장 적은 급여 / 인원
SELECT SUM(sal), AVG(sal), MAX(sal), MIN(sal), COUNT(*)
FROM emp
WHERE deptno=10;

-- 부서번호가 10번 => 급여 총합 / 평균 / 가장 많은 급여 / 가장 적은 급여 / 인원
SELECT SUM(sal), AVG(sal), MAX(sal), MIN(sal), COUNT(*)
FROM emp
WHERE deptno=20;

-- 부서번호가 10번 => 급여 총합 / 평균 / 가장 많은 급여 / 가장 적은 급여 / 인원
SELECT deptno, SUM(sal), AVG(sal), MAX(sal), MIN(sal), COUNT(*)
FROM emp
GROUP BY deptno;
*/

-- emp에서 사원 중에 급여의 평균보다 적게 받는 사원의 모든 정보 출력
-- 서브쿼리 활용
SELECT ROUND(AVG(sal)) FROM emp;
SELECT *
FROM emp
WHERE sal<(SELECT ROUND(AVG(sal)) FROM emp);
