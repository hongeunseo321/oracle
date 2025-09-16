-- 3��~4�� => ���� / ����
/*
	PL/SQL/���Խ� (REGEXP_LIKE, REGEXP_COUNT, REGEXP_REPLACE, REGEXP_STRSUB, REGEXP_INSTR)
	=> �׷� �Լ� : GROUPING / CUBE / ROLLUP
	=> �����ͺ��̽� ���� (����ȭ) / Ʈ����� ����
	
	3��
		SELECT => ������ �˻� => ������Ʈ (80%)
		���� ����)
			SELECT (DISTINCT|*) * | column_list(������(���),�Լ�)
			FROM table_name | view_name | SELECT ~
		[
			WHERE ���ǹ�(�񱳿�����, ��������, BETWEEN~AND
						IN, LIKE, NOT, NULL(IS NULL, IS NOT NULL)
			GROUP BY �׷��÷�|�Լ�(�÷�������) => �׷캰 ����
			HAVING �׷� ���� => GROUP BY�� �ִ� ��쿡�� ��� ����
			ORDER BY ������ �÷� | �Լ� (ASC|DESC)
			=> �����Ͱ� ���� ��� ���� �ÿ� INDEX
				INDEX_ASC(), INDEX_DESC()
		]

		1) ������
			��� ������ : +,-, *, / => MOD() : %
				=> ROW ���� ��� => �����ϴ� �Լ��� ����

			�� ������ : =, <>, <, >, <=, >=

			�� ������ : AND (����, �Ⱓ ����), OR (����, �Ⱓ ������)
				=> OR�� ���� �˻��� ��쿡 ���� ���δ�

			BETWEEN ~ AND : AND ��� ��� => ���� ����
				=> ����¡ ���, üũ��, ���� �Ⱓ...

			IN : OR ���� ���� ��� => MyBatis => forEach
				=> ���� ����

			NOT : ���� => NOT IN, NOT LIKE, NOT BETWEEN
				=> !�� ������� �ʴ´�

			NULL : ���� ���� ����
				=> NullPointerException : ���� �߻�
				=> null�� ���� ó�� => �ᱣ�� (null)
				=> IS NULL, IS NOT NULL
				WHERE ename=null => NULL
				WHERE ename IS NULL => (o)
				=> image�� ���� ���

			LIKE 
				% => ���� ���� X
				_ => ���� �� ����
				startsWith : ����% ===> ***Index ����
				endsWith : %����
				contains : %����%

		2) ���� �Լ�
			= ������ �Լ� : ROW ���� ó�� (�� �پ� ó��)
				���� �Լ�
					SUBSTR : ���� �ڸ���
						SUBSTR(�÷���, ���� ��ġ, �ڸ� ����)
						=> ����Ŭ�� 1������

					INSTR : ������ ��ġ
						INSTR(�÷���, ã�� ����, ���� ��ġ, �� ��°)
	
					LENGTH : ������ ����
						LENGTH(�÷���)
						=> ��й�ȣ...		
		
					RPAD : ���� ������ ���ڶ� ��� (������ ���� ���)
						RPAD(�÷���, ���� ����(LENGTH), '*')
						=> ad***
						=> ���̵� ã�� / ��� ...
					
					***REPLACE : ���� ���� => &, |, "
						REPLACE(�÷���, ���� ��� ����, ������ ����)
						=> ������ ä�� (ä�ù��� ����)
						=> URL �ּҿ��� &�� ��û�� ������ �� ���� ���δ�
							�� ���α׷����� URL�� http://localhost:8080/food_detail.jsp?fno=1&page=3
							fno=1&page=3 => GET / POST / PUT / DELETE / RESTFul
							GET : SELECT
							POST : INSERT
							PUT : UPDATE
							DELETE : DELETE

									
					=> ������ �Լ� : TRIM(), INITCAP, UPPER, LOWER => �ڹ��� String���� ó��

				���� �Լ�
				��¥ �Լ�
				��Ÿ �Լ�
			= ���� �Լ� : COLUMN ���� ó��
			*** GROUP BY�� ���� ��� => ������, ���� �Լ��� ���� ����� �� ����

		
		3) ���� / �������� => ������Ʈ (�ݵ�� SQLDeveloper)
			�ڹ� => "" (LIKE ���常 ����) '%A%'
			����Ŭ => '%'||?||'%'
			MYSQL => CONCAT('%',?,'%') => MARIADB


	4��
		=> CREATE / DROP / TRUNCATE / RENAME / ALTER
		=> DML(INSERT, UPDATE, DELETE)

*/