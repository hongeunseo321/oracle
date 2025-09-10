-- 시노님 => 테이블명에 대한 동의어 => 개인만 / 모든 사용자
set linesize 250 
set pagesize 25
/*
	CREATE 시노님
	CREATE PUBLIC 시노님

	=> 단점은 권한(hr)이 없다
		권한 부여 : grant create synonym to hr;
		권한 해제 : revoke create synonym from hr;

	=> 테이블 / 뷰 / 시퀀스 / 함수 ... 별칭 => SYNONYM

	목적)
		테이블 / 뷰 / 시퀀스 / 함수의 명칭이 긴 경우,
			=> 숨기거나 짧게 만들어서 사용

	특징)
		별칭 생성, 로컬 (사용자 전용) / 글로벌 (모든 사용자)
		권한 부여가 필요 : SYSTEM / SYSDBA
			DCL(데이터 제어어) => GRANT / REVOKE
				=>  GRANT CREATE SYNONYM TO hr
					GRANT CREATE VIEW TO hr
				=> REVOKE CREATE SYNONYM FROM hr
			*** table / sequence 외에 다른 권한은 가지고 있지 않다
*/
/*
CREATE VIEW emp_view AS
	SELECT *
	FROM emp;
-- 권한 불충분 오류 발생
*/

-- Local : 현재 사용자
-- CREATE SYNONYM emp_as FOR emp;

-- 모든 사용자
-- CREATE PUBLIC SYNONYM emp_pub FOR emp;

/*
DROP SYNONYM emp_as;
-- 권한 부여
DROP PUBLIC SYNONYM emp_pub; 
*/
/*
	1. 다른 사용자의 테이블을 편리하게 접근이 가능
		=> hr_1 / hr_2 / hr_3

	2. 테이블 이름 변경 => SYNONYM만 변경하면 코드 수정 최소화
		=> 가독성이 좋다

	3. 보안 목적
		=> PUBLIC 권한 주의
*/