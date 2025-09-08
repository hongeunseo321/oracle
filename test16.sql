set linesize 250 
set pagesize 25
-- 179page ������ ���� ���
/*
	1. table : ������ ���� ����
		= ��������
		= ����ȭ : ��¿� �ʿ��� �����͸� ���� => ���ϴ� �����͸�
		   ------ ���� ����

	2. view : ���� ���̺�
	3. sequence : �ڵ� ���� ��ȣ
	4. �ó�� : ���̺��� ��Ī
	5. ****INDEX : �ӵ��� ����ȭ = �˻�, ����... (���� 92% �ܰ� ����)
	6. PL / SQL
		=> FUNCTION / PROCEUDE / TRIGGER
		= FUNCTION : �������� �ִ� �Լ� (���� �Լ�) => SELECT
		= PROCEUDE : �޼ҵ�� ����, �������� ����
		= TRIGGER : ���� ���� = �ڵ�ȭ ó��
			��) �Խù� = ���
			     �԰� = ���
			     ��� = ���
	-------------------------------------------------------------------
	�����ͺ��̽� ���� (����ȭ = 1, 2, 3 ����ȭ)

	=> DML (INSERT, UPDATE, DELETE) : ������ ���۾� => ���� ����

	1. DDL : ������ ���Ǿ� => ���� �Ұ� (COMMIT / ROLLBACK �Ұ�)
		��ɾ� => CREATE, ALTER, DROP, TRUNCATE, RENAME
		����)
			CREATE TABLE
			CREATE VIEW
			CREATE SEQUENCE
			CREATE FUNCTION ...
		����)
			DROP TABLE
			DROP VIEW
			DROP SEQUENCE ...

		����)
			ALTER TABLE table�� ADD => �÷� �߰�
			ALTER TABLE table�� MODIFY => �÷� ����
			ALTER TABLE table�� DROP => �÷� ����

		�߶󳻱�)
			TRUNCATE TABLE table_name
	
		�̸� ����)
			RENAME old_name TO new_name


	table�� / �÷��� => XE ������ ���� 
		=> ***���� ���� �ʿ��ϴ� (�ߺ� X)
		=> ���� �� 30�� ����
		=> Ư������ ��� : _
		=> ���� ��� : �տ��� ��� ����
		=> ���ĺ� �ѱ� ��� (���ĺ� ����) : ���ĺ� ��ҹ��� ���� X, ���� �޸𸮿� �빮�ڷ� ����

		����)
			CREATE TABE table_name(
				�÷��� �������� [���� ����],
				�÷��� �������� [���� ����],
				�÷��� �������� [���� ����]
			);

		���̺� ���� ����
			1) �÷� ���� : � �����͸� �������� �м� = �䱸����

			2) �������� ����
				���� ����
					CHAR : 1~2000byte => ���� ���� ����
						=> ���� ũ���� �����Ͱ� �ִ� ���

					VARCHAR2 : 1~4000byte => ���� ���� ����
						=> �Ϲ������� ���Ǵ� ����

					CLOB : 4GB => ���� ��뷮 ����
						=> ���� / �ٰŸ� ...

				���� ����
					NUMBER : 8�ڸ�
						��) NUMBER(4) : ��ü 4�ڸ� ����
						     NUMBER(2,1) : ��ü 2�ڸ�, �Ҽ��� 1�ڸ� ����
				��¥ ���� 
					DATE / TIMESTAMP

			3) ���� ���� �ο� (CONSTRAINT)
				NOT NULL : �ݵ�� ���� �־�� ��

				UNIQUE : �ߺ� �Ұ� (NULL�� ���)
					��) ��ȭ��ȣ / �̸��� ...

				PRIMARY KEY : NOT NULL + UNIQUE (�⺻Ű = ���̺� �ĺ���)
					��) ���� / ���̵� ...��� ������ ã��
					=> �ڵ� INDEX

				FOREIGN KEY : �ٸ� ���̺��� PK ���� (�ܷ�Ű = ���� ���Ἲ)
					��) member = id, reserve = �����ȣ, id(���� ����)

				CHECK : Ư�� ���� �����ؾ� �� (������ ���ڸ� ��� ����)
					��) ���� / ���� ���� => ���� �� ����, ���� ����

				DEFAULT : ���� �Էµ��� �ʾ��� �� �⺻�� ����
				------------------------------------------------------------------
				* ���� ���� ���� �� ��� ����

				���� ���̺�
				----------- ���� ���ǿ� ���� ����
				*** ũ�Ѹ� / ���̺��� �� ���� ������ �Ѵ� (�ߺ� X)
				*** ��� ���� ������ user_constaints �ȿ� ����
				
					=> �÷� ���� : �÷� ������ ���ÿ� ���� ���� ����
						=> NOT NULL, DEFAULT
			
					=> ���̺� ���� : ���̺� ���� �Ŀ� ���� ���� ����
						=> UK, PK, FK, CK					 

					CREATE TABLE table_name (
						�÷��� �������� CONSTRAINT table��_�÷���_nn NOT NULL,
						�÷��� �������� DEFAULT ��,
						...,
						CONSTRAINT table��_�÷���_pk PRIMARY KEY (�÷�),
						CONSTRAINT table��_�÷���_uk UNIQUE (�÷�),
						CONSTRAINT table��_�÷���_ck CHECK (�÷� IN(...)),
						CONSTRAINT table��_�÷���_fk FOREIGN KEY (�÷�)
						REFERENCES ������ ���̺� (�÷�)
					);
				
*/

DROP TABLE A;
/*
CREATE TABLE A(
	name VARCHAR2(20) CONSTRAINT a_name_nn NOT NULL,
	sex VARCHAR2(20)
);
ALTER TABLE A DROP CONSTRAINT a_name_nn;

INSERT INTO A VALUES('ȫ�浿','����');
INSERT INTO A VALUES('','����');
INSERT INTO A VALUES('','����');
INSERT INTO A VALUES('','����');
INSERT INTO A VALUES('�ڹ���','����');

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
