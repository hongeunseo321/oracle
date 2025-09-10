-- 4장 (SQL 고급)
set linesize 250 
set pagesize 25
/*
	1장 : 내장 함수 (209page)
		사용처
			SELECT, WHERE, GROUP BY, HAVING, ORDER BY 뒤에
			=> 컬럼처럼 사용
			=> 리턴값을 가지고 있다
			=> 리턴형 (처리 결과값) / 매개변수 (사용자 입력)

		형식
			CREATE FUNCTION func_name(매개변수)
			RETURN 데이터형
			BEGIN 
				SQL 문장 처리
				RETURN 값
			END;

		단일행 함수 => ROW 행단위 처리
			= 문자 관련 => 웹 : 자바 (String), 오라클
				SUBSTR() : 문자 자르기 (문자열|컬럼명,시작 위치, 자를 개수)
					=> 시작 번호 1번부터, 자바는 0번부터
					=> 자바, 자바스크립트 : substring() => AJAX / VUE / REACT (자바스크립트 라이브러리)

				INSTR : 문자 위치 찾기 (문자열|컬럼명, 찾는 문자, 시작 위치, 몇 번째 위치)
					예) 몇 번째 위치 설정 : Hello Java => 1번째에 있는 a인지, 2번째에 있는 a인지 설정
					=> indexOf / lastIndexOf 동시 처리

				RPAD : 문자 대체 (문자열, 출력 개수, 대체 문자)
					예) RPAD('ADMIN', 10, '#') => ADMIN#####
					=> 아이디 찾기... (ADM*******)

				LENGTH : 문자 개수 (문자열)
				
				REPLACE : 문자 변경 (문자열, 변경할 문자, 변경 문자)
					예)
						& => URL (이미지) => | => 저장
						&는 URL의 구분자이다
						http://localhost/board.jsp?no=10&name=aaa 
						& => ^로 변경

			= 숫자 관련 => 자바 (Math)
				MOD : 나머지 (MOD(10,3) => 10%3)
				ROUND : 반올림
				CEIL : 올림

			= 날짜 관련 => 자바 (Calendar)
				SYSDATE : 시스템의 날짜, 시간 => 정수형처럼 사용
					예) SYSDATE-1 => 어제 / SYSDATE+1 => 내일

				MONTHS_BETWEEN : 기간의 개월 수
					예) MONTHS_BETWEEN(최신, 이전)
						(최신, 이전) = SYSDATE, hiredate...

			= 변환 => 자바 (DecimalFormat / SimpleDateFormat)
				TO_CHAR : 문자열 변환
					예) YYYY / RRRR, MM, DD HH|HH24, MI, SS, DY
						999,999,999
					
			= 기타 => 자바에 존재하지 않는다 (NVL)
				NVL : null 값 대신 다른 값으로 대체

		집계 함수 => COLUMN  열단위 처리
			= ***COUNT : ROW의 개수
			= MAX, MIN
			= SUM : 합
			= AVG : 평균
			= CUBE (→ 통계) : ROW 단위 합
			= ROLLUP (→↓ 통계) : ROW, COLUMN 합

	2장 : 서브 쿼리 => 단계별
	3장 : 인덱스 => 검색 최적화 / 정렬

	5장 : 프로그램
		1) PL / SQL => 오라클 프로그램
			=> FUNCTION / PROCEDURE / TRIGGER => ERD... 기업에서 호불호
		2) JDBC
		3) 웹 프로그램 : JSP (보류)

	6장 : 데이터베이스 설계 (개념 설계, 논리 설계, 물리 설계 => 데이터모델)
	7장 : 정규화
	8장 : 트랜잭션
	9장 : 어드민 => 복구 / 백업 / 보안 (예제만)
*/