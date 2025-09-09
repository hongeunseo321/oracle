package com.sist.main;
/*
-- 2025-09-09 rownum (222page) => 페이지 나누기 기법

    rownum
        쿼리 결괏값에 붙는 가상 컬럼 => SQL 문장에서만 사용 가능
        결과에 따라 rownum의 번호가 변경된다 (유동성)
        --- ORDER BY / 실행 결과
        => default => 오라클에서 설정 (SQL 문장에서 임의로 변경 가능)

SELECT empno,ename,hiredate,sal,job,rownum
FROM emp;

SELECT empno,ename,hiredate,sal,job,rownum
FROM (
    SELECT *
    FROM emp
    ORDER BY sal DESC
);

-- 사용처 : 페이지 나누기, 인기 순위, 공지사항 10개
-- TOP-N => 단점 : 중간에 자를 수 없다

SELECT empno,ename,hiredate,sal,job,rownum
FROM (
    SELECT *
    FROM emp
    ORDER BY sal DESC
)
WHERE rownum BETWEEN 1 AND 5; 
-- 6 AND 10 불가
-- => 인라인뷰 활용
SELECT empno,ename,hiredate,sal,job,num
FROM (
    SELECT empno,ename,hiredate,sal,job,rownum as num
    FROM (
        SELECT empno,ename,hiredate,sal,job
        FROM emp
        ORDER BY sal DESC
    )
)
WHERE num BETWEEN 6 AND 10;
-- ROW_NUMBER() OVER() 윈도 함수 => 최신 개발
SELECT empno,ename,hiredate,sal,job
FROM (
    SELECT empno,ename,hiredate,sal,job,
        ROW_NUMBER() OVER(ORDER BY sal DESC) AS RN
    FROM emp)
WHERE RN BETWEEN 6 AND 10;

-- CRUD : 게시판
CREATE TABLE board(
    no NUMBER,
    name VARCHAR2(51) CONSTRAINT board_name_nn NOT NULL,
    subject VARCHAR2(4000) CONSTRAINT board_sub_nn NOT NULL,
    content CLOB CONSTRAINT board_cont_nn NOT NULL,
    pwd VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    hit NUMBER DEFAULT 0,
    CONSTRAINT board_no_pk PRIMARY KEY(no)
);

CREATE SEQUENCE board_no_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
INSERT INTO board (no,name,subject,content,pwd)
VALUES (
    board_no_seq.nextval,'홍길동', 'CRUD 연습', 'INSERT/UPDATE/DELETE','1234'
);
COMMIT;
select * from board;

SELECT COUNT(*) FROM board;

SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,num
FROM (
    SELECT no,subject,name,regdate,hit,rownum as num
	FROM (
        SELECT no,subject,name,regdate,hit
        FROM board ORDER BY no DESC
    )
)
WHERE num BETWEEN &start AND &end;
 
 */
public class BoardMain {

}
