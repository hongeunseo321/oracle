/*
        �� ���� : SELECT / ������ / ���� �Լ�
    145page
    ����)
        SELECT ALL(*) | �÷�����Ʈ
        FROM table_name(view_name|SELECT)
        {
            WHERE ���ǹ�
            GROUP BY
            HAVING
            ORDER BY
        }
        *** SELECT ���� : ������ ����
            = �÷� ��� ��� ==> ��Į�� ���� ����
            = table ��� ��� ==> �ζ��κ�
            = ���ǰ� ��� ��� ==> ���� ����

1. emp���� �޿��� 2000 �̻��� ����� ����ϼ���.
    ������ : ���ǿ� �´� ������ ����
    �������� : ���ϴ� �÷��� ����
    
    SELECT *
    FROM emp
    WHERE sal>=2000;

2. emp���� �޿� sal�� 2000 �̻��� ����� �̸� ename�� ��� empno�� ����ϼ���.
    
    SELECT ename,empno
    FROM emp
    WHERE sal>=2000;

3. emp���� �̸��� 'FORD'�� ����� ��� empno�� �޿� sal�� ����ϼ���
    1) ���� / ��¥ => ''
    2) ��Ī => �÷� "" / �÷� as ��Ī
    
    SELECT empno, sal
    FROM emp
    WHERE ename='FORD';

4. emp���� �Ի����� hiredate�� 82�� ���Ŀ� �Ի��� �����
   �̸��� �Ի����ڸ� ����ϼ���.
    (��¥�� �������� YY/MM/DD���¸� ����ϸ�ȴ�.)
    1) ���� / ��¥ => �� ������ �̿�
    
    SELECT ename,hiredate
    FROM emp
    WHERE hiredate>'82/12/31';

5. emp���� �̸��� J�� ���� ����� �̸��� ����� ����ϼ���.
    
    SELECT ename,empno
    FROM emp
    WHERE ename LIKE '%J%';

6. emp���� �̸��� S�� ������ ����� �̸��� ����� ����ϼ���.

    SELECT ename,empno
    FROM emp
    WHERE ename LIKE '%S';

7. emp���� �̸��� �ι�° ���ڰ� A�� ���� ����� �̸��� ����� ����ϼ���.

    SELECT ename,empno
    FROM emp
    WHERE ename LIKE '_A%';

8. emp���� ���ʽ��� 300�̰ų� 500�̰ų� 1400�� �����
    �̸�, ���, ���ʽ��� ����ϼ���.
    => OR => IN
    
    SELECT ename,empno,comm
    FROM emp
    WHERE comm=300 OR comm=5000 OR comm=1400;
    
    SELECT ename,empno,comm
    FROM emp
    WHERE comm IN(300, 500, 1400);


9. emp���� ���ʽ��� 500���� 4000 ������ ����� �̸��� ���, ���ʽ��� ����ϼ���.
                  ----------------
                    >= 500 AND <=4000
                    BETWEEN 500 AND 4000
                    
    SELECT ename,empno,comm
    FROM emp
    WHERE comm>=500 AND comm<=4000;
    
    SELECT ename,empno,comm
    FROM emp
    WHERE comm BETWEEN 500 AND 4000;

10. emp���� �μ��� 10�̰� ��å�� CLERK��
     �����̸�,���,��å(job),�μ�(deptno)�� ����ϼ���.
     AND => �� ���� ������ ���ÿ� true
     
    SELECT ename,empno,job,deptno
    FROM emp
    WHERE deptno=10 AND job='CLERK';

11. emp���� �Ի����ڰ� 82�� �����̰ų� ��å�� MANAGER�� �����
     �̸��� �Ի����ڸ� ����ϼ���.
     
     SELECT ename,hiredate
     FROM emp
     WHERE hiredate>'82/12/31' OR job='MANAGER';
     
     SELECT ename,hiredate
     FROM emp
     WHERE SUBSTR(hiredate,1,2)>82 OR job='MANAGER';
     
     ** ��¥ ������ SUBSTR�� �ַ� ���

12. emp���� �μ���ȣ�� 10�� �ƴ� ������ ���,�̸�,�μ���ȣ�� ����ϼ���.

    SELECT empno,ename,deptno
    FROM emp
    WHERE deptno<>10;
    
    SELECT empno,ename,deptno
    FROM emp
    WHERE NOT (deptno=10);
    
    SELECT empno,ename,deptno
    FROM emp
    WHERE deptno NOT IN(10);

13. emp���� �̸��� A�� ���� ������ ����� �̸��� ����ϼ���.
    
    SELECT empno, ename
    FROM emp
    WHERE ename NOT LIKE('%A%');

14. emp���� ���ʽ��� 500���� 1400�� �ƴ� ������ ����� ���ʽ��� ����ϼ���.

    SELECT empno,comm
    FROM emp
    WHERE comm NOT BETWEEN 500 AND 1400;

15. emp���� �Ŵ����� ���� ���� �����̸��� ����ϼ���.
-- null���� is null�� ǥ���Ѵ�.

    SELECT ename
    FROM emp
    WHERE mgr IS NULL;

16. emp���� Ŀ�̼��� �޴�(Ŀ�̼��� null���� �ƴ�) �����̸��� Ŀ�̼��� ����ϼ���.
    
    SELECT ename,comm
    FROM emp
    WHERE comm IS NOT NULL AND comm<>0;

17. emp���� ���, �̸�, �޿��� ����ϴµ� �޿��� ����������� ����ϼ���.
    ORDER BY ����
    ORDER BY �÷��� ASC|DESC
                   --- ����
             �÷���ȣ
             
    SELECT empno,ename,sal
    FROM emp
    ORDER BY sal ASC;
    
    SELECT empno,ename,sal
    FROM emp
    ORDER BY sal;
    
    SELECT empno,ename,sal
    FROM emp
    ORDER BY 3 ASC;

18. emp���� ���, �̸�, �޿��� ����ϴµ� �޿��� ���� ������� ����ϼ���.

    SELECT empno,ename,sal
    FROM emp
    ORDER BY sal DESC;
    
    SELECT empno,ename,sal
    FROM emp
    ORDER BY 3 DESC;

19. emp���� ���, �̸�, �Ի����� ����ϴµ� �Ի����ڰ� �ֱ��� ������� ����ϼ���.

    SELECT empno,ename,hiredate
    FROM emp
    ORDER BY hiredate DESC;
    
    => ������ �� �Ǵ� ������ => ũ�Ѹ� => ASC
    
    => ���� �����ϴ� ������ => DESC
        �Խ��� / ��� / ���� / ��ٱ���

20. emp���� ���, �̸�, �޿��� ����ϴµ� ���� �޿��� ���� ������
     �׸��� �̸��� ���� ������ �����Ͻÿ�.
     
     SELECT empno,ename,sal
     FROM emp
     ORDER BY sal DESC, ename ASC;
    
    => FROM > WHERE > ORDER BY > SELECT ����
    => ���� ���� : ���� / �亯�� �Խ���(���� ���ϱ�)

21. ����̸��� ������ ����ϴµ�, �̸��� �÷����� employee��� �ϰ� ������ �÷����� salary��� �Ͻÿ�.
    *** ��Ī => �÷����� �� ��� / �� �� ���� ��Ī (aaaaa "sabun")
    
    SELECT ename "employee",sal "salary"
    FROM emp;

22. ����̸��� ������ ����ϴµ�, �̸��� �÷����� employee��� �ϰ� ������ �÷����� salary��� �Ͻÿ�.
    
    SELECT ename "employee",sal "salary"
    FROM emp;

23. ����̸��� �Ի����� ����ϴµ� ����̸��� �÷����� employee name���� ��µǰ� �Ͻÿ�. 

    SELECT ename "employee name",hiredate
    FROM emp;

24. ������ �ߺ����� ����Ͻÿ�.
    DISTINCT �÷�
    
    SELECT DISTINCT job
    FROM emp;
 
25. �μ���ȣ�� ����ϴµ� �ߺ������ؼ� ����Ͻÿ�.
    
    SELECT DISTINCT deptno
    FROM emp;
    
    DISTINCT�� ���� ����, �帣�� �ַ� ���δ�
        => ��� => �Խ��� ���� / ��������
    => �ڹ� : HashSet
    => �⺻ : ��û �� => �ڹٿ��� ����
        ���� ��¹� => ����Ŭ���� ����
        
    => ��û = �ڹ� = SQL = ����Ŭ

26.�����ȣ�� 7788���� ����� �����ȣ�� �̸��� ����Ͻÿ�.

    SELECT empno,ename
    FROM emp
    WHERE empno=7788;
    
    => ��¥, ���� ' '
    => ���� ���� ;
    => �ڹٿ��� ���� �ÿ��� ;�� �ڵ� �߰��ȴ�
        ����, ;�� ����ϸ� �� �ȴ�

27.������ 3000�� ������� �̸��� ������ ����Ͻÿ�.
 
    SELECT ename,sal
    FROM emp
    WHERE sal=3000;

28. �̸��� scott�� ����� �̸��� ������ ����Ͻÿ�.

    SELECT ename,job
    FROM emp
    WHERE ename='SCOTT';
    
    SELECT ename,job
    FROM emp
    WHERE ename=UPPER('SCOTT');
    
    => ����� �����ʹ� ��ҹ��ڸ� �����Ѵ�
    => ��й�ȣ (��ҹ� Ư������ 8�ڸ� �̻�)
 
29.������ 3000 �̻��� ������� �̸��� ������ ����Ͻÿ�.

    SELECT ename,sal
    FROM emp
    WHERE sal>=3000;
 
30. ������ SALESMAN�� �ƴ� ������� �̸��� ������ ����Ͻÿ�.

    SELECT ename,job
    FROM emp
    WHERE job<>'SALESMAN'; 
    => DBA
    
    SELECT ename,job
    FROM emp
    WHERE job!='SALESMAN'; 
    => ���α׷���
    
    SELECT ename,job
    FROM emp
    WHERE job^='SALESMAN';
    => ������ ������� �ʴ´�
    
31. ������ 1000���� 3000 ������ ������� �̸��� ������ ����ϴµ�, �÷����� Employee, Salary�� ����Ͻÿ�.
    >= AND <= (149page)
    BETWEEN ~ AND

    SELECT ename "Employee", sal "Salary"
    FROM emp
    WHERE sal>=1000 AND sal<=3000;
    
    SELECT ename "Employee", sal "Salary"
    FROM emp
    WHERE sal BETWEEN 1000 AND 3000;
    
32. ����̸��� ������ ����ϴµ� ������ ���� ������� ���� ��������� ����Ͻÿ�.

    SELECT ename,sal
    FROM emp
    ORDER BY sal;
 
33. �̸��� �Ի����� ����ϴµ� ���� �ֱٿ� �Ի��� ������� ����Ͻÿ�.

    SELECT ename,hiredate
    FROM emp
    ORDER BY hiredate DESC;
 
34. ������ SALESMAN�� ������� �̸��� ���ް� ������ ����ϴµ�, ������ ���� ������� ����Ͻÿ�.
    SELECT - FROM - WHERE - ORDER BY

    SELECT ename,sal,job
    FROM emp
    WHERE job='SALESMAN'
    ORDER BY sal DESC;
    
    => �ڵ� ����
    SELECT empno,ename,sal,DENSE_RANK() OVER(ORDER BY sal DESC) "rank"
    FROM emp;
 
35. ������ 1000 �̻��� ������� �̸��� ������ ����ϴµ� ������ ���� ������� ���� ��������� ����Ͻÿ�.

    SELECT ename,sal
    FROM emp
    WHERE sal>=1000
    ORDER BY sal ASC;

36. ����(������*12)�� 36000 �̻��� ������� �̸��� ������ ����ϰ� �÷����� ��Ī�� "����"���� �Ͻÿ�.

    SELECT ename,sal*12 "����"
    FROM emp
    WHERE sal*12>=36000;
 
37. ������ 1000���� 3000���̰� �ƴ� ������� �̸��� ������ ����Ͻÿ�.
          ---------------------- NOT BETWEEN
    SELECT ename,sal
    FROM emp
    WHERE sal NOT BETWEEN 1000 AND 3000;
    
    SELECT ename,sal
    FROM emp
    WHERE sal<1000 OR sal>3000;
 
38. �̸��� ù ���ڰ� s�� �����ϴ� ������� �̸��� ����Ͻÿ�.

    SELECT ename
    FROM emp
    WHERE ename LIKE 'S%';
 
39. �̸��� �� ���ڰ� T�� ������ ������� �̸��� ����Ͻÿ�.

    SELECT ename
    FROM emp
    WHERE ename LIKE '%T';
 
40. �̸��� �ι�° ö�ڰ� m�� ������� �̸��� ����Ͻÿ�.

    SELECT ename
    FROM emp
    WHERE ename LIKE '_M%';
 
41. �̸��� ����° ö�ڰ� L�� ����� �̸��� ����Ͻÿ�.

    SELECT ename
    FROM emp
    WHERE ename LIKE '__L%';
 
42. �̸��� ù��° ö�ڰ� S �� �ƴ� ������� �̸��� ����Ͻÿ�.
    
    SELECT ename
    FROM emp
    WHERE ename NOT LIKE 'S%';
 
43. ��� ��ȣ�� 7788, 7902, 7369���� ������� �����ȣ�� �̸��� ����Ͻÿ�.

    SELECT empno,ename
    FROM emp
    WHERE empno IN(7788,7902,7369);
 
44. ������ SALESMAN,ANALYST�� �ƴ� ������� �̸��� ������ ����Ͻÿ�.

    SELECT ename,job
    FROM emp
    WHERE job NOT IN('SALESMAN','ANALYST');
    
    => NOT IN (���� / ��¥ / ����)
 
45. Ŀ�̼��� null�� ������� �̸��� Ŀ�̼��� ����Ͻÿ�.
    IS NULL / IS NOT NULL

    SELECT ename,comm
    FROM emp
    WHERE comm IS NULL;
    
46. Ŀ�̼��� null�� �ƴ� ������� �̸��� Ŀ�̼��� ����Ͻÿ�.

    SELECT ename,comm
    FROM emp
    WHERE comm IS NOT NULL;

47. ������ 1000���� 3000 ������ ������� �̸��� ������ ����ϴµ� ������ ����  ������� ����Ͻÿ�

    SELECT ename,sal
    FROM emp
    WHERE sal BETWEEN 1000 AND 3000
    ORDER BY sal DESC;
  
48. 1981�� 11�� 17�Ͽ� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�.

    SELECT ename,hiredate
    FROM emp
    WHERE TO_CHAR (hiredate,'yyyy"��" mm"��" dd"��"')='1981�� 11�� 17��';
 
49. 1981�⵵�� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�.

    SELECT ename,hiredate
    FROM emp
    WHERE TO_CHAR (hiredate,'yyyy')=1981;
 
50. ���Ῥ���ڸ� �̿��ؼ� �̸��� ������ �����ؼ� ����Ͻÿ�.
    || => ���ڿ� ����
    
    SELECT ename||' '||sal
    FROM emp;
 
51. ������ ����� "SCOTT�� ������ ANALYST �Դϴ�."�� ���� ����� ����Ͻÿ�.
    
    SELECT ename||'�� ������ '||job||' �Դϴ�'
    FROM emp;
    => ����Ŭ�� Ư���� ��찡 �ƴϸ� ''
    
52. �Ʒ��� ���� ����� ����Ͻÿ�.

    SELECT ename,job,sal
    FROM emp;
 
53. ������ SALESMAN�� ������� �̸��� ������ ����ϴµ� ������ ���� ������� ����ϰ� �Ʒ��� ���� ����� ����Ͻÿ�.
    "ALLEN �� ������ 36000 �Դϴ�."
    
    SELECT ename||'�� ������ '||sal*12||'�Դϴ�'
    FROM emp
    WHERE job='SALESMAN'
    ORDER BY sal DESC;

54. �̸��� �빮�ڷ� ������ �ҹ��ڷ�, �̸��� ù���ڸ� �빮�� �������� �ҹ��ڷ� ����Ͻÿ�.
    -- ���� ����
    
    SELECT UPPER(ename),LOWER(job),INITCAP(ename)
    FROM emp;

---------------------------------- ���� �Լ� ------------------------------------
55. �̸��� scott�� ����� �̸��� ������ ����ϴµ� where���� scott�� �ҹ��ڷ� �˻��ؼ� ����Ͻÿ�.
    
    SELECT ename, sal
    FROM emp
    WHERE ename=UPPER('scott');

56.�Ʒ��� ���� ����� ����Ͻÿ�.
    SUBSTR(���ڿ�, ���� ��ġ, ����) ==> ����Ŭ ���� ��ȣ�� 1������
    
    SELECT ename,SUBSTR(ename,1,3) "SUBSTR"
    FROM emp;
 
57. �̸��� ù��° ö�ڸ� ����ϴµ� �ҹ��ڷ� ��µǰ� �Ͻÿ�
 
    SELECT LOWER(SUBSTR(ename,1,1)||SUBSTR(ename,2,LENGTH(ename)-1))
    FROM emp;

58. upper, lower, substr, || �� ����ؼ� �Ʒ��� ���� ����� ����Ͻÿ�.
    => INITCAP(ename)�� ������� �ʰ� �ۼ��ϱ�
    
    SELECT UPPER(SUBSTR(ename,1,1))||LOWER(SUBSTR(ename,2))
    FROM emp;
 
59. �̸��� M�ڸ� �����ϰ��ִ� ������� �̸��� ������ ����Ͻÿ�.
 
    SELECT ename,sal
    FROM emp
    WHERE ename LIKE '%M%';

60. �̸��� EN �Ǵ� IN�� �����ϰ� �ִ� ������� �̸��� �Ի����� ����ϴµ� �ֱٿ� �Ի��� ������ ����Ͻÿ�.
    LIKE + ORDER BY
        
    SELECT ename,hiredate
    FROM emp
    WHERE ename LIKE '%EN%' OR ename LIKE '%IN%'
    ORDER BY hiredate DESC;
    
    SELECT ename,hiredate
    FROM emp
    WHERE REGEXP_LIKE(ename,'EN|IN')
    ORDER BY hiredate DESC;
 
61. ������ SALESMAN�� ������� ��� �̸��� ������ ������ ����ϴµ� ������ ���� ������� ����Ͻÿ�.
    
    SELECT ename,job,sal
    FROM emp
    ORDER BY sal DESC;

62. �̸��� ù���ڰ� A�� �����ϴ� ������� �̸��� ���ް� ������ ����Ͻÿ�. 
    
    SELECT ename,sal,job
    FROM emp
    WHERE ename LIKE 'A%';

63. ������ 1000���� 3000 ������ ������� �̸��� ���ް� �Ի����� ����ϴµ�, �Ի����� ���� �Ի��� ������� ��µǰ� �Ͻÿ�.
    
    SELECT ename,sal,hiredate
    FROM emp
    WHERE sal BETWEEN 1000 AND 3000
    ORDER BY hiredate DESC;
    
64. instr �Լ��� �̿��ؼ� �̸��� A�ڸ� �����ϰ� �ִ� ������� �̸��� ����Ͻÿ�. 
    INSTR => INSTR(���ڿ�, ã�� ����, �˻� ���� ��ġ, �ߺ��� ��� �� ��°)
    ���ڿ�: �˻��� �÷� �Ǵ� ���ڿ�
    ã�� ����: ã�� ���� ����
    ���� ��ġ: �˻��� ������ ��ġ (1 = �� �պ���)
    �� ��°: �ش� ���ڰ� ���� �� ���� ��� �� ��°���� ����
    
    SELECT ename
    FROM emp
    WHERE INSTR(ename,'A',1,1)>0;
    
    3��° ���� O�� ã�ƶ�
    SELECT ename
    FROM emp
    WHERE ename LIKE '__O%';
    
    SELECT ename
    FROM emp
    WHERE INSTR(ename,'O',1,1)=3;

65. �̸��� ������ ����ϴµ� ������ ��ü 10�ڸ��� ����ϰ� ������ �ڸ��� *�� ����Ͻÿ�! 
    RPAD => ��� ������ ���� => ���ڰ� ������ ��ü ���� ���
    'ABC' 7 ==> ABC****
    RPAD(���ڿ�, ��� ����, ��ü ����)
    
    SELECT RPAD(sal,10,'*')
    FROM emp;
    
    => �� : ID ã��, ��й�ȣ : �̸��� ����

66. �̸��� ������ ����ϴµ� ������ ��ü 10�ڸ��� ����ϰ� ������ �ڸ��� �������� ����Ͻÿ�. 
    LPAD
    
    SELECT ename,LPAD(sal,10,' ')
    FROM emp;

67. length �Լ��� �̿��ؼ� �̸��� �̸��� ö���� ������ ����Ͻÿ�. 
    
    SELECT ename,LENGTH(ename)
    FROM emp;
    
    �̸��� 5���� ��� ���
    SELECT ename
    FROM emp
    WHERE LENGTH(ename)=5;
    
    => ���� �Լ��� SELECT������ ����ϴ� ���� �ƴϴ�
        WHEREm GROUP BY, ORDER BY�� ����
        *** FROM������ ��� �Ұ�
        
        SELECT �����Լ�
        FROM table_name | view_name | SELECT~
        WHERE �����Լ� | �÷�
        GROUP BY �����Լ� | �÷�
        ORDER BY �����Լ� | �÷�

68. �̸�, �Ի��� ��¥���� ���ñ��� �� ��� �ٹ��ߴ��� �Ҽ��� �ڿ��� �߶� ����Ͻÿ�.
                               -----------      -----------------
                               MONTHS_BETWEEN   TRUNC
    
    SELECT ename,TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate))
    FROM emp;
 
69. ���ú��� ������ ���ƿ� �������� ��¥�� ����Ͻÿ�. 
    NEXT_DAY
    
    SELECT NEXT_DAY(SYSDATE,'��')
    FROM DUAL;
 
70. �̹��� ������ ��¥�� ����Ͻÿ�. 
    LAST_DAY
    
    SELECT LAST_DAY(SYSDATE)
    FROM DUAL;
 
71. ������ ���� �������� ����Ͻÿ� 
    
    SELECT SYSDATE,TO_CHAR(SYSDATE,'DY"����"')
    FROM DUAL;
 
72. emp���� �̸�, �Ի��� ������ ����Ͻÿ�. 
    
    SELECT ename,TO_CHAR(hiredate,'DY"����"')
    FROM emp;

73. ����Ͽ� �Ի��� ������� �̸��� �Ի���, �Ի��� ������ ����Ͻÿ�.

    SELECT ename,hiredate,TO_CHAR(hiredate,'DY"����"')
    FROM emp
    WHERE TO_CHAR(hiredate,'DY"����"')='�����';
 
74. �̸��� ������ ����ϴµ� ���޿� õ������ �ο��Ͻÿ�! (��: 3000 -> 3,000)
    TO_CHAR
    
    SELECT ename,TO_CHAR(sal,'L9,999')
    FROM emp;
    
    => �ڹٴ� #,###
    => ����Ŭ�� 9,999
 
75. �̸��� Ŀ�̼��� ����ϴµ� Ŀ�̼��� null�� ������� 0���� ����Ͻÿ�.
    NVL => NULL ���� �ٸ� �����ͷ� ��ü
    
    SELECT ename,NVL(comm,0)
    FROM emp;

76. �̸��� Ŀ�̼��� ����ϴµ� Ŀ�̼��� null�� ������� no comm �̶� �۾��� ����Ͻÿ�.

    SELECT ename,NVL(TO_CHAR(comm),'no comm')
    FROM emp;
*/