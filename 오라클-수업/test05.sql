-- ¿¬»êÀÚ (³í¸®¿¬»êÀÚ) µÎ °³ÀÇ Á¶°ÇÀ» ºñ±³ÇÒ °æ¿ì¿¡ AND, OR
-- AND => Æ÷ÇÔ, µÎ °³ÀÇ Á¶°ÇÀÌ µ¿½Ã¿¡ true
-- Á÷À§(job)°¡ SALEMANÀÌ°í ±Þ¿©(sal)°¡ 1500 ÀÌ»óÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE job='SALEMAN' AND sal>=1500;

-- 81³â¿¡ ÀÔ»çÇÑ ¸ðµç »ç¿øÀÇ Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE hiredate>='81/01/01' AND hiredate<='81/12/31';

SELECT *
FROM emp
WHERE hiredate LIKE '81'';

SELECT *
FROM emp
WHERE SUBSTR(hiredate,1,2)=81;

-- OR => µÑ Áß¿¡ ÇÑ °³ ÀÌ»óÀÌ trueÀÏ °æ¿ì
-- Á÷À§°¡ MANAGERÀÌ°Å³ª CLERKÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸
SELECT *
FROM emp
WHERE job='MANAGER' OR job='CLERK';
---------------------------------------------------------------------------------------
-- ¿À¶óÅ¬¿¡¼­ Á¦°øÇÏ´Â ¿¬»êÀÚ
-- BETWEEN ~ AND : ±â°£, ¹üÀ§ = ÀÚ¹Ù (¿¹¾à ±â°£, Ã¼Å©ÀÎ ±â°£, ÆäÀÌÁö)
-- >= AND <=
-- ±Þ¿©°¡ 1000~3000 »çÀÌÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
-- ¼ýÀÚ / ³¯Â¥
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

-- 80³âµµ¿¡ ÀÔ»çÇÑ ¸ðµç »ç¿øÀÇ Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE hiredate BETWEEN '80/01/01' AND '80/12/31';

-- 5°³¸¸ Ãâ·Â
SELECT empno,ename,job,hiredate,rownum
FROM emp
WHERE rownum BETWEEN 1 AND 5;

-- IN => OR°¡ ¿©·¯ °³ÀÎ °æ¿ì¿¡ »ç¿ë
-- deptno(ºÎ¼­ ¹øÈ£) 10ÀÌ°Å³ª 20ÀÌ°Å³ª 30ÀÎ »ç¿ø Ãâ·Â
SELECT *
FROM emp
WHERE deptno=10 OR deptno=20 OR deptno=30;

-- WHERE ÄÃ·³¸í IN(°ª...)
SELECT *
FROM emp
WHERE deptno IN(10,20,30);

-- ¹®ÀÚ => ´ÙÁß Á¶°Ç °Ë»ö : <input type=checkbox>, ³¯Â¥(¹®ÀÚ¿­)
-- KING, ADAMS, SCOTT, FORD, MARTIN
SELECT *
FROM emp
WHERE ename='KING' OR ename='ADAMS' OR ename='SCOTT' OR ename='FORD' OR ename='MARTIN';

SELECT *
FROM emp
WHERE ename IN('KING','ADAMS','SCOTT','FORD','MARTIN');

-- NOT (ºÎÁ¤¿¬»êÀÚ)
-- jobÀÌ MANAGER, CLERKÀÌ ¾Æ´Ñ »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE NOT (job='MANAGER' OR job='CLERK');

-- KING, ADAMS, SCOTT, FORD, MARTIN »ç¿øÀÌ ¾Æ´Ñ »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE ename NOT IN('KING', 'ADAMS', 'SCOTT', 'FORD', 'MARTIN');

-- 81³â¿¡ ÀÔ»çÇÏÁö ¾ÊÀº »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';

-- NOT IN, NOT BETWEEN, NOT LIKE

-- NULL => °ªÀÌ ¾ø´Â »óÅÂ => ¿¬»ê Ã³¸®°¡ ¾È µÈ´Ù
-- ¿¬»ê Ã³¸®¸¦ À§ÇÑ ¿¬»êÀÚ Á¦°ø => IS NULL, IS NOT NULL;
-- »ç¼ö(mgr)°¡ ¾ø´Â »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE mgr IS NULL;

/*
	LIKE === ÁøÈ­ ===> REGEXP_LIKE(ename,'[°¡-ÆR]')
	 = % : ¹®ÀÚÀÇ °³¼ö¸¦ ¸ð¸£´Â °æ¿ì (Á¦ÇÑ X)
	 = _ : ÇÑ ±ÛÀÚ

	 === °Ë»ö

	 = ½ÃÀÛ ¹®ÀÚ¿­ : ¹®ÀÚ¿­% => IN%
	 = ³¡³ª´Â ¹®ÀÚ¿­ :  %¹®ÀÚ¿­ => %EN
	 = Æ÷ÇÔµÇ´Â ¹®ÀÚ¿­ : %EN%
	 = ±ÛÀÚ ¼ö¸¦ ¾Ë°í ÀÖ´Â °æ¿ì : _ => _______ , ___T__ ...
*/
-- »ç¿ø Áß¿¡ AÀÚ·Î ½ÃÀÛÇÏ´Â »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE ename LIKE 'A%';

-- »ç¿ø Áß¿¡ TÀÚ·Î ³¡³ª´Â »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE ename LIKE '%T';

-- »ç¿ø ÀÌ¸§ Áß¿¡ INÀÚ·Î ³¡³ª°Å³ª ENÀ¸·Î ³¡³ª´Â »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE ename LIKE '%IN' OR ename LIKE '%EN';

-- »ç¿ø ÀÌ¸§ Áß¿¡ OÀÚ¸¦ Æ÷ÇÔÇÏ°í ÀÖ´Â »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE ename LIKE '%O%';

-- »ç¿ø ÀÌ¸§ Áß¿¡ AÀÚ·Î ½ÃÀÛÇÏ°í 5±ÛÀÚÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE ename LIKE 'A____';

-- »ç¿ø ÀÌ¸§ °¡¿îµ¥°¡ OÀÌ°í 5±ÛÀÚÀÎ »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE ename LIKE '__O__';

-- BOOK => Ãà±¸¸¦ Æ÷ÇÔÇÏ°í ÀÖ´Â Ã¥ Ãâ·Â
SELECT *
FROM book
WHERE bookname LIKE '%Ãà±¸%';

-- FOOD => name, type => ÇÑ½Ä Æ÷ÇÔ
SELECT name,type
FROM food
WHERE type LIKE '%ÇÑ½Ä%';

-- FOOD => name, type => ºÐ½Ä Æ÷ÇÔ
SELECT name,type
FROM food
WHERE type LIKE '%ºÐ½Ä%';

-- FOOD => address => ¸¶Æ÷±¸
SELECT name,type,address
FROM food
WHERE address LIKE '%¼­±³%';

-- emp => »ç¿ø ÀÌ¸§ Áß¿¡ A, D, K, E, S¸¦ Æ÷ÇÔÇÑ »ç¿øÀÇ ¸ðµç Á¤º¸ Ãâ·Â
SELECT *
FROM emp
WHERE REGEXP_LIKE(ename,'A|D|K|E|S');