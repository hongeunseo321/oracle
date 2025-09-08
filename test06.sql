-- ���� => ORDER BY => �ӵ��� ������ (��ü => INDEX)
-- INDEX�� �ӵ��� ���� ��� => �߰�, ����, ������ ���� ��� : �Խ���
/*
	ORDER BY�� SQL������ �������� ÷��
	ORDER BY �÷���(�Լ�) ASC|DESC
*/
/*
-- emp�� �ִ� ��� ��� => �޿��� ���� ������� (����, ����, ��¥)
SELECT *
FROM emp
ORDER BY sal DESC;

-- emp�� �ִ� ��� ��� => �޿��� ���� ������� (����, ����, ��¥)
SELECT *
FROM emp
ORDER BY sal;

SELECT empno,ename,hiredate,sal
FROM emp
ORDER BY 4,1 DESC;

-- �̸� ���� => ��������
SELECT *
FROM emp
ORDER BY ename;

-- �Ի� ���� => ��������
SELECT *
FROM emp
ORDER BY hiredate;
*/
-- ���� �Լ� : ����Ŭ�� �����ϴ� ���̺귯�� => SELECT, WHERE
/*
	������ �Լ�
		���� ���� �Լ�
			1) ***UPPER : �빮�� ��ȯ
			2) LOWER : �ҹ��� ��ȯ
			3) INITCAP : �̴ϼ� => ù �ڸ� �빮��
			4) ***SUBSTR : ���� �ڸ���
			5) ***INSTR : ���� ã��
			6) LPAD / RPAD : ���ڰ� ���ڶ� ��쿡 ���� ��ü
				LPAD('abcde',10,'*') => *****abcde
				***RPAD('abcde',10,'*') => abcde*****
	
			7) LTRIM / RTIM / TRIM : ���� ����
			8) ***LENGTH
			9) ***REPLACE : ���� => &����
			10) ASCII : char�� ���� ����
			11) CHR : ���� => char
			12) LENGTHB : byte ����

		���� ���� �Լ�
		��¥ ���� �Լ�
		��ȯ ���� �Լ�
		��Ÿ
	���� �Լ� : ���
*/
/*
-- UPPER('abc') = ABC / LOWER('ABC') = abc  / INITCAP('ABC') Abc
SELECT ename,UPPER(ename),LOWER(ename),INITCAP(ename)
FROM emp;

SELECT * 
FROM emp
WHERE ename=UPPER('king');

-- LENGTH('ABC') 3 LENGTH('ȫ�浿') = 3
-- LENGTHB('ABC') = 3 LENGTHB('ȫ�浿') = 9
SELECT LENGTH('ABC'), LENGTH('ȫ�浿') FROM DUAL;
SELECT LENGTHB('ABC'), LENGTHB('ȫ�浿') FROM DUAL;
*/
/*
	SUBSTR => ���ڿ� �ڸ���
	����Ŭ ���ڿ�
	 Hello  Ora c  l  e
	 123456789101212
	
	SUBSTR(���ڿ�, ���� ��ġ, ����)

	��� �Ի��� => �� ���� �Ի��ߴ���
		YY/MM/DD
		1234 5 678
*/
-- ��� �Ի�� ���
SELECT ename,SUBSTR(hiredate,4,2)
FROM emp;

-- ��� �Ի��� ���
SELECT ename,SUBSTR(hiredate,7,2)
FROM emp;

/*
	INSTR => indexOf / lastIndexOf => ���� ��ġ ã��
	INSTR(���ڿ�, ã�� ����, ���� ��ġ, �� ��°)
	Hello
*/
SELECT INSTR('Hello','l',1,2) FROM DUAL;

/*
	LPAD / RPAD
	L=Left, R=Rigth
	
	LPAD(���ڿ�, ���� ����, ��ü ����)
	LPAD('Hello',8,'#') => ###Hello
	LPAD('Hello',3,'*') => Hel

	RPAD(���ڿ�, ���� ����, ��ü ����)
	RPAD('Hello',8,'#') => Hello###
	RPAD('Hello',3,'*') => Hel	
*/
SELECT RPAD(SUBSTR(ename,1,2),LENGTH(ename),'*')
FROM emp;

-- ASCII('A') => 65, CHR(65) => 'A'
SELECT ASCII('K'), CHR(68) FROM DUAL;

/*
	TRIM : �¿� ���� ����
	LTRIM : ���� ���� ����
	RTRIM : ������ ���� ���� 
	
	LTRIM('ABCDA','A') => BCDA
	RTRIM('ABCDA','A') => ABCD
	LTRIM('ABCD') => ���� ����
	TRIM('A' FROM 'ABCDA') => BCD
	---------------------------------- �ڹ� trim

	���� �ڵ�)
		����ڷκ��� �����͸� �޾Ƽ� => �ڹ� (��������)
		�����ͺ��̽� ���� ���� => ����Ŭ

	REPLACE(���ڿ�,'old','new')
	REPLACE('Oracle AND java','a','b') => Orbcle AND jbvb
*/
SELECT LTRIM('ABCDA','A'),RTRIM('ABCDA','A'),TRIM('A' FROM 'ABCDA')
FROM DUAL;

SELECT REPLACE('Oracle AND java','java','oracle')
FROM DUAL;

