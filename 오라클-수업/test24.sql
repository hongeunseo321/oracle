-- 222page (rownum), ��������, �ó��, ������, �ε���
set linesize 250 
set pagesize 25
/*
	��ü ����, Ʃ��
	=> PL / SQL : FUNCTION, PTOCEDURE, TRIGGER
	=> �����ͺ��̽� ���� / ����ȭ

	1. ROWNUM
		= ���� �÷��� �ƴϴ�, ���� �÷� => �� ROW ��ȣ (����Ŭ ó��)
		= �ᱣ���� ���� ������ ����
		= ORDER BY, INDEX�� �̿��ؼ� ����
		= �� ���ó)
			�α� ���� 10��, ����¡ ���, ���� / ���� (�� ����)
		= ��� �ÿ��� SELECT, WHERE���� �ַ� ���
*/
/*
SELECT empno,ename,job,hiredate,sal,rownum
FROM emp;

-- rownum�� ���� ���� => �ζ��κ並 �ַ� ���
SELECT empno,ename,job,hiredate,sal,rownum
FROM (
	SELECT * 
	FROM emp ORDER GY sal DESC
);
*/
/*
-- ���� ���� ���Ǵ� ����
-- �α� ���� 5��
SELECT name,rownum
FROM (
	SELECT name,hit 
	FROM food ORDER BY hit DESC
)
WHERE rownum<=5;
*/
/*
	rownum�� ����
	1. TOP-N : 1���� ~ ���ϴ� ���� ���
		=> 1���ʹ� �����ѵ�, �߰����� �ڸ� ���� ����

	2. rownum�� �����ؼ� ���������� ����ؾ߸� �Ѵ�
		=> ORDER BY 
*/

-- ���� => sal ���� 6~10�� => ����¡ ���
-- ��ø �������� ���
/*
-- 1. ���
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
-- 2. ���
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
-- 3. ��� => ROW_NUMBER => 1���� �������� ��� => 12c
-- ROW_NUMBER() OVER(ORDER BY empno)
SELECT empno,ename,job
FROM (
	SELECT empno,ename,job,ROW_NUMBER() OVER(ORDER BY empno) AS rn
	FROM emp
)
WHERE rn BETWEEN 6 AND 10;
*/

/*
	1. INSERT => rownum / rowid (�ε���)

	��ü ��ȣ ���� : SELECT rownum �÷���...   
		=> ���� / ������ �� ���� �̵�
	���� N (TOP-N) : WHERE rownum<=N   
		=> �α���� / �޻��
	N���� M���� : rownum �������� + BETWEEN N AND M   
	���� �Ŀ� ��ȣ ���� (����) : ���� ���� �̿�
	�ֽ� ��� : ROW_NUMBER() ����
*/
/*
	������ : SEQUENCE
		= ���������� ����, ���̺�� ������ ���� X 
		= ���� �д� ���
			=> ���簪 : currval (Current Value)
			=> ������ : nextval (Next Value)

		= PRIMARY KEY => �ߺ� X => �ߺ� ���� �ڵ� ���� ��ȣ ���� => ������
		= �ʱⰪ : START WITH
		= ������ : INCREMENT BY

		= CACHE : �޸𸮿� �̸� ���� ������ �Ŀ� ���
			=> ���� ��� => ��ȣ ���� X (�ǳʶ� ���� �ִ�) => NOCACHE ���

		= ��뷮 �����͸� INSERT�� ���, ���� ����
			=> SELECT NVL(MAX(no)+1,1) FROM food => �������� ���
			=> MyBatis���� ������ȣ�� ���� �� �� ����ó�� ����� 
				<selectKey statement=" �� ���� "> 
				@SelectKey (������̼�)
	
		= �Ӽ���
			START WITH => �ʱⰪ (i=1)
			INCREMENT BY => ������ (i++, i+=2)
			-------------------
			MINVALUE (1)
			MAXVALUE (100)
			------------------- ������ ���Ѵ�
			CACHE (20)
			NOCACHE
			CYCLE => 100���� ���� => �ٽ� 1����
			NOCYCLE (100)
			
			** ������ ���� �ÿ� ������ ���� (�ϰ��� X)
			** ������ ��ȣ�� �ߺ����� �ʴ´�
*/
/*
-- ���̺� ���� �� ���� ���̺� ����
	user_tables => table_name PRIMARY KEY

CREATE TABLE myFood(
	fno NUMBER,
	name VARCHAR2(30) CONSTRAINT mf_name_nn NOT NULL,
	cate VARCHAR2(20) CONSTRAINT mf_cate_nn NOT NULL,
	price NUMBER,
	CONSTRAINT mf_fno_pk PRIMARY KEY(fno),
	CONSTRAINT mf_fno_ck CHECK(price>=800 AND price<=5000)
); 


-- �ߺ� ���� : user_sequences
	constraint : ���� ���� => user_constraints : table��_�÷���_nn

CREATE SEQUENCE myfood_fno_seq
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 100
	NOCACHE
	NOCYCLE;
*/

-- ������ �̿� ��� => �ʱ�ȭ => DROP SEQUENCE myfood_fno_seq
-- ũ�Ѹ� ���� => TRUNCATE (������ ����) => DROP

/*
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'���','�ѽ�',2500);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'���','�ѽ�',4000);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'����','���',5000);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'ġŲ','���',5000);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'¥���','�߽�',3000);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'�������','�ѽ�',800);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'�ʹ�','�Ͻ�',1990);
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'�����','�ѽ�',1500);
COMMIT;
*/
-- SELECT myFood_fno_seq.nextval FROM DUAL;
/*
INSERT INTO myFood VALUES(myfood_fno_seq.nextval,'�쵿','�Ͻ�',1800);
COMMIT;
*/