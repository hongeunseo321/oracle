-- 179page => DDL / DML
/*
	SQL
	  |
	DQL : 데이터 질의어
		  SELECT : 데이터 검색

	DDL : 데이터 정의어
		  CREATE : 생성 => TABLE : 데이터 저장 공간 (FILE)
		                            VIEW : 가상 테이블 => 기존 테이블을 제어
		                            SEQUENCE : 자동 증가 번호
		                            INDEX / 시노님 
		                            PS / SQL => 함수, 트리거
		  DROP : 삭제
		  ALTER : 수정 => ADD, MODIFY, DROP
		                    => 컬럼 단위, 제약 조건
		  TRUNCATE : 잘라내기
		  RENAME : 테이블 이름 변경

	DML : 데이터 조작어
		  INSERT : 데이터 추가
		  UPDATE : 데이터 수정
		  DELETE : 데이터 삭제

	DCL : 데이터 제어어
		  GRANT : 권한 부여
		  REVOKE : 권한 해제

	TCL : 트랜젝션 제어어
		  COMMIT : 정상 수행
		  ROLLBACK : 비정상 수행
		  ** 오라클 자체에서는 COMMIT이 돼야 저장
			자바는 AutoCommit
			=> TRANSACTION

	1) 데이터 저장 공간
	    ------------------
		1. 데이터형
			문자열
				CHAR(1~2000byte) 지정 => CHAR(10)
					=> 고정 바이트 (메모리가 항상 고정)
					=> 예) CHAR(10) => 'A' ===>
						  ---------------------------
						       'A' \0 \0 ... 10개
						  ---------------------------
						   글자 수가 같은 경우 (남자/여자, y/n) 
				
				VARCHAR2(1~4000byte) => 오라클에서 한글 (한 글자 3byte)
					=> 가변 바이트 (메모리가 글자 수에 따라 메모리 크기가 변한다)
					=> 가장 많이 사용하는 문자열
					=> 오라클에만 존재하는 데이터형

				CLOB : 4GB => 가변형
					=> 한글 1000자 넘는 경우에 사용
					=> 예) 줄거리 / 회사 소개 / 자기 소개 / 글 쓰기
				------------------------------------------------------------- 자바에서 String으로 처리 (10g)

			숫자
				NUMBER => int, long, double
				---------- (38)
					=> default => 8자리 사용 가능 (숫자가 8개 존재)
					=> 예) NUMBER(8,2) => 12345678.12 (X) 123456.78 (O)
						   NUMBER(4) => 0~9999
						   NUMBER(2,1) => 평점
				
			날짜
				DATE => java.util.Date
				TIMESTAMP

			기타 (사용 빈도가 적다) => 사진 / 동영상 / 로그
				BLOB => 2진 File
				BFILE => File 형태로 저장 => 폴더에 저장 => 파일을 읽어서 출력

			형식)
				컬럼명 데이터형

		1-1. 테이블의 식별자
			= 같은 데이터베이스에서 같은 테이블은 사용 금지
			= XE
			1) 문자로 시작한다 (알파벳, 한글) 
				=> 알파벳은 대소문자 구분 X
					단, 실제 저장은 대문자로 저장된다
				
				=> WHERE table_name='emp' => 'EMP'

				=> 실제 저장 공간
					테이블 확인 : user_tables
					user_views ... user_sequences ..., user_constraints

			2) 테이블명은 30(bytes)자 사용 가능 
				=>컬럼명도 동일
			
			3) 숫자 사용 가능 
				=> 앞에 사용 금지

			4) 특수문자 ( _ , $ ) 사용 가능
				=> 단어 두 개인 경우 file_name

			5) 키워드 사용 금지
				SELECT / FROM / GROUP BY / ORDER BY ...JOIN (X)

		2. 정형화된 데이터 : 필요한 데이터 수집 => 제약 조건
			=> 제약 조건 : 이상 현상 방지
			=> 이상 현상 : 수정, 삭제할 경우 문제 발생 => 원하지 않는 데이터가 제어

			= NOT NULL : 반드시 입력값이 있어야 한다
				*** 필수 입력 / 입력 메시지

			= UNIQUE : 중복 없는 데이터
				=> NULL 값 허용
				*** 후보키 (기본키 대체) => 전화번호 / 이메일 ...

			= FRIMARY KEY : 기본키 => 모든 테이블은 1개 이상의 기본키를 가지고 있다
				=> NOT NULL + UNIQUE
				*** 숫자로 이용 => 게시물 번호 / 영화 번호 / 맛집 번호 ...
					=> 사람 : 아이디 (중복체크)

			= FOREIGN KEY : 참조키 (다른 테이블과 연결)
				예)
					맛집 = 댓글 (맛집 번호)
					영화 = 리뷰 (영화 번호)
					회원 = 예약 (예약ID)

			= CHECK : 지정된 데이터만 저장
				=> 라디오 버튼 / 체크 박스 / 콤보 박스 
				=> 남자 / 여자, 부서명, 장르 ...

			= DEFAULT : 미리 기본값 설정
				=> 등록일 : redate DATE DEFAULT SYSDATE
				=> HIT : hit NUMBER DEFAULT 0

		3. 어떤 데이터를 저장할지 => 데이터베이스 설계
			=> 벤치마킹 => 페이지 분석
			=> 게시판, 여행 ...

		4. 테이블 생성 => 자동 COMMIT
			1) 기존의 테이블을 복사 (전체 데이터까지)
				CREATE TABLE table명
				AS
				  SELECT * FROM emp

			2) 기존의 테이블 형태만 복사 (데이터 없이)
				CREATE TABLE table명
				AS
				  SELECT * FROM emp
				  WHERE 1=2; (WHERE문에서 false 조건을 넣는다)

			3) 사용자 정의 
*/
set linesize 250 
set pagesize 25
-- 테이블 복사
/*
CREATE TABLE myEmp2
AS
  SELECT * FROM emp;
*/
/*
CREATE TABLE myEmp3
AS
  SELECT * FROM emp
  WHERE 1=2;
*/

-- 테이블 삭제
/*
	형식)
		DROP TABLE table_name;
*/
/*
DROP TABLE myEmp;
DROP TABLE myEmp2;
DROP TABLE myEmp3;
*/

/*
CREATE TABLE myEmp
AS
	SELECT empno,ename,job,hiredate,sal,dname,loc
	FROM emp,dept
	WHERE emp.deptno=dept.deptno;
*/

-- 컬럼 추가
/*
	 ALTER TABLE myEmp ADD mgr NUMBER(4);
*/
-- ALTER TABLE myEmp ADD mgr NUMBER(4);

-- 컬럼 수정
/*
	ALTER TABLE myEmp MODIFY 컬럼명 변경할데이터형
*/
-- ALTER TABLE myEmp MODIFY ename VARCHAR2(52);

-- 컬럼 삭제
/*
	ALTER TABLE table_name DROP COLUMN column명
*/
-- ALTER TABLE myEmp DROP COLUMN mgr;
-- ALTER TABLE myEmp ADD mydate DATE;
--                                      -------- regdate => 컬럼명 변경
-- ALTER TABLE myEmp RENAME COLUMN mydate TO regdate;

-- 테이블명 변경
-- RENAME myEmp TO empDept;

-- 데이터 잘라내기 => 복구가 안 된다
-- TRUNCATE TABLE empdept;
/*
DROP TABLE empDept;
CREATE TABLE empDept
AS
	SELECT empno,ename,job,hiredate,sal,dname,loc
	FROM emp,dept
	WHERE emp.deptno=dept.deptno;
*/
-- ALTER TABLE empdept ADD mgr NUMBER(4) DEFAULT 7788 NOT NULL;

/*
	테이블 생성 명령어 => AUTOCOMMIT => 한 번 수행 시에 복구할 수 없다
		1. CREATE : 생성
		2. ALTER : 컬럼 수정 / 제약 조건 수정
			ADD : 컬럼 추가
			MODIFY : 컬럼 수정 => 크기 조절
			DROP : 컬럼 삭제
		3. RENAME : 테이블명 변경
		4. TRUNCATE : 데이터 잘라내기
*/