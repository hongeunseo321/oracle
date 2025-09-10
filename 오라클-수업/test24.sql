-- 222page (rownum), 서브쿼리, 시노님, 시퀀스, 인덱스
set linesize 250 
set pagesize 25
/*
	전체 정리, 튜닝
	=> PL / SQL : FUNCTION, PTOCEDURE, TRIGGER
	=> 데이터베이스 설계 / 정규화

	1. ROWNUM
		= 실제 컬럼이 아니다, 가상 컬럼 => 각 ROW 번호 (오라클 처리)
		= 결괏값에 따라 변경이 가능
		= ORDER BY, INDEX를 이용해서 변경
		= 주 사용처)
			인기 순위 10개, 페이징 기법, 이전 / 다음 (상세 보기)
		= 사용 시에는 SELECT, WHERE에서 주로 사용
*/
/*
SELECT empno,ename,job,hiredate,sal,rownum
FROM emp;

-- rownum의 순서 변경 => 인라인뷰를 주로 사용
SELECT empno,ename,job,hiredate,sal,rownum
FROM (
	SELECT * 
	FROM emp ORDER GY sal DESC
);
*/
/*
-- 가장 많이 사용되는 형태
-- 인기 순위 5개
SELECT name,rownum
FROM (
	SELECT name,hit 
	FROM food ORDER BY hit DESC
)
WHERE rownum<=5;
*/
/*
	rownum의 단점
	1. TOP-N : 1부터 ~ 원하는 개수 출력
		=> 1부터는 가능한데, 중간부터 자를 수는 없다

	2. rownum을 변경해서 서브쿼리를 사용해야만 한다
		=> ORDER BY 
*/

-- 범위 => sal 값이 6~10위 => 페이징 기법
-- 중첩 서브쿼리 사용
/*
-- 1. 방법
SELECT empno,ename,job,num
FROM (
	SELECT empno,ename,job,rownum as num
	FROM (
		SELECT empno,ename,job
		FROM emp ORDER BY empno ASC
	)
)
WHERE num BETWEEN 6 AND 10;
*/
/*
-- 2. 방법
SELECT empno,ename,job
FROM (
	SELECT empno,ename,job,rownum as rn
	FROM (
		SELECT empno,ename,job
		FROM emp ORDER BY empno ASC
	) e
	WHERE rownum <=10
)
WHERE rn>=6;
*/
/*
-- 3. 방법 => ROW_NUMBER => 1개의 서브쿼리 사용 => 12c
-- ROW_NUMBER() OVER(ORDER BY empno)
SELECT empno,ename,job
FROM (
	SELECT empno,ename,job,ROW_NUMBER() OVER(ORDER BY empno) AS rn
	FROM emp
)
WHERE rn BETWEEN 6 AND 10;
*/

/*
	1. INSERT => rownum / rowid (인덱스)

	전체 번호 설정 : SELECT rownum 컬럼명...   
		=> 이전 / 다음의 상세 보기 이동
	상위 N (TOP-N) : WHERE rownum<=N   
		=> 인기순위 / 급상승
	N부터 M까지 : rownum 서브쿼리 + BETWEEN N AND M   
	정렬 후에 번호 지정 (변경) : 서브 쿼리 이용
	최신 방법 : ROW_NUMBER() 권장
*/
/*
	시퀀스 : SEQUENCE
		= 독립적으로 존재, 테이블과 직접적 연결 X 
		= 값을 읽는 경우
			=> 현재값 : currval (Current Value)
			=> 다음값 : nextval (Next Value)

		= PRIMARY KEY => 중복 X => 중복 없는 자동 증가 번호 생성 => 시퀀스
		= 초기값 : START WITH
		= 증가값 : INCREMENT BY

		= CACHE : 메모리에 미리 값을 저장한 후에 사용
			=> 성능 향상 => 번호 일정 X (건너뛸 수도 있다) => NOCACHE 사용

		= 대용량 데이터를 INSERT할 경우, 성능 저하
			=> SELECT NVL(MAX(no)+1,1) FROM food => 서브쿼리 사용
			=> MyBatis에서 증가번호를 만들 때 위 예시처럼 만든다 
				<selectKey statement=" 위 예시 "> 
				@SelectKey (어노테이션)
	
		= 속성값
			START WITH => 초기값 (i=1)
			INCREMENT BY => 증가값 (i++, i+=2)
			-------------------
			MINVALUE (1)
			MAXVALUE (100)
			------------------- 증가값 무한대
			CACHE (20)
			NOCACHE
			CYCLE => 100까지 도달 => 다시 1부터
			NOCYCLE (100)
			
			** 단점은 삭제 시에 변경이 없다 (일괄적 X)
			** 장점은 번호가 중복되지 않는다
*/
/*
-- 테이블에 정보 한 개의 테이블에 저장
	user_tables => table_name PRIMARY KEY

CREATE TABLE myFood(
	fno NUMBER,
	name VARCHAR2(30) CONSTRAINT mf_name_nn NOT NULL,
	cate VARCHAR2(20) CONSTRAINT mf_cate_nn NOT NULL,
	price NUMBER,
	CONSTRAINT mf_fno_pk PRIMARY KEY(fno),
	CONSTRAINT mf_fno_ck CHECK(price>=800 AND price<=5000)
); 


-- 중복 방지 : user_sequences
	constraint : 제약 조건 => user_constraints : table명_컬럼명_nn

CREATE SEQUENCE myfood_fno_seq
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 100
	NOCACHE
	NOCYCLE;
*/

-- 시퀀스 이용 방법 => 초기화 => DROP SEQUENCE myfood_fno_seq
-- 크롤링 실패 => TRUNCATE (데이터 삭제) => DROP

/*
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'김밥','한식',2500);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'라면','한식',4000);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'피자','양식',5000);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'치킨','양식',5000);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'짜장면','중식',3000);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'꼬마김밥','한식',800);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'초밥','일식',1990);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'된장찌개','한식',1500);
COMMIT;
*/
-- SELECT myFood_fno_seq.nextval FROM DUAL;
/*
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'우동','일식',1800);
COMMIT;
*/