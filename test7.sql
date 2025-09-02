-- 숫자 함수
/*
	MOD : 나머지 
		MOD(10,2) => 10%2
	***ROUND : 반올림 => 평균
	TRUNC : 내림 => 퇴직금
	***CEIL : 올림 => 총 페이지
*/
-- SELECT MOD(5,2) FROM DUAL;
SELECT empno,ename,sal,hiredate
FROM emp
WHERE MOD(empno,2)=0
ORDER BY empno ASC;

-- SELECT ROUND(123.56,1),TRUNC(123.56,1),CEIL(123.45) FROM DUAL;
-- => 123.6, 123.5, 124

SELECT CEIL(COUNT(*)/20.0) FROM food;

-- 날짜 함수
/*
	***SYSDATE : 시스템의 날짜 / 시간 => 등록일
	***MONTHS_BETWEEN : 기간의 개월 수
	ADD_MONTHS : 해당 개월 후의 날짜
		예) ADD_MONTHS('25/07/21',6) => '26/01/21' (6개월 뒤의 날짜 출력)
	NEXT_DAY : 다음주 해당 요일 출력
		예) NEXT_DAY(SYSDATE,'화') => 9 (다음 주 화요일 날짜 출력)
	LAST_DAY : 해당 달의 마지막 날짜 출력
		예) LAST_DAY(SYSDATE) => 30 (25년 9월의 마지막 날짜 출력)
		     LAST_DAY('25/08/25') => 31
*/
/*
-- SYSDATE
SELECT SYSDATE-1,SYSDATE,SYSDATE+1
FROM DUAL;

SELECT ename,hiredate,sal,ROUND(ROUND(MONTHS_BETWEEN(SYSDATE,hiredate))/12) "momth"
FROM emp;

SELECT SYSDATE,ADD_MONTHS(SYSDATE,5) FROM DUAL;

SELECT NEXT_DAY(SYSDATE,'화') FROM DUAL;

SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT LAST_DAY('25/08/01') FROM DUAL;
*/
/*
	변환 함수
		문자 함수 : **********TO_CHAR()
			예) TO_CHAR(sal,'L99,999') => 한국 원화 출력
		숫자 함수 : TO_NUMBER() 1+'1' =2
		날짜 함수 : TO_DATE()

	*** 자바에서는 입력된 시간 출력이 안 된다

		TO_CHAR : 숫자를 문자열로 변환
			100,000
			9,999,999

		날짜 변환
			YYYY / YY (RRRR / RR)
			MM / M
			DD / D
			HH / HH24
			MI
			SS
			DY : 요일
*/
-- 2025년 09월 02일 => YY/MM/DD
SELECT TO_CHAR(SYSDATE,'YYYY"년" MM"월" DD"일"') FROM DUAL;

SELECT ename,TO_CHAR(hiredate,'YYYY-MM-DD') "hiredate",
	TO_CHAR(sal,'L99,999') "sal"
FROM emp;

SELECT TO_CHAR(SYSDATE,'RRRR-MM-DD HH24:MI:SS')
FROM DUAL;

-- Date
SELECT TO_NUMBER('100') FROM DUAL;
SELECT TO_DATE(SYSDATE,'YYYY-MM-DD') FROM DUAL;
-- TO_DATE => 체크인 / 체크아웃 / 예약일

/*
	기타 함수
		******NVL : NULL값일 때 다른 값으로 대체
			NVL(컬럼명, 대체)
		DECODE : switch
		CASE (PL / SQL) : 다중 if
*/
SELECT ename,hiredate,sal,NVL(comm,0) "comm"
FROM emp;
SELECT ename,hiredate,sal,NVL(comm,0),sal+NVL(comm,0)
FROM emp;

-- DECODE
SELECT ename,job,hiredate,DECODE(deptno,10,'영업부',20,'개발부',30,'총무부',40,'신입') dname
FROM emp;

-- CASE
SELECT ename,job,hiredate,
	CASE WHEN deptno=10 THEN '개발부'
	WHEN deptno=20 THEN '영업부'
	WHEN deptno=30 THEN '총무부'
	WHEN deptno=40 THEN '신입'
	END "dname"
FROM emp;

/*
	문자 관련 : LENGTH, SUBSTR, INSTR, RPAD, UPPER, REPLACE
	숫자 관련 : ROUND, CEIL
	날짜 관련 : SYSDATE, MONTHS_BETWEEN
	변환 관련 : TO_CHAR
	기타 : NVL

	= 연산자
		비교 연산자 / 논리 연산자
		BETWEEN ~ AND / IN / LIKE
	= 자바에서 오라클 SQL로 전송
*/