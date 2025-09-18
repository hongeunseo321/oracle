-- 6장 / 7장 => 데이터베이스 설계
/*
	6장 => 요구사항 분석 / ER-Model
	7장 => 정규화
	8장 => 트랜잭션	=> SQL 튜닝 (SQL 문장의 최적화) => INDEX 주로 사용
	
	데이터베이스 모델링 (313page)
		=> 프로젝트에 필요한 데이터를 구조화하여 DB에 저장 => 설계
		=> 목적
			1) 데이터 무결성 : PRIMARY KEY 
			2) 데이터 일관성
			3) 효율적인 조회

		=> 현재 상용중인 사이트를 모방 : 벤치마킹 ==> 추출 데이터를 저장
		=> 어떤 기능 (ERD) / 비기능 => 테이블 생성 (스키마)

		=> 개념적 모델 : 속성(컬럼)의 관계 설정
		=> 논리적 모델 : 정규화 => 구체화
		=> 물리적 모델 : 인덱스, 키 설정 => 파티션 / 인덱스 => 성능 최대화

		=> 요구사항 분석 / 데이터베이스 설계 : DBA

	데이터베이스 생명주기 
		1. 요구사항 분석
		↓
		2. 벤치마킹
		↓	=> 데이터 수집 / 분석
		3. 설계
		↓
		4. 구현
		↓	=> 웹 개발자
		5. 사이트 호스팅
		↓	=> 관리 => AWS => CI/CD (운영자 : SE)
		6. 유지보수 (개선 / 감시)
*/
/*
	1단계
	↓요구사항 분석↓
	----------------------------------------------------------------------------------------
		= 목적 
			어떤 데이터를 다룰지, 사이트의 기능 확장 (모방을 하되, 없는 기능 확인)

		= 방법 
			벤치마킹 / 기존의 문서를 참조

		= 결과물 (산출물)
			기능 / 비기능 / 테이블 추출

		= 예)
			쇼핑몰 => 쇼핑 업체, 사용자, 결제 / 장바구니
		
		= ①개념적 설계
			컬럼 추출 (데이터 추출) => 관계도 (1:1 / 1:N / N:M)
			사용자 ==1:N== 장바구니 ==N:M== 쇼핑 업체

			사용자
				=> member(id, pwd, name, sex, address, phone)
				=> ERD 설계
					member : 사각형
						ㄴ id : 타원형
						ㄴ pwd : 타원형
						ㄴ ...

				=> ERD 단순화
					사용자 →1:N→ 장바구니 ←N:M← 쇼핑 업체
		
		= ②논리적 설계
			테이블 설계 / 정규화 수행
			회원 => id(PK), pwd, name...
			상품 정보 => 상품 번호(PK), 상품명, 이미지...
			장바구니 => 번호(PK), id(FK), 상품 번호(FK), 수량, 금액...
			
			=> 관계도 설정 (1:N / 1:N / N:M)
			=> 기본키 / 외래키 설정
			=> 정규화
				① 원자값 우선 => 취미 : 등산, 낚시... => 취미만 다른 테이블 설정
				② 중복 제거
				③ 한 개의 컬럼으로 ROW를 제어

		= ③물리적 설계
			=> 데이터형 설정 (VARCHAR2, NUMBER, DATE...)
			=> 인덱스 설계
			=> 제약조건 (PK, CK, UK, FK... NN)
			=> SQL 스크립트 제작 : .sql, .csv
			=> DDL를 이용
	----------------------------------------------------------------------------------------
	예) 멜론, 지니뮤직
	요구사항 분석
		① 목적 	
		② 비교
		③ 요구사항 도출
			= 기능
				사용자 관리
					= 회원가입, 소셜 로그인 (카카오, 네이버, 구글...)
					= 마이페이지 (프로필 수정, 탈퇴, 결제 / 구독 )
				뮤직 컨텐츠
					= 스트리밍 (유튜브 키), 다운로드, 가사 출력
					= **앨범, 곡, 가수
					= **재생
				검색
					= 통합 검색 : 필터링 => MyBatis 동적 쿼리
					= 카테고리별 검색 / 추천 (사용자 정보 맞춤)
						=> 소개
				개인화 추천 => 좋아요, 찜, 히트
				부가적 컨텐츠 => 공연 정보, 매거진
				멀티 플랫폼 => 모바일 / 웹 연동
				결제 / 구독 => OPEN API

			= 비기능
				성능 : SQL 최적화 (튜닝) => 이미지 (보류)
					SELECT *
					FROM emp
					WHERE sal>=2000;
					문제점
					1. 전체 스캔 => 속도가 느리다
					2. 컬럼이 많으면 속도가 느리다 => 출력에 필요한 내용만 설정
					↓최적화↓
					SELECT empno,ename,job
					FROM emp
					WHERE sal>=2000;
					3. 인덱스 설정
					CREATE INDEX sal_idx ON emp(sal)

				SELECT ename,hiredate
				FROM emp
				WHERE hiredate>='81/01/01'; X
				WHERE TO_DATE(hiredate,'YY/MM/DD'); O

				데이터베이스 설계 VS 객체지향 설계 (SOLID)

			보안 : JSP => 비밀번호 암호화 / 복호화
				Spring Security : 권한 / 암호화 ...
					=> ***JWT (람다식) / Session
		
			확장성 : 지니뮤직 => 멜론
				예)
					영화 예매 기능 => 항공사 예약 기능

			호환성 : 크롬 = FF = IE = 모바일 (반응형 웹)

			요구사항 명세서
				ID
				FR-01 로그인 / 기능 / 소셜로그인 / 상
				FR-02 통합검색 / 기능 / 가수, 곡명, 앨범... / 상
				NFR-01 응답 속도 / 비기능 / 2초 내에 처리(페이지 응답 속도) / 하

			구분 : 마이페이지 / 관리페이지
				***일반 사용자
				관리자 => 예약 관리, 묻고 답하기, 회원 관리, 통계 관리

			유스케이스 다이어그램
			와이어프레임 (화면 UI)
			=> ERD 
			
			기능 파악 => 메뉴 / 버튼
			데이터 파악 => 화면 (상세보기)

			기본
				시나리오
					= 로그인 / 회원가입으로 접속
					= 목록 확인
					= 검색 가능
					= 목록 클릭하면 상세보기 => 동영상 출력

				데이터 추출 (개념적 설계)
					지니 뮤직
						순위
						상태
						이미지
						곡명
						가수명
						앨범
						등폭
						동영상 KEY
				논리적 설계
					지니뮤직 (순위(PK), 상태(CK), 이미지, 곡명, 가수명, 앨범, 등폭, KEY)
						KEY만 유튜브에서 추출

				물리적 설계
					크기 결정 => 테이블 생성
					
					ER-Model
					사용자
						ID
						PWD
						NAME
					뮤직
						순위
						곡명
					
					관계도
						사용자 ---1:N--- 뮤직
						사용자 ---1:N--- 게시판
					
					=> 데이터형 설정
						순위 ==> NUMBER
						상태 => 하강, 유지, 하강 ==> CHAR(6)
						이미지 ==> 260
						곡명 ==> 200
						가수명 ==> 100
						앨범 ==> 200
						등폭 ==> NUMBER
						동영상 KEY ==> 100
	
					=> 장르별 분류
						=> cno
						=> no
						=> hit / jjim / like
	----------------------------------------------------------------------------------------			
	요구사항 분석
		https://themaintarot.com/free-tarot-test/
		① 목적 
			랜덤 타로카드
			
		② 비교
			챗봇 대신에 랜덤 카드 도출에 따른 해석 결과

		③ 요구사항 도출
			= 기능
				사용자 관리
					소셜로그인
					이전의 대화 기록
					
				컨텐츠
				검색
				개인화 추천
				부가적 컨텐츠
				멀티 플랫폼
				결제 / 구독

			= 비기능

			= 데이터 추출 (개념적 설계)
				nicname
				id
				pwd
				title
				card
				container
				
				
*/
/*
CREATE TABLE genie_music(
	no NUMBER, --pk
	cno NUMBER,
	rank NUMBER CONSTRAINT gm_rank_nn NOT NULL,
	title VARCHAR2(200) CONSTRAINT gm_title_nn NOT NULL,
	singer VARCHAR2(100) CONSTRAINT gm_singer_nn NOT NULL,
	album VARCHAR2(200) CONSTRAINT gm_album_nn NOT NULL,
	poster VARCHAR2(260) CONSTRAINT gm_poster_nn NOT NULL,
	state CHAR(6),
	idcrement NUMBER,
	key VARCHAR2(100),
	hit NUMBER DEFAULT 0,
	likecount NUMBER DEFAULT 0,
	CONSTRAINT gm_no_pk PRIMARY KEY(no),
	CONSTRAINT gm_state_ck CHECK(state IN('유지','상승','하강'))
);
CREATE TABLE melon_music(
	no NUMBER, --pk
	rank NUMBER CONSTRAINT mm_rank_nn NOT NULL,
	title VARCHAR2(200) CONSTRAINT mm_title_nn NOT NULL,
	singer VARCHAR2(100) CONSTRAINT mm_singer_nn NOT NULL,
	album VARCHAR2(200) CONSTRAINT mm_album_nn NOT NULL,
	poster VARCHAR2(260) CONSTRAINT mm_poster_nn NOT NULL,
	state CHAR(6),
	idcrement NUMBER,
	key VARCHAR2(100),
	hit NUMBER DEFAULT 0,
	likecount NUMBER DEFAULT 0,
	CONSTRAINT mm_no_pk PRIMARY KEY(no),
	CONSTRAINT mm_state_ck CHECK(state IN('유지','상승','하락'))
);
CREATE SEQUENCE gm_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCYCLE
	NOCACHE;
CREATE SEQUENCE mm_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCYCLE
	NOCACHE;
*/
