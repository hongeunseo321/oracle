-- SEQUENCE : ÀÚµ¿ Áõ°¡ ¹øÈ£
set linesize 250 
set pagesize 25
/*
	¿À¶óÅ¬ÀÇ °´Ã¼
		=> TABLE / SEQUENCE / VIEW / INDEX
		=> CREATE / DROP

		START WITH ==> ½ÃÀÛ ¹øÈ£
		INCREMENT BY ==> Áõ°¡ ¹øÈ£
		NOCACHE : CACHE ==> ¹Ì¸® »ý¼º (20°³ Á¤µµ)
		NOCYCLE : CYCLE ==> Ã³À½ºÎÅÍ ´Ù½Ã ½ÃÀÛ
		
		=> 1 2 3 4 (5 »èÁ¦) 6 ... => ÃÊ±âÈ­ : SEQUENCE »èÁ¦ => ´Ù½Ã »ý¼º

		=> currval(ÇöÀç °ª) / nextval(´ÙÀ½ °ª)
			INSERT INTO student VALUES(my_seq.nextval...)

		Å×ÀÌºí ¼³°è
			Å×ÀÌºí
			SEQUENCE => PRIMARY KEY : Áßº¹ ¾ø´Â µ¥ÀÌÅÍ
*/
/*
CREATE SEQUENCE my_seq
	START WITH 1
	INCREMENT BY 1
	NOCYCLE
	NOCACHE;
SELECT my_seq.nextval FROM DUAL;
DROP SEQUENCE my_seq;
*/
-- SELECT my_seq.nextval FROM DUAL;

/*
	3Àå
		DQL / DML / DDL
		DQL : µ¥ÀÌÅÍ ÁúÀÇ¾î => µ¥ÀÌÅÍ °Ë»ö (SELECT)
		1) SELECTÀÇ Çü½Ä, ¼ø¼­
			*** SELECT ¹®Àå => ÄÃ·³ / Å×ÀÌºí / Á¶°Ç °ª ´ë½Å »ç¿ë °¡´É
				=> ÄÃ·³ ´ë½Å : ½ºÄ®¶ó ¼­ºêÄõ¸®
				=> Å×ÀÌºí ´ë½Å : ÀÎ¶óÀÎ ºä
				=> Á¶°Ç°ª ´ë½Å : ÀÏ¹Ý ¼­ºêÄõ¸®

			SELECT * | column_list
			FROM table_name | SELECT ~ | view_name
			[
				WHERE Á¶°Ç¹® (¿¬»êÀÚ)
				GROUP BY ±×·ì ÄÃ·³ | ÇÔ¼ö => ±×·ìº° Åë°è => °ü¸®ÀÚ ÆäÀÌÁö
				HAVING ±×·ì Á¶°Ç
				ORDER BY ÄÃ·³ | ÇÔ¼ö (ASC »ý·« °¡´É | DESC)
			]

			¼ø¼­ 
				FROM => WHERE => GROUP BY => HAVING => SELECT => ORDER BY

			¿¬»êÀÚ
				»ê¼ú ¿¬»êÀÚ : SELECT µÚ¿¡
					=> +´Â µ¡¼À¸¸ °¡´É (¹®ÀÚ¿­ °áÇÕÀº ||À» »ç¿ë)
					=> /´Â Á¤¼ö/Á¤¼ö = ½Ç¼ö
					=> %´Â »ç¿ëÇÏÁö ¾Ê´Â´Ù => MOD() »ç¿ë

				ºñ±³ ¿¬»êÀÚ : =, <>(!=), <, >, <=, >=
			
				³í¸® ¿¬»êÀÚ : AND, OR
					=> ||´Â ¹®ÀÚ¿­ °áÇÕ
					=> &´Â ÀÔ·Â °ªÀ» ¹Þ´Â °æ¿ì

				BETWEEN ~ AND : ±â°£ => ¹üÀ§¸¦ Æ÷ÇÔ
					=> ÆäÀÌÂ¡ ±â¹ý

				IN : OR°¡ ¿©·¯ °³ÀÎ °æ¿ì
					=> WHERE deptno=10 OR deptno=20 OR deptno=30
					=> WHERE deptno IN (10, 20, 30)
					=> ´ÙÁß Á¶°Ç °ªÀÌ ÀÖ´Â °æ¿ì => ÇÊÅÍ

				NOT : ºÎÁ¤
					=> NOT IN(), NOT BETWEEN, NOT LIKE ...

				LIKE : °Ë»ö
					=> %Àº ¹®ÀÚ ±æÀÌ¸¦ ¸ð¸£´Â °æ¿ì
					=> _ Àº ¹®ÀÚ ÇÑ ±ÛÀÚ
					=> startsWith : A%
					=> endsWith : %A
					=> contains : %A% (ÁÖ·Î »ç¿ë)

					=> ÃÖ½Å : REGEXP_LIKE()
						startsWith : ^[A]
						endsWith : [A]$
						contains : [A]
						
						*** Á¤±Ô½Ä LIKEÀº º¹ÀâÇÑ °æ¿ì¿¡ ÁÖ·Î »ç¿ë
							A-Za-z | 0-9 | °¡-ÆR

		³»Àå ÇÔ¼ö
		Å×ÀÌºí Á¤¸®
		DML
			INSERT
				INSERT INTO table_name VALUES(°ª...)
				INSERT INTO table_name(ÄÃ·³,ÄÃ·³...) VALUES(°ª...)

			UPDATE
				UPDATE table_name
				SET ÄÃ·³¸í=°ª, ÄÃ·³¸í=°ª
				[WHERE Á¶°Ç¹®]

			DELETE
				DELETE FROM table_name
				[WHERE Á¶°Ç¹®]

*/
/*
-- A B C D E¸¦ LIKEÀ¸·Î °Ë»ö
SELECT ename
FROM emp
WHERE ename LIKE '%A%' OR
	ename LIKE '%B%' OR
	ename LIKE '%C%' OR
	ename LIKE '%D%' OR
	ename LIKE '%E%';

-- ÃÖ½Å : REGEXP_LIKE()À¸·Î °Ë»ö
SELECT ename
FROM emp
WHERE REGEXP_LIKE(ename,'A|B|C|D|E');

SELECT ename
FROM emp
WHERE REGEXP_LIKE(ename,'[A-E]');
*/
/*
INSERT INTO emp VALUES(8000, 'È«±æµ¿', '´ë¸®', 7788, SYSDATE, 2500, 0, 10);
COMMIT;
*/
/*
SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'[°¡-ÆR]');
*/
/*
INSERT INTO emp VALUES(8001, 'ABCÈ«±æµ¿', '´ë¸®', 7788, SYSDATE, 2500, 0, 10);
INSERT INTO emp VALUES(8002, 'È«±æµ¿ABC', '´ë¸®', 7788, SYSDATE, 2500, 0, 10);
COMMIT;
*/
/*
SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'^[°¡-ÆR]'); -- ÇÑ±Û·Î ½ÃÀÛ
SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'[°¡-ÆR]$'); -- ÇÑ±Û·Î ³¡³²
*/
/*
SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'[^°¡-ÆR]'); -- ÇÑ±Û¸¸ ÀÖ´Â ename Á¦¿Ü
*/
/*
DELETE FROM emp
WHERE empno>=8000;
COMMIT;
*/