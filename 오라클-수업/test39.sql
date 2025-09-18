-- 6�� / 7�� => �����ͺ��̽� ����
/*
	6�� => �䱸���� �м� / ER-Model
	7�� => ����ȭ
	8�� => Ʈ�����	=> SQL Ʃ�� (SQL ������ ����ȭ) => INDEX �ַ� ���
	
	�����ͺ��̽� �𵨸� (313page)
		=> ������Ʈ�� �ʿ��� �����͸� ����ȭ�Ͽ� DB�� ���� => ����
		=> ����
			1) ������ ���Ἲ : PRIMARY KEY 
			2) ������ �ϰ���
			3) ȿ������ ��ȸ

		=> ���� ������� ����Ʈ�� ��� : ��ġ��ŷ ==> ���� �����͸� ����
		=> � ��� (ERD) / ���� => ���̺� ���� (��Ű��)

		=> ������ �� : �Ӽ�(�÷�)�� ���� ����
		=> ���� �� : ����ȭ => ��üȭ
		=> ������ �� : �ε���, Ű ���� => ��Ƽ�� / �ε��� => ���� �ִ�ȭ

		=> �䱸���� �м� / �����ͺ��̽� ���� : DBA

	�����ͺ��̽� �����ֱ� 
		1. �䱸���� �м�
		��
		2. ��ġ��ŷ
		��	=> ������ ���� / �м�
		3. ����
		��
		4. ����
		��	=> �� ������
		5. ����Ʈ ȣ����
		��	=> ���� => AWS => CI/CD (��� : SE)
		6. �������� (���� / ����)
*/
/*
	1�ܰ�
	��䱸���� �м���
	----------------------------------------------------------------------------------------
		= ���� 
			� �����͸� �ٷ���, ����Ʈ�� ��� Ȯ�� (����� �ϵ�, ���� ��� Ȯ��)

		= ��� 
			��ġ��ŷ / ������ ������ ����

		= ����� (���⹰)
			��� / ���� / ���̺� ����

		= ��)
			���θ� => ���� ��ü, �����, ���� / ��ٱ���
		
		= �簳���� ����
			�÷� ���� (������ ����) => ���赵 (1:1 / 1:N / N:M)
			����� ==1:N== ��ٱ��� ==N:M== ���� ��ü

			�����
				=> member(id, pwd, name, sex, address, phone)
				=> ERD ����
					member : �簢��
						�� id : Ÿ����
						�� pwd : Ÿ����
						�� ...

				=> ERD �ܼ�ȭ
					����� ��1:N�� ��ٱ��� ��N:M�� ���� ��ü
		
		= ����� ����
			���̺� ���� / ����ȭ ����
			ȸ�� => id(PK), pwd, name...
			��ǰ ���� => ��ǰ ��ȣ(PK), ��ǰ��, �̹���...
			��ٱ��� => ��ȣ(PK), id(FK), ��ǰ ��ȣ(FK), ����, �ݾ�...
			
			=> ���赵 ���� (1:N / 1:N / N:M)
			=> �⺻Ű / �ܷ�Ű ����
			=> ����ȭ
				�� ���ڰ� �켱 => ��� : ���, ����... => ��̸� �ٸ� ���̺� ����
				�� �ߺ� ����
				�� �� ���� �÷����� ROW�� ����

		= �鹰���� ����
			=> �������� ���� (VARCHAR2, NUMBER, DATE...)
			=> �ε��� ����
			=> �������� (PK, CK, UK, FK... NN)
			=> SQL ��ũ��Ʈ ���� : .sql, .csv
			=> DDL�� �̿�
	----------------------------------------------------------------------------------------
	��) ���, ���Ϲ���
	�䱸���� �м�
		�� ���� 	
		�� ��
		�� �䱸���� ����
			= ���
				����� ����
					= ȸ������, �Ҽ� �α��� (īī��, ���̹�, ����...)
					= ���������� (������ ����, Ż��, ���� / ���� )
				���� ������
					= ��Ʈ���� (��Ʃ�� Ű), �ٿ�ε�, ���� ���
					= **�ٹ�, ��, ����
					= **���
				�˻�
					= ���� �˻� : ���͸� => MyBatis ���� ����
					= ī�װ��� �˻� / ��õ (����� ���� ����)
						=> �Ұ�
				����ȭ ��õ => ���ƿ�, ��, ��Ʈ
				�ΰ��� ������ => ���� ����, �Ű���
				��Ƽ �÷��� => ����� / �� ����
				���� / ���� => OPEN API

			= ����
				���� : SQL ����ȭ (Ʃ��) => �̹��� (����)
					SELECT *
					FROM emp
					WHERE sal>=2000;
					������
					1. ��ü ��ĵ => �ӵ��� ������
					2. �÷��� ������ �ӵ��� ������ => ��¿� �ʿ��� ���븸 ����
					������ȭ��
					SELECT empno,ename,job
					FROM emp
					WHERE sal>=2000;
					3. �ε��� ����
					CREATE INDEX sal_idx ON emp(sal)

				SELECT ename,hiredate
				FROM emp
				WHERE hiredate>='81/01/01'; X
				WHERE TO_DATE(hiredate,'YY/MM/DD'); O

				�����ͺ��̽� ���� VS ��ü���� ���� (SOLID)

			���� : JSP => ��й�ȣ ��ȣȭ / ��ȣȭ
				Spring Security : ���� / ��ȣȭ ...
					=> ***JWT (���ٽ�) / Session
		
			Ȯ�强 : ���Ϲ��� => ���
				��)
					��ȭ ���� ��� => �װ��� ���� ���

			ȣȯ�� : ũ�� = FF = IE = ����� (������ ��)

			�䱸���� ����
				ID
				FR-01 �α��� / ��� / �Ҽȷα��� / ��
				FR-02 ���հ˻� / ��� / ����, ���, �ٹ�... / ��
				NFR-01 ���� �ӵ� / ���� / 2�� ���� ó��(������ ���� �ӵ�) / ��

			���� : ���������� / ����������
				***�Ϲ� �����
				������ => ���� ����, ���� ���ϱ�, ȸ�� ����, ��� ����

			�������̽� ���̾�׷�
			���̾������� (ȭ�� UI)
			=> ERD 
			
			��� �ľ� => �޴� / ��ư
			������ �ľ� => ȭ�� (�󼼺���)

			�⺻
				�ó�����
					= �α��� / ȸ���������� ����
					= ��� Ȯ��
					= �˻� ����
					= ��� Ŭ���ϸ� �󼼺��� => ������ ���

				������ ���� (������ ����)
					���� ����
						����
						����
						�̹���
						���
						������
						�ٹ�
						����
						������ KEY
				���� ����
					���Ϲ��� (����(PK), ����(CK), �̹���, ���, ������, �ٹ�, ����, KEY)
						KEY�� ��Ʃ�꿡�� ����

				������ ����
					ũ�� ���� => ���̺� ����
					
					ER-Model
					�����
						ID
						PWD
						NAME
					����
						����
						���
					
					���赵
						����� ---1:N--- ����
						����� ---1:N--- �Խ���
					
					=> �������� ����
						���� ==> NUMBER
						���� => �ϰ�, ����, �ϰ� ==> CHAR(6)
						�̹��� ==> 260
						��� ==> 200
						������ ==> 100
						�ٹ� ==> 200
						���� ==> NUMBER
						������ KEY ==> 100
	
					=> �帣�� �з�
						=> cno
						=> no
						=> hit / jjim / like
	----------------------------------------------------------------------------------------			
	�䱸���� �м�
		https://themaintarot.com/free-tarot-test/
		�� ���� 
			���� Ÿ��ī��
			
		�� ��
			ê�� ��ſ� ���� ī�� ���⿡ ���� �ؼ� ���

		�� �䱸���� ����
			= ���
				����� ����
					�Ҽȷα���
					������ ��ȭ ���
					
				������
				�˻�
				����ȭ ��õ
				�ΰ��� ������
				��Ƽ �÷���
				���� / ����

			= ����

			= ������ ���� (������ ����)
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
	CONSTRAINT gm_state_ck CHECK(state IN('����','���','�ϰ�'))
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
	CONSTRAINT mm_state_ck CHECK(state IN('����','���','�϶�'))
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
