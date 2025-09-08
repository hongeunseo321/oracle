set linesize 250 
set pagesize 25
-- 179page 데이터 정의 언어
/*
	1. table : 데이터 저장 공간
		= 데이터형
		= 정형화 : 출력에 필요한 데이터만 수집 => 원하는 데이터만
		   ------ 제약 조건

	2. view : 가상 테이블
	3. sequence : 자동 증가 번호
	4. 시노님 : 테이블의 별칭
	5. ****INDEX : 속도를 최적화 = 검색, 정렬... (면접 92% 단골 질문)
	6. PL / SQL
		=> FUNCTION / PROCEUDE / TRIGGER
		= FUNCTION : 리턴형이 있는 함수 (내장 함수) => SELECT
		= PROCEUDE : 메소드와 동일, 리턴형은 없다
		= TRIGGER : 연쇄 반응 = 자동화 처리
			예) 게시물 = 댓글
			     입고 = 재고
			     출고 = 재고
	-------------------------------------------------------------------
	데이터베이스 설계 (정규화 = 1, 2, 3 정규화)

	=> DML (INSERT, UPDATE, DELETE) : 데이터 조작어 => 복구 가능

	1. DDL : 데이터 정의어 => 복구 불가 (COMMIT / ROLLBACK 불가)
		명령어 => CREATE, ALTER, DROP, TRUNCATE, RENAME
		생성)
			CREATE TABLE
			CREATE VIEW
			CREATE SEQUENCE
			CREATE FUNCTION ...
		삭제)
			DROP TABLE
			DROP VIEW
			DROP SEQUENCE ...

		수정)
			ALTER TABLE table명 ADD => 컬럼 추가
			ALTER TABLE table명 MODIFY => 컬럼 변경
			ALTER TABLE table명 DROP => 컬럼 제거

		잘라내기)
			TRUNCATE TABLE table_name
	
		이름 변경)
			RENAME old_name TO new_name


	table명 / 컬럼명 => XE 폴더에 저장 
		=> ***유일 값이 필요하다 (중복 X)
		=> 글자 수 30자 내외
		=> 특수문자 허용 : _
		=> 숫자 허용 : 앞에는 사용 금지
		=> 알파벳 한글 허용 (알파벳 권장) : 알파벳 대소문자 구분 X, 실제 메모리에 대문자로 저장

		형식)
			CREATE TABE table_name(
				컬럼명 데이터형 [제약 조건],
				컬럼명 데이터형 [제약 조건],
				컬럼명 데이터형 [제약 조건]
			);

		테이블 생성 순서
			1) 컬럼 결정 : 어떤 데이터를 저장할지 분석 = 요구사항

			2) 데이터형 지정
				문자 저장
					CHAR : 1~2000byte => 고정 길이 문자
						=> 같은 크기의 데이터가 있는 경우

					VARCHAR2 : 1~4000byte => 가변 길이 문자
						=> 일반적으로 사용되는 문자

					CLOB : 4GB => 가변 대용량 문자
						=> 내용 / 줄거리 ...

				숫자 저장
					NUMBER : 8자리
						예) NUMBER(4) : 전체 4자리 정수
						     NUMBER(2,1) : 전체 2자리, 소수점 1자리 가능
				날짜 저장 
					DATE / TIMESTAMP

			3) 제약 조건 부여 (CONSTRAINT)
				NOT NULL : 반드시 값이 있어야 함

				UNIQUE : 중복 불가 (NULL은 허용)
					예) 전화번호 / 이메일 ...

				PRIMARY KEY : NOT NULL + UNIQUE (기본키 = 테이블 식별자)
					예) 숫자 / 아이디 ...모든 데이터 찾기
					=> 자동 INDEX

				FOREIGN KEY : 다른 테이블의 PK 참조 (외래키 = 참조 무결성)
					예) member = id, reserve = 예약번호, id(값이 존재)

				CHECK : 특정 조건 만족해야 함 (지정된 문자만 사용 가능)
					예) 남자 / 여자 지정 => 성별 값 제한, 범위 제한

				DEFAULT : 값이 입력되지 않았을 때 기본값 설정
				------------------------------------------------------------------
				* 제약 조건 여러 개 사용 가능

				실제 테이블
				----------- 제약 조건에 대한 수정
				*** 크롤링 / 테이블은 한 명이 만들어야 한다 (중복 X)
				*** 모든 제약 조건은 user_constaints 안에 저장
				
					=> 컬럼 레벨 : 컬럼 생성과 동시에 제약 조건 저장
						=> NOT NULL, DEFAULT
			
					=> 테이블 레벨 : 테이블 생성 후에 제약 조건 저장
						=> UK, PK, FK, CK					 

					CREATE TABLE table_name (
						컬럼명 데이터형 CONSTRAINT table명_컬럼명_nn NOT NULL,
						컬럼명 데이터형 DEFAULT 값,
						...,
						CONSTRAINT table명_컬럼명_pk PRIMARY KEY (컬럼),
						CONSTRAINT table명_컬럼명_uk UNIQUE (컬럼),
						CONSTRAINT table명_컬럼명_ck CHECK (컬럼 IN(...)),
						CONSTRAINT table명_컬럼명_fk FOREIGN KEY (컬럼)
						REFERENCES 참조할 테이블 (컬럼)
					);
				
*/

DROP TABLE A;
/*
CREATE TABLE A(
	name VARCHAR2(20) CONSTRAINT a_name_nn NOT NULL,
	sex VARCHAR2(20)
);
ALTER TABLE A DROP CONSTRAINT a_name_nn;

INSERT INTO A VALUES('홍길동','남자');
INSERT INTO A VALUES('','여자');
INSERT INTO A VALUES('','남자');
INSERT INTO A VALUES('','여자');
INSERT INTO A VALUES('박문수','남자');

CREATE TABLE A(
	name VARCHAR2(20) NOT NULL,
	sex VARCHAR2(20) NOT NULL
);
*/
/*
	a, 1
	b, 2
	a, 2
	b, 1
*/
CREATE TABLE A(
	id VARCHAR2(10),
	phone VARCHAR2(20),
	PRIMARY KEY(id,phone)
);
