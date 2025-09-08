-- 집합 함수 : column단위 (집계 함수)
/*
	-- SQL 문장 내부 실행 순서 => 144page
	-- SELECT 문장 => 145page
	-- 연산자 => 149page
	-- 내장 함수 => 단일행 함수 => 209~210page 
	-- 숫자 관련 함수 => 211page
	-- 문자 관련 함수 => 213page
	-- 날짜 관련 함수 => 216page
	-- 변환 함수 => 218page
	-- NULL 함수 => 219page

	COUNT : row의 개수
		COUNT(*) / COUNT(column)
		-----------    -----------------
		NULL 포함      NULL 제외

		=> 로그인 ID 존재 여부
		=> ID 중복 체크
		=> 검색 개수
		=> 장바구니 여부
		
	MAX : 최댓값 ==> MAX(컬럼명)
		=> 자동 증가 번호
		=> 중복이 없는 데이터 첨부 (PRIMARY KEY)
		=> 번호 / 날짜(등록일)
			       ------------- 사용자 입력 (예약일, 생일...)

	MIN : 최솟값
		=> 사용빈도가 적다

	SUM : 총 합계 

	AVG : 평균
*/
/*
SELECT COUNT(*)
FROM food
WHERE address LIKE '%서교%';

SELECT MAX(empno),MAX(empno)+1
FROM emp;
*/