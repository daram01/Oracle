--DQL(���Ǿ�) ���̺� ����ִ� �����͸� ��ȸ�� �� ���
--select �÷���
--from ����ϰ� ���� ���̺��

--��ü������
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

select * --��ǥ�� ��ü�����͸� ��ȸ�� �� �ִ�.
from emp;

--�κ��÷�������
select empno,ename,sal
from emp;

select deptno
from emp;

--�ߺ������͸� �����ϴ� distinct
select DISTINCT(deptno)
from emp;

 select distinct(job)
 from emp;

-- �����͸� Ȱ���� ���� ���ϱ�
-- ������ �������� ��ģ �ݾ� ���ϱ�
-- +, -, *, / �����ڰ� ����. ������(%) �����ڴ� ����.
-- �÷��� ������� �����Ѵ�.
-- null ���� ���� �Ұ��ϴ�. null���� ������ �ϸ� ��� null�� �ȴ�.
-- nvl(comm,0) -> comm�� null�� ��� 0 ���� ��ü�Ѵ�. ��� ��
-- �÷��� �̸��� ��ưų� �˾ƺ� �� ���� �� ��Ī�� ����Ѵ�. ( �÷��� as ��Ī )
SELECT ename as �����, sal, sal * 12 + nvl(comm,0) as ���� , comm
from emp;

-- 2022.10.18

--������ ����
--select �÷���
--from ���̺��
--order by �÷��� (���ı����� �Ǵ� ��) asc(��������, ������ -> ū��) / desc(��������, ū�� -> ������) 
--order by �� ���� �⺻�� ���������̱� ������ asc�� ���� ���� ���� �����ϴ�.
--����(1 ~ 10), ��¥(���ų�¥ ~ �ֱٳ�¥), ����(��������) -> ��������, ���������� �ݴ�� �����ϸ� ��

--��������
select *
from emp
order by sal  desc;

--�Ի����
select *
from emp
order by hiredate desc;

--���ǰ˻�
--select �÷���
--from ���̺��
--where ���ǽ�(�÷��� =(������) ������ ��); <, >, =, != / <>, <=, >=, and, or 
--����Ŭ���� ���ڿ� ����Ҷ��� ' ' ����Ѵ�.
--���� ���̺� �ִ� ���ڰ��� ������ ��ҹ��� �����ؼ� �����ϰ� ����� �Ѵ�.


SELECT *
FROM emp
where sal >= 3000; -- �޿��� 3õ �̻��� ���

SELECT *
FROM emp
where deptno = 30; -- 30 �μ��� �ٹ��ϴ� ��� 



--and -> �ΰ��� �̻��� ������ ��� ���� ���
SELECT *
FROM emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499; -- �μ���ȣ�� 30�̰�, ������ SALESMAN�̸� �����ȣ�� 7499�� ���

-- ���ڸ� �������� ����� �� ���Ѿ� �ϴ� ����
-- 1. ��ҹ��� 2. ' ' 
select *
from emp
where ename = 'FORD'; -- ford ��� �ҹ��ڶ�� ������ �ƹ� ����� ������ ����. FORD��� �̸��� �ֱ� �����̴�.

--��¥�� �������� ����� ��
-- ' ' (��¥�� ������ ����)
-- �⵵ ���ڸ� �� ���ڸ� ��¥ ���ڸ�, �� 80/12/20�� �������� ����� 1980�� 12�� 20�� �ð� �� �� ���� �� ������ �� ������. (�������)
select *
from emp
where hiredate < '1982/01/01'; -- 1982�� 01�� 01�� ������ �Ի��� ��� ��ȸ

--or �� �� �̻��� �����߿� �ϳ��� ���� ���
select *
from emp
where deptno = 10 or sal > 2000; -- �� �߿� �ϳ��� ���Ǹ� �����ϴ� ���

--not �� ���� ������
select *
from emp
where sal != 3000;

select *
from emp
where not sal = 3000; -- 3000�� ���� �ʴ� ���  

--and, or ���� ������ ǥ���� ���� ���
select *
from emp
where sal >= 1000 and sal <= 3000; -- 1000���� �̻� ~ 3000���� ���� ������ ���

select *
from emp
where sal <= 1000 or sal >= 3000; -- 1000���� ���ϰų�, 3000���� �̻��� ���

--and �� ����ؼ� ����ϴ� ���ǽ� between and
select *
from emp
where sal between 1000 and 3000; -- 1000���� �̻� ~ 3000���� ���� ������ ���

--or�� ����ؼ� ����ϴ� ���ǽ� in
select *
from emp
where sal = 800 or sal = 3000 or sal = 5000; -- 800����, 3000����, 5000������ ��� 

select *
from emp
where sal in (800, 3000, 5000); -- 800����, 3000����, 5000������ ��� 

--like ������
--���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�.
--���̵� ī�带 ����Ѵ� ( %, _ )
-- % -> ���̿� ������� ��� ���� �����͸� �ǹ��Ѵ�. ��� ���ڸ� ��ü�Ѵ�.
-- _ -> � ���̵� ������� �� ���� ���� �����͸� �ǹ��Ѵ�. �� ���ڸ� ��ü�Ѵ�.
select *
from emp
where ename like 'F%'; -- ������ F�� �����ϴ� ���

select *
from emp
where ename like '%D'; -- �������� D�� ������ ���

select *
from emp
where ename like '%O%'; -- �̸� �߿� O�� ���ԵǾ� �ִ� ���

select *
from emp
where ename like '___D'; -- �̸� �߿� �ݵ�� 4��°�� D�� �ִ� ���

select *
from emp
where ename like 'S___%'; -- �̸� ù ���ڰ� S�̰�, �ڿ� �����ڰ� ���� �� ���Ĵ� ���ڰ� �ֵ� ���� ��� ���� ���

--null ������
-- is null / is not null
select *
from emp
where comm = null; -- null�� �� �Ұ��� ����.

select *
from emp
where comm is null; -- comm�� null�� ��

select *
from emp
where comm is not null; -- comm�� null�� �ƴ� ��

--���տ����� ( �ΰ� �̻��� ���̺��� ��ȸ�� �� )
--�� ���� select ������ ����Ѵ�.
--�÷��� ������ �����ؾ� �Ѵ�.
--�÷��� Ÿ���� �����ؾ� �Ѵ�.
--�÷��� �̸��� ��� ����.
--������(union), ������(INTERSECT), ������(minus)
select empno, ename, sal, deptno
from emp
where deptno = 10
union --(�������� ǥ���ϴ� ��)
select empno, ename, sal, deptno
from emp
where deptno = 20;

--�ߺ��Ǿ��� ��� �� ���� ��ȸ �ȴ�.
select empno, ename, sal, deptno
from emp
where deptno = 10
union --(�������� ǥ���ϴ� ��)
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename, sal, deptno
from emp
where deptno = 10
union all -- �ߺ��Ǿ �� ��ȸ �ϰ� ���� ��
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename, sal, deptno
from emp
minus --������
select empno, ename, sal, deptno
from emp
where deptno = 10;

--�������� �ĺ��ڶ�� ���� ���� �÷����� ������.

select empno, ename, sal, deptno
from emp
INTERSECT -- ������
select empno, ename, sal, deptno
from emp
where deptno = 10;

--where
--�񱳿�����, ��������, like, is null / is not null, ���տ�����
--<,>,<=,>=,=,!= 
--and, or, not, between and, in 
--like ( % , _ )
--is null, is not null
--union, union all, minus, intersect 

--1
select *
from emp
where ENAME like '%S';

--2
select empno, ename, job, sal, deptno
from emp
where deptno = 30 
and job = 'SALESMAN';

--3-1
select empno, ename, job, sal, deptno
from emp
where deptno in(20,30)
and sal > 2000;
--select empno, ename, job, sal, deptno
--from emp
--where deptno between 20 and 30 and sal > 2000; ���� �� ��

--3-2
select empno, ename, job, sal, deptno
from emp
where deptno = 20
and sal > 2000
union
select empno, ename, job, sal, deptno
from emp
where deptno = 30
and sal > 2000;

--4
select *
from emp
where sal < 2000
or sal > 3000;

--select *
--from emp
--minus
--select *
--from emp
--where sal >= 2000 and sal <= 3000; ���� �� �� 

--5
select ename, empno, sal, deptno
from emp
where ename like '%E%' 
and deptno = 30 
and sal not between 1000 and 2000;

--6
select *
from emp
where comm is null
and job in('MANAGER','CLERK')
and mgr is not null
and ename not like '_L%';

-- �Լ�
-- �����Լ� : upper, lower, substr, instr, replace, lpad, rpad, concat
-- �����Լ�
-- ��¥�Լ�


-- �����Լ�
select 'Welcome', upper('Welcome')
from dual;

select lower(ename), upper(ename)
from emp;

select *
from emp
where lower(ename) = 'scott'; -- ��ȣ �� ���� �����͸� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ�Ѵ�.

select ename, length(ename) -- ��ȣ �� �÷��� ���ڿ� ���̰� ���� 
from emp;

--         1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 ���
--       -17                                                    -1 ����
select 'Welcome to Oracle', substr('Welcome to Oracle', 2,3), substr('Welcome to Oracle', 10)
from dual; --�������̺�

select 'Welcome to Oracle', substr('Welcome to Oracle', -3,3), substr('Welcome to Oracle', -17)
from dual;

select instr('Welcome to Oracle','e')
from dual; 

select instr('Welcome to Oracle','e',3)
from dual; 

select instr('Welcome to Oracle','e',3,2) -- ������ 3��°���� �ϰ�, �ι�°�� e�� ������ ��ġ
from dual; 

select 'Welcome to Oracle', replace('Welcome to Oracle', 'to', 'of') -- to �� of�� �ٲ���. Ư�� ���ڸ� �ٸ� ���ڷ� �ٲٴ� �Լ�
from dual;
 
select 'oracle', lpad('oracle',10,'#'),rpad('oracle',10,'*'), lpad('oracle',10)
from dual;

select rpad('990103-',14,'*')
from dual;

select concat(empno, ename) - concat --�ΰ��� �÷��� �̾����� ��ȸ�ȴ�.
from emp;

select concat(empno, ename), empno || '' || ename  -- �ΰ��� �Լ��� ������ concat�� || '' ||
from emp;


-- �����Լ�
select 
        round(1234.5678), -- �ڸ����� �������� ������ �Ҽ��� ù°�ڸ����� �ݿø� �ȴ�.
        round(1234.5678,0), -- ���� ������
        round(1234.5678,1), -- �Ҽ��� ù��° �ڸ����� ��Ÿ�ش޶�� ��. 6���� �ݿø��� �� / ����� : 1234.6 
        round(1234.5678,2), -- �Ҽ��� �ι�° �ڸ����� ��Ÿ���޶�� ��. 7���� �ݿø� �� / ����� : 1234.57
        round(1234.5678,-1), -- -1�� �� �ڸ����� �ݿø� �϶�� ��. ������ �������� �ݿø� �Ѵ�. / ����� : 1230
        round(1234.5678,-2) -- / ����� : 1200
from dual;

select 
        trunc(1234.5678), -- 
        trunc(1234.5678,0), -- 
        trunc(1234.5678,1), -- 
        trunc(1234.5678,2), -- 
        trunc(1234.5678,-1), -- �����κп������� ���� ������� ��. ����� : 1230
        trunc(1234.5678,-2) -- 
from dual;

select 
        ceil(3.14), -- �ڽ�(3.14)���� ū ���� ����� ���� 
        floor(3.14), -- �ڽź��� ���� ���� ����� ����
        ceil(-3.14),
        floor(-3.14)
from dual;

select mod(5,2), mod(10,4) -- 5�� 2�� �������� ��, 10�� 4�� �������� �� ������ �� 
from dual;

select *
from emp
where mod(empno,2) = 1; -- Ȧ���� ��� ���ϱ�.

--2022.10.19
--��¥�Լ�
--���ó�¥ ���ϱ�
select sysdate-1, sysdate, sysdate+1
from dual;

select sysdate - hiredate as �ٹ��ϼ� --�ϼ��� ��ȯ�Ѵ�.
from emp;

--�ټӳ�� + �Ҽ��� ������
select trunc((sysdate - hiredate) / (365)) as �ٹ��ϼ�
from emp;

--ROUND�Լ��� ����Ͽ� ��¥ ������ ����ϱ� 2022.10.19
select  sysdate,
            round(sysdate, 'cc') as format_cc,
            round(sysdate, 'yyyy') as foramt_yyyy,
            round(sysdate, 'q') as format_q, -- 11�� 15���� �ȳѾ��� ������..
            round(sysdate, 'ddd') as format_ddd,
            round(sysdate, 'hh') as format_hh
from DUAL;       

select  sysdate,
            trunc(sysdate, 'cc') as format_cc,
            trunc(sysdate, 'yyyy') as foramt_yyyy,
            trunc(sysdate, 'q') as format_q,
            trunc(sysdate, 'ddd') as format_ddd,
            trunc(sysdate, 'hh') as format_hh
from DUAL;       

--�ڷ�����ȯ �Լ�
-- to_char() ����, �Ǵ� ��¥ �����͸� ���� �����ͷ� ��ȯ
-- to_number()
-- to_date()

--��¥�� ���ڷ�
select sysdate, to_char(sysdate,'YYYY/MM/DD HH24:MI:SS') as ���糯¥�ð�
from dual;

select hiredate, to_char(hiredate,'YYYY/MM/DD HH24:MI:SS:DAY')  as �Ի翬���Ͻð�����
from emp;

--���ڸ� ���ڷ�
select to_char(123456, 'L999,999')
from dual;

select sal, to_char(sal, 'L9,999')
from emp;

--���ڸ� ���ڷ�
--to_number()
--������ �ݵ�� ���ڿ� ���ڷ� �Ǿ��־�� �Ѵ�.
select '20,000' - '5,000' -- to_number() ����ȯ�� �ؾ��Ѵ�.
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;


--���ڸ� ��¥��
--to_date()
--���ڰ� �� ��¥ �������� �Ǿ��־�� �Ѵ�.
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101', 'YYYY/MM/DD');

--null������ ó��
--nvl(null(�÷���),�ٲٰ����������)
--nvl�� null �������� Ÿ�԰� ���� Ÿ������ �����ؾ��Ѵ�.
--��) nvl(����,����) nvl(����,����)
SELECT ename as �����, sal, sal * 12 + nvl(comm,0) as ���� , comm
from emp;

select *
from emp
where mgr is null;
                            --���ڸ� ���ڷ� �ٲ��ش�.
select ename,job,nvl(to_char(mgr,'9999'),'CEO') as mgr
from emp
where mgr is null;

select comm, nvl2(comm,'O','X')
FROM EMP;


--���ǹ� ǥ���ϴ� �Լ�
--decode() -> swhich
--case       -> if

select ename, job, deptno,
                decode(deptno, 10,'AAA','20','BBB','30','CCC','��Ÿ') AS �μ��� --deptno�� 10�� ����� AAA �μ�, 20�� ����� BBB�� 30�� ����� CCC 
from emp;


--������ �������� ���� �� �� �ִ�.
--case
--        when ���ǽ� then ���๮(����1�� ��� ���� true�� �� ��ȯ�� ���)
--        when ���ǽ�2 then ���๮2(����2�� ��� ���� true�� �� ��ȯ�� ���)
--        when ���ǽ�3 then ���๮3(����3�� ��� ���� true�� �� ��ȯ�� ���)
--        else ���๮(�� ���ǰ� ��ġ�ϴ� ��찡 ���� �� ��ȯ�� ���)
--end as ��Ī
select ename, job, deptno,
                case
                    when deptno = 10 then 'AAA'
                    when deptno = 20 then 'BBB'
                    when deptno = 30 then 'CCC'
                    else '��Ÿ'
                end as �μ���
from emp;

select ename,job,sal,
                case 
                    when sal between 3000 and 5000 then '�ӿ�'
                    when sal >= 2000 and sal < 3000 then '������'
                    when sal >= 500 and sal <2000 then '���'
                else '��Ÿ'
                end as ����
from emp;



--1
select empno,rpad(substr(empno,1,2),4,'*')as masking_empno, ename,rpad(substr(ename,1,1),length(ename),'*')as masking_ename
from emp
where length(ename) >= 5
and length(ename) <6;

--2
select empno, ename, sal, trunc((sal/21.5),1)as day_pay, round((sal/21.5/8),1) as time_pay
from emp;

--3

select empno, ename, mgr,
                case
                    when mgr is null then '0000'
                    when substr(mgr,1,2) = '75' then '5555'
                    when substr(mgr,1,2) = '76' then '6666'
                    when substr(mgr,1,2) = '77' then '7777'
                    when substr(mgr,1,2) = '78' then '8888'
                    else to_char(mgr)
                    end as CHG_MGR
from  emp;

--�������Լ�
-- sum(), avg(), max(), min(), count() �� Ư¡
--�Ϲ��÷��� ���� ��� �Ұ� ��)select max(sal), min(sal) 
--ũ��񱳰� �����ϱ� ������ ��� Ÿ�Կ� ��� ����


select sum(sal) -- ������� �޿� ����
from emp;

select avg(sal) -- ������� �޿� ���
from emp;

select count(*), count(comm) -- ��ü ���ڵ��� ����
from emp;

select max(sal), min(sal) -- ����
from emp;

select ename, max(sal) -- ���� ename�� 14�� max�� 1�̱� ������.
from emp;

select min(hiredate), max(hiredate)
from emp
where deptno = 10;

-- select �÷���
-- from ���̺��
-- while ���ǽ� (�׷��Լ� ���Ұ�/group by, hiving ���� ���� �����Ѵ�.)
-- group by �����÷���
-- having (group by �� ���� ���ǽ�)
-- order by �÷��� ���Ĺ�� > order by�� �ݵ�� �� �������� �ۼ��Ѵ�.

select avg(sal), '10' AS DEPTNO  from emp where deptno = 10
UNION ALL
select avg(sal), '20' AS DEPTNO from emp where deptno = 20
UNION ALL
select avg(sal), '30' AS DEPTNO from emp where deptno = 30;

select avg(sal), deptno
from emp
GROUP BY deptno
order by deptno;

select deptno, job, avg(sal)
from emp
group by deptno,job -- �μ��� �� �� ����, �������� �ѹ� �� ���´�. 
order by deptno, job;

--�޿��� ���� ���
select deptno, avg(sal)
from emp
GROUP BY deptno
having avg(sal) > 2000; -- having > group by�� ���ؼ� ��ȸ�� ����� ������ �ش�.
                                       -- ���ǽ��� �ۼ��� ��, �׷��Լ��� ����Ѵ�.
                                       
--where����  group by , having ���� ���� ��� where���� ���� ���� ����Ǳ� ������ ���� �޶�����.
SELECT deptno, avg(sal)
from emp
--where deptno !=10
group by deptno
having avg(sal) >= 2000;


-- 2022.10.20

--����(Join)
--2�� �̻��� ���̺��� �����͸� ��ȸ
-- from���� 2�� �̻��� ���̺��� �ۼ��Ѵ�.
-- where���� ���� ������ �ۼ��ؾ� �Ѵ�.
-- cross join (where�� ���� ����) �� ��� ���ϱ� ������ ���丸 �˾Ƶ� ��
-- equi join (where �������(=)�� ����Ѵ�.) �ڰ��� ���� ���δ�
-- non eaui join (where ���������� : and, or)
-- self join (where �ϳ��� ���̺��� ����Ѵ�.)
-- out join (where�� �����Ǵ� �����͸� ���� ��ȸ�Ϸ��� �� �� (+)�� ����Ѵ�.)

-- equi join ��)
select ename,job,e.deptno,dname,loc -- ���ʿ� �Ȱ��� �̸��� �÷��� ���� ���, ��� ���̺��� ������ ������ ���� ����� �Ѵ�. 
from emp e, dept d -- ���̺� ��Ī�� �ִ� ���.
where e.deptno = d.deptno -- �������(=)�� ���� �÷��� ã�� �� ���� �ϳ��ϳ� �� ��, ���� ���� ������ ������ �ҷ��´�.
order by deptno;


select ename,job,e.deptno,sal,dname,loc
from emp e, dept d 
where e.deptno = d.deptno
and sal >= 3000 -- ���� �����ڵ� ��� �����ϴ�.
order by deptno;

-- non equi join ��)
--����� �޿��� ������ �������� �˾ƺ���
select ename, sal, grade, losal, hisal
from emp e, salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal <=s.hisal; -- �� where���ε� ��� ���������� ���� where���� �� ������. �ڵ尡 �����ϱ� �����̴�.

--����� ���, �̸�, �޿�, �μ���ȣ, �μ���, �޿� ���
select empno, ename, sal, d.deptno, dname, grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal; 

-- self join
-- �� ���̺� �ִ� ����� ���, �̸�, ����� ���, ����� �̸��� �ѹ��� ��ȸ�ϱ�
select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m -- ���� ���̺�� ��ȸ�ϴ� ���̱� ������ �ݵ�� ��Ī�� �ο��ؾ� �Ѵ�.
where e.mgr = m.empno;

--scott�� ���� �μ��� �ٹ��ϴ� ����� ��ȸ�ϱ�
select work.ename, friend.ename
from emp work, emp friend
where work.deptno = friend.deptno
and work.ename = 'SCOTT'
and friend.ename != 'SCOTT';

--�ܺ�����
--��� �����Ǵ� �����͸� ���� ��ȸ�ϱ� ���ؼ� ����Ѵ�.
select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m
where e.mgr = m.empno(+); -- (+) �ƿ� ������ ǥ�����. �����Ͱ� ���� ���̺��ʿ� (+)�� ���δ�.

select ename, sal, d.deptno, dname
from emp e, dept d
where e.deptno(+) = d.deptno;

--ANSI-JOIN(ǥ������ ���)
--cross join
--inner join ( equi, non equi, self )
--outer join ( (+) ) - left, rigth , full(������ ������ ��θ� ��ȸ���ش�.) outer join
--nature join
select ename, sal, dname, loc
from emp e INNER JOIN dept d
on e.deptno = d.deptno;

select ename, sal, dname, loc
from emp e INNER JOIN dept d
using(deptno) -- ���� ���̺��� �÷����� �����ϴٴ� �����Ͽ��� �����ϴ�.
where ename = 'SCOTT';

select e.empno, e.ename, e.mgr, m.ename
from emp e inner join emp m
on e.mgr = m.empno;

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.mgr, m.ename
from emp e left outer join emp m -- outer join ->�����Ͱ� �ִ� ���� �������ָ� ��.
on e.mgr = m.empno;

select empno,ename,sal,d.deptno,dname,grade
from emp e inner join dept d
on e.deptno = d.deptno 
inner join salgrade s
on e.sal BETWEEN s.losal and s.hisal;

select ename, sal, d.deptno, dname
from emp e, dept d
where e.deptno(+) = d.deptno;

select ename, sal,d.deptno, dname
from emp e right outer join dept d
on e.deptno = d.deptno;

--1��

select d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e inner join dept d
on e.deptno = d.deptno --�������(=)�� ���� �÷��� ã�� �� ���� �ϳ��ϳ� �� ��, ���� ���� ������ ������ �ҷ��´�.
where e.sal > 2000;

-- 2��
select 
    e.deptno, 
    d.dname, 
    trunc(avg(sal)),
    max(sal) as mas_sal, 
    min(sal) as min_sal,
    count(*) as cnt
from emp e inner join dept d 
on e.deptno = d.deptno 
--using(deptno) -- ��Ī ���� ������ ���ѵȴ�.
group by e.deptno, d.dname;

--3��
select d.deptno, d.dname, e.empno, e.ename,e.job,e.sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno, e.ename;

--4��
select d.deptno, d.dname,
          e.empno, e.ename, e.mgr, e.sal, e.deptno,
          s.losal, s.hisal, s.grade,
          m.empno, m.ename
from emp e right outer join dept d
on e.deptno = d.deptno -- �ΰ��� ���Ѵٴ� ��
full outer join salgrade s
on e.sal between s.losal and s.hisal
left outer join emp m
on e.mgr = m.empno
order by d.deptno, e.empno;

--���� ����
--���� �ȿ� ������ �� ���� ��.
--select ������ ��ø�ؼ� ����ϴ� ��.
--select (select) �Ϲ� ��������
--from (select) �ζ��κ�
--where (select)  ��������
--select, from , where ��� ��ø ���������� ���� where���� ����ϴ� �� ����������� �Ѵ�.

select ename, max(sal)
from emp;

--�޿��� ���� ���� �޴� ����� �̸��� �޿� ���ϱ�. 
select ename, sal
from emp
where sal = (
                        select max(sal)
                        from emp
                        );

--���� > scott�̶�� ����� �ٹ��� �μ����� ��ȸ�ϰ� �ʹ�.
select deptno
from emp
where ename = 'SCOTT'; -- �̷��� �ϸ� SCOTT�� �μ���ȣ�� �� �� �ִ�.

select dname
from dept
where deptno = 20; 

select dname
from dept --�μ����� �˰� �����ϱ� dept
where deptno = ( 
            select deptno
            from emp
            where ename = 'SCOTT'
            );
            
--���� > �������� �ٹ��ϰ� �ִ� ����� �̸�, �μ���ȣ�� ��ȸ�ϰ� �ʹ�.
select ename, deptno
from emp
where deptno = (
                            select deptno
                            from dept
                            where loc = 'DALLAS'
                            );
                            
--���� > �ڽ��� ���ӻ���� KING�� ����� �̸��� �޿��� ��ȸ�ϼ���. (��������������)
select ename, sal, mgr
from emp
where mgr = (
                        select empno
                        from emp
                        where ename = 'KING' 
                        );
                        
                        
--������ �������� : =, !=, >, < ...
--������ �������� : any ... 
--in : ��� �߿� �ϳ��� �����ϸ� �ȴ�
-- > any : ��� �߿� ���� ���� �� ���� ũ�� �ȴ�
-- > all : ��� �߿� ���� ū ������ ũ�� �ȴ�
select *
from emp
where sal in ( 
                        select max(sal)
                        from emp
                        group by deptno
                        );
                        
select *
from emp
where sal > any ( -- > ���� ���� ������ ũ�� ��ȸ�� �ȴ�. < ���� ū ������  ���� ���� ��ȸ�� �ȴ�.
                        select max(sal)
                        from emp
                        group by deptno
                        );
                        
select *
from emp
where sal > all ( 
                        select sal
                        from emp
                        where deptno = 30
                        );

--���߿� ��������
select *
from emp
where (deptno,sal) in (
                                        select deptno, max(sal)
                                        from emp
                                        group by deptno
                                        );


-- 2022.10.21
-- DML(���������۾�) : ���̺��� �����͸� ����, ����, ���� 
-- ���� : insert , update, delete


-- insert : ���̺� �����͸� �����ϴ� ��.
-- insert into ���̺�� (�÷���1, �÷���2,...)
-- values(��1, ��2, ...)
-- ���÷��� ���� Ÿ�԰� ������ ��ġ�ؾ� �Ѵ�. (1 : 1)
-- ���ۼ� ������� 1:1 ��Ī �ȴ�.

create table dept_temp
as
select * from dept;

select *
from dept_temp;

--�űԷ� �����͸� �߰� �ϰ� ���� ��
insert into dept_temp (DEPTNO, DNAME, LOC)
values (50,'DATABASE','SEOUL');  --���� ���̺� ���� Ÿ���� �˾ƾ� �ϰ�, insert into�� values�� ������ ������ ���ƾ� �ϰ�, ���ڿ��� ���� ��� ' ' �ʼ����

INSERT INTO dept_temp -- �÷������� �ϸ� �� ���̺� �ִ� ��� ���� �߰� ������ �ϰڴٴ� ��
values (70,'HTML','SEOUL');

--�ΰ����� ������ �߰��ϰ� ���� ��
INSERT INTO dept_temp(DEPTNO, DNAME) --(������ NULL������ ����)
values (60,'JSP');
-- �̷��� �� ���, LOC�� NULL�����Ͱ� �ڵ����� ���Եȴ�.

insert into dept_temp -- �÷������� �ϰ� ���� ������ �ְ� ������ NULL �����͸� ������ �ȴ�. (����� NULL������ ����)
values (80,NULL,'SEOUL');


-- ��¥������ �ٷ��
create table emp_temp
as
select * from emp
where 1 != 1; -- �����ʹ� ���ְ� �÷� ������ ����� �����.

select *
from emp_temp; -- ��� : ���� �ϳ��� ����, �÷��� ����

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (9999,'ȫ�浿','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (3111,'��û��','MANAGER',9999,SYSDATE,4000,NULL,30);
--���� ��¥�� �ڵ����� �����Ͱ� ���Եȴ�.


-- update : �÷��� �����͸� ����(����) 
-- update ���̺��
-- set ���� �ٲ��ְ� ���� �÷��� = �ٲ� �� (�ּ� 1�� �̻�)
-- where �ʿ信 ���� ���ǽ� ��� �����ϳ� ���ǽ��� ���� �ʼ���.
-- �������� ������� ������ �ش� �÷��� ��� ����ȴ�.��

--������� ���̺��� ���� �ϰ� ���� ��.
drop table dept_temp2;

create table dept_temp2
as
select * from dept;

--update dept_temp2
--set loc = 'SEOUL';
--dept_temp2 �� ���̺��� ��� loc �÷��� �����͸� SEOUL�� �����Ѵ�.

update dept_temp2
set dname = 'DATABASE', loc = 'SEOUL'
where deptno = 40;
--deptno�� ���� 40�� ���� �μ��� �̸��� �ٹ����� �����Ѵ�.



-- delete (������ ����)
-- delete from ������ ���̺��
-- where ���ǽ�
-- �������� ������� ������ ��� �����Ͱ� �����ȴ�. ��

create table emp_temp2
as
select * from emp;

delete from emp_temp2
where ename = 'SCOTT';
--�̸��� SCOTT�� ����� �����Ѵ�.



-- TCL (Ʈ����� �������� ���� ����, ��� ��� ���õ� ��ɾ�)
-- commit , rollback, savepoint(���� ��������� ����)
-- commit : ������ ���� ���� (���̺��� �����͸� �ݿ�)
                    -- create������ ����ؼ� ��ü�� ������ �� �ڵ����� commit�ȴ�.
-- rollback : ������ ���� ���  (���̺��� ������ �̹ݿ�) ���󺹱�
                    -- õ������, ���Ⱑ �����ų�, ���� ���� ��쿡 �ڵ����� rollback�ȴ�.

create table dept01
as
select * from dept;

select *
from dept01;

delete from dept01; 

-- �۾��ϴ� �۾��ڿ��Ը� ������ �� ó�� ���� ��, ������ �ܺο��� �������� ���� ���� �ȵ� ���°� ������
-- �����͸� �����ϰ� �����Ϸ��� �ϸ� ���� �������� commit�� ����ؾ��Ѵ�. 

commit;

drop table dept_dept01; -- ���̺� �����ϴ� ���

create table dept_dept01
as
select * from dept;

--�����͸� �����ϴ� ������ delete ���� �ϳ��� �� ����.
delete from dept01; 
truncate table dept01; -- rollback ��� �Ұ��� ( �ڵ����� commit �߻�)
rollback; -- �����غ��� rollback �ȵ�.


-- DDL (���̺�(��簴ü)�� ����, ����, ���� �� �� ����Ѵ�.)
-- create(����), alter(����), drop(����)

--create table ���̺��( -- table(��ü)
--        �÷���1 Ÿ��,       -- column(�Ӽ�)
--        �÷���2 Ÿ��,
--        �÷���3 Ÿ��
--       );
        
-- ���� ���̺� ����� ���        
create table emp_ddl(
--  ���, �̸�, ��å, ������, �Ի���, �޿�, ������, �μ���ȣ
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date, --��¥�����͸� �޴� �÷��̱� ������ date
    sal number(7,2), -- ��ü�����δ� 7�ڸ��� ���ڸ� ���������, 2�ڸ��� �Ҽ������� ����ϰڴٴ� ��. �� 5�ڸ��� ����.
    comm number(7,2),
    deptno number(2)
);

insert into emp_ddl
values (9999,'�̼���','MANAGER',1111,SYSDATE,1000,NULL,10);

--������ �ִ� ���̺��� �����ϴ� ���(�׽�Ʈ�� �����ϰų�, ������ ������ ���� ��� ����ϱ� ���ؼ�)
create table dept_ddl
as
select * from dept;

--�μ��� 30���� ���̺��� ����� ���� ��
create table dept_30
as
select * from dept
where deptno = 30;

--dept�� dname,loc�� �����ͼ� ���̺��� ����� ���� ��
create table dept_m
as
select dname,loc
from dept;

--������ ������ ������ ����� ���� ��
create table dept_d
as
select * from dept
where 1 != 1; -- ���̺��� ������ �����ϰڴٴ� �ǹ�.


-- ������� ���̺��� �����ϱ� (�÷��� ���� ����)
-- 1. ���ο� �÷� �߰�(add), 2. �÷��� �̸� ����(rename column), 3. �ڷ����� ����(modify), 4. �÷��� ����(drop column)
-- alter    

--�������̺� �ϳ� �����
create table emp_alter
as
select * from emp;

--���̺��� �� ����������� Ȯ���ϴ� �۾�
select *
from emp_alter;

--���ο� �÷� �߰�
alter table emp_alter
    add address varchar2(100);
    
--�÷��� �̸� ����    
alter table emp_alter
    rename column address to addr;
    
--������ Ÿ��, ũ�� ����
alter table emp_alter
    modify empno number(10); -- ������ ũ�⺸�� �۰Դ� �ȵ����� ũ�Դ� �����ϴ�.

--�÷� ����    
alter table emp_alter
    drop column addr;

--���� ���̺� �����ϱ�
--drop table ���̺��
drop table emp_alter;    
    
--���̺��� ����� �����ƴ��� Ȯ���ϱ�    
select *
from emp_alter;

--����1��
create table emp_hw(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
    );
    
--����2��    
alter table emp_hw
    add bigo varchar2(20);

--����3��
alter table emp_hw
    modify bigo varchar2(30);
    
--����4��
alter table emp_hw
    rename column bigo to remark;

--����5��
insert into emp_hw
select empno, ename, job, mgr, hiredate, sal, comm, deptno,NULL
from emp;
    
--����6��    
drop table emp_hw;

--�����ͻ���
desc user_tables; 

-- ���� ����ڰ� ���� ����ϰ� �ִ� ���̺� ���� Ȯ���ϱ�
select table_name
from user_tables;

--���� ���� ���̺� ���� Ȯ���ϱ�
select table_name
from all_tables; 

--���� ���� ���̺��� ���� ���� Ȯ���ϱ�
select owner, table_name
from all_tables; 

--index(�˻��ӵ��� ����ϱ� ���� ����Ѵ�.) index�� ��ü�̴�.
--������ ���� create �����Ҷ��� drop 
--select ������ �˻� �ӵ��� ��� ��Ų��.
--��ü ���ڵ��� 3% ~ 5% �϶� �ӵ��� ������. 
--index��ü�� �÷��� �����ؼ� ����Ѵ�.

--create index �ε�����
--on ���̺� �̸�(
--                �÷���1 asc or desc
--                �÷���2 asc or desc
--                �÷���3 asc or desc
--                );
                
create table emp01
as
select * from emp;

insert into emp01
select * from emp;

drop table emp01;

create table emp01
as
select * from emp;

insert into emp01
select * from emp01; -- 917,504 ���� ���Եɶ������� �ϰ� ���߱�

insert into emp01(empno, ename)
values (1111,'bts');

--index ���� �� 0.029 ~ 0.04 ����
--index ���� �� 0.001��
select empno, ename
from emp01
where ename = 'bts';

--index ����
create index idx_emp01_ename
on emp01(ename);

--index ����
drop index idx_emp01_ename;

--���̺� ������ ���󺹱�
show recyclebin; --��ɾ� ������ ��, 
flashback table emp_alter
    to before drop;

--������ ���� ���
purge recyclebin;


--��������
--���̺��� ���� �� ����ϴ� ��
--���������� ���Ἲ�� �����ϱ� ���Ͽ� �����ϴ� ���̸�, ���Ἲ�̶� �߸��� ���� �����ͷ� ������ ���ϰ� �ϴ� ���̴�.
--not null - null�����͸� ������� �ʴ´�.
--unique - ������ ���� ������ ���� ������ �Ѵ�.
--primary key (�⺻Ű) - �����ϸ鼭�� null �����͸� ������� �ʴ´�.
--foreign key (�ܷ�Ű) - �ٸ� ���̺��� ���� �����Ͽ� �����ϴ� ���� ����Ѵ�.
-- 1. �θ�� �ڽ��� ���踦 ������ ���� ��,  �ڽ��� ���̺� �����Ѵ�.
-- 2. �θ��� ���̺��� �÷��� �ݵ�� primary key �Ǵ� unique �ؾ��Ѵ�.
-- 3. null�����͸� ����Ѵ�.
--check 
--default

-- emp, dept
insert into emp
values (1111,'aaa','MANAGER','9999',SYSDATE,1000,NULL,50);
--���� ���� -
--ORA-02291: ���Ἲ ��������(SCOTT.FK_DEPTNO)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�
--�������� �Էµ� �μ���ȣ�� 50�̱� �����̴�. dept�� �μ���ȣ���� 50�� ����.

drop table emp02; -- ���̺� ����

--not null(�ݵ�� null�� �ƴ� �����Ͱ� ���;� �Ѵ�.)
create table emp02(
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2)
    );

insert into emp02
values (null,null,'MANAGER',30);
--���� ���� -
--ORA-01400: NULL�� ("SCOTT"."EMP02"."EMPNO") �ȿ� ������ �� �����ϴ�

insert into emp02
values (1111,'ȫ�浿','MANAGER',30);

insert into emp02
values (1111,'�̼���','MANAGER',20);
--���� ȫ�浿�� �����ȣ�� �����ѵ��� ������ �� �ִٴ� ������ ����.

delete from emp02; -- ������ ����




--unique(������ ���� ������ ���� ������ �Ѵ�. NULL�� �ߺ����� ���ܵȴ�.)
create table emp02(
    empno number(4) not null unique,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2)
    );
    
insert into emp02
values (1111,'ȫ�浿','MANAGER',30);

insert into emp02
values (1111,'�̼���','MANAGER',20);
--���� ���� -
--ORA-00001: ���Ἲ ���� ����(SCOTT.SYS_C0011056)�� ����˴ϴ�

insert into emp02
values (null,'������','SALESMAN',20);
--���� ���� -
--ORA-01400: NULL�� ("SCOTT"."EMP02"."EMPNO") �ȿ� ������ �� �����ϴ�


--primary key(�⺻Ű - ������ ���� ������ ���̸鼭 �ߺ��� �� ���� ��. ���̺� �ϳ��� ���� �����ϴ�.)
create table emp02(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2)
    );
    
insert into emp02
values (1111,'ȫ�浿','MANAGER',30);

insert into emp02
values (2222,'ȫ�浿','MANAGER',30);

insert into emp02
values (null,'������','SALESMAN',20);
--���� ���� -
--ORA-01400: NULL�� ("SCOTT"."EMP02"."EMPNO") �ȿ� ������ �� �����ϴ�

insert into emp02
values (2222,'������','SALESMAN',10);
--���� ���� -
--ORA-00001: ���Ἲ ���� ����(SCOTT.SYS_C0011061)�� ����˴ϴ�


--�������Ǹ� �ۼ��ϱ� (constraint ���̺��_�÷���_��� ��������)
create table emp02(
    empno number(4) constraint emp02_empno_pk  primary key,
    ename varchar2(10) constraint emp02_empno_nn not null,
    job varchar2(9),
    deptno number(2)
    );
        
insert into emp02
values (1111,'ȫ�浿','MANAGER',30);

insert into emp02
values (2222,'ȫ�浿','MANAGER',30);

insert into emp02 
values (null,'������','SALESMAN',20);
--���� ���� -
--ORA-01400: NULL�� ("SCOTT"."EMP02"."EMPNO") �ȿ� ������ �� �����ϴ�

insert into emp02
values (2222,'������','SALESMAN',10);
--���� ���� -
--ORA-00001: ���Ἲ ���� ����(SCOTT.EMP02_EMPNO_PK)�� ����˴ϴ�



--2022.10.24
--foreign key (����Ű) - �ڽ����̺� fk ����
create table emp03(
    empno number(4) constraint emp03_empno_pk  primary key ,
    ename varchar2(10) constraint emp03_ename_nn not null ,
    job varchar2(9),
    deptno number(2) constraint emp03_deptno_fk references dept03(deptno)
    );
    
create table dept03(
    deptno number(2) constraint dept03_deptno_pk primary key, -- �θ��ʿ� �ݵ�� �����̸Ӹ� Ű ������ �ؾ��Ѵ�.
    dname varchar2(20) constraint dept03_dname_nn not null,
    loc varchar2(20) constraint dept03_loc_nn not null
    );

-- ������������ ����� ������ ����
-- �� �θ����̺���� ������ ������ ����� �Ѵ�.
insert into dept03 
select * from dept;

insert into emp03
select empno, ename, job, deptno from emp;

insert into emp03
values (1111,'aaa','MANAGER',50);

--check 
create table emp04(
    empno number(4) primary key,
    ename varchar2(10) not null,
    sal number(7) constraint emp03_sal_ck check(sal between 500 and 5000),
    gender varchar2(2) constraint emp03_gender_ck check (gender in('M','F'))
);

select * from emp04;

insert into emp04
values (1111,'HONG',1000,'F');

insert into emp04
values (2222,'HONG',200,'M');
-- ORA-02290: üũ ��������(SCOTT.EMP03_SAL_CK)�� ����Ǿ����ϴ�

insert into emp04
values (3333,'HONG',2000,'E');
--ORA-02290: üũ ��������(SCOTT.EMP03_GENDER_CK)�� ����Ǿ����ϴ�

--default
create table dept04(
    deptno number(2) primary key,
    dname varchar2(10) not null,
    loc varchar2(15) default 'SEOUL'
);

insert into dept04 (deptno, dname)
values (10, 'SALES');

insert into dept04 (deptno, dname, loc)
values (20, 'SALES','BUSAN'); -- �⺻���� ����������, ���� ���� �����Ͽ� �����͸� �־��ָ� �־��� �����ͷ� ����� �ȴ�.

select * from dept04;

--�������� �������
--�÷� ������ ���� (������ �ؿԴ� ����� �÷� ������ ����)
--���̺� ������ ����

--���̺� ������ ���� ��� ( not null �� ���̺� ���� ���������� �Ұ����ϸ�, �÷� ���������� �����ϴ�.)
--�÷��� �� �����ϰ� ���� , ���� �� �Ʒ��� ���������� ���δ�.
create table emp05(
    empno number(4),
    ename varchar2(20) constraint emp05_ename_nn not null,
    job varchar2(20),
    deptno number(20),
    
    constraint emp05_empno_pk primary key(empno),
    constraint emp05_job_uk unique(job),
    constraint emp05_deptno_fk foreign key(deptno) references dept(deptno)
);

insert into emp05
values (1111,'SASA','SALESMAN',80);
--ORA-02291: ���Ἲ ��������(SCOTT.EMP05_DEPTNO_FK)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�


-- ����Ű(�⺻Ű�� �ΰ��� �÷��� ����ϴ� ���)
-- ���̺� ���� ������θ� ���� ����
--1. ���̺�ȿ��� �����ϴ� ���
--2. alter ��ɾ� ����ϴ� ��� ( ���������� ���� ���� ���¿��� ���̺��� ���� �� ���Ŀ� �߰��ؾ� �� �� )

create table member(
    name varchar2(10),
    address varchar2(30),
    hphone varchar(10),
    
    constraint member_name_address_pk primary key(name, address), -- ����Ű�� ���´�. 
    constraint member_hphone_uk unique(hphone)
);

create table emp06(
    empno number(4),
    ename varchar2(20),
    job varchar2(20),
    deptno number(20)
);

alter table emp06
add constraint emp06_empno_pk primary key (empno);

alter table emp06
add constraint emp06_deptno_fk foreign key(deptno) references dept(deptno);

-- not null�� ������ �������� ����Ѵ�.( null -> not null )
alter table emp06
modify job constraint emp06_job_nn not null;

alter table emp06
modify ename constraint emp06_ename_nn not null;

-- �������� �����ϴ� ���
-- �������Ǹ�(constraint �ڿ� �ִ� ���Ǹ�) �Ǵ� ��������(pk,fk,nn) �ΰ��� ����� ������ �������Ǹ��� ����ϴ°� Ȯ���ϴ�.
alter table emp06
drop constraint emp06_empno_pk;

--�����ߴ� �������� �ٽ� �ο��ϱ�
alter table emp06
add constraint emp06_empno_pk primary key (empno);


create table emp07(
    empno number(4),
    ename varchar2(20),
    job varchar2(20),
    deptno number(20)
);

alter table emp07
add constraint emp07_empno_pk primary key (empno);

alter table emp07
add constraint emp07_deptno_fk foreign key(deptno) references dept07(deptno);

create table dept07(
    deptno number(2),
    dname varchar2(10),
    loc varchar2(15)
);

alter table dept07
add constraint dept07_deptno_pk primary key (deptno);

insert into dept07
select * from dept;

insert into emp07
select empno, ename, job, deptno  from emp;

-- �θ��� ������ �����ϱ�
delete from dept07
where deptno = 10;
-- ORA-02292: ���Ἲ ��������(SCOTT.EMP07_DEPTNO_FK)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
-- �ڽ��� �����ϰ� �ֱ� ������ �����͸� ���� �� ����.
-- ���� ������� �������� �Ѵٸ� ��Ȱ��ȭ�� ����Ѵ�.

--��Ȱ��ȭ �ϴ� ���
alter table dept07
disable primary key cascade;

--�������� ���� ����
alter table dept07
drop primary key cascade;


--��������
create table dept_const(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13)
);

alter table dept_const
add constraint deptconst_deptno_pk primary key(deptno);

alter table dept_const
add constraint deptconst_dname_unq unique(dname);

alter table dept_const
modify loc constraint deptconst_loc_nn not null;


create table emp_const(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    tel varchar2(20),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);

alter table emp_const
add constraint empconst_empno_pk primary key(empno);

alter table emp_const
modify ename constraint empconst_ename_nn not null;

alter table emp_const
add constraint empconst_tel_unq unique(tel);

alter table emp_const
add constraint empconst_sal_ck check(sal between 1000 and 9999);

alter table emp_const
add constraint empconst_deptno_fk foreign key(deptno) references dept_const(deptno);

insert into emp_const
values (1111,'HONG','MANAGER','010-1111-1111',SYSDATE,100,1000,10);




-- ��
-- ��ü : table, index, view 
-- create or replace view �����̺��̸� [(alias��Ī)]
-- as 
-- ��������(select)
-- [with check option]
-- [with read only]
-- alias, with check option, with read only �� ����. �������� �ʼ�

-- ���Ϻ�
-- �������̺� ���� 
create table dept_copy
as
select * from dept;

create table emp_copy -- ����Ǵ� ���̺��� ���������� �� �Ѿ�´�.
as
select * from emp;

-- �������̺��̱� ������ �������� ���� ����� �ֱ�
alter table emp_copy
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);



--view ���̺� ����
create or replace view emp_view30 -- 30�� �μ����Ը� ������ ���̺�
as
select empno, ename, sal, deptno 
from emp_copy
where deptno = 30;

-- ���̺� ��ȸ�ϴ� ���
select * from emp_view30;

insert into emp_view30
values (1111,'HONG',1000,30); -- emp_view30 �� ������ �����ϴ°� �ƴϰ�, emp_copy(��������)�� �����Ͱ� �����Ǿ����ִ�.

insert into emp_view30(empno,ename,sal)
values (2222,'HONG',2000); --foreign key�� null�����͸� ����ϱ� ������ emp_copy�� ������ ������.
-- �μ���ȣ�� null�̱� ������ �� ���̺� ��ȸ�� �ϸ� �������� ����.

insert into emp_view30
values (3333,'HONG',2000,50);
--ORA-02291: ���Ἲ ��������(SCOTT.EMP_COPY_DEPTNO_FK)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�
--�������̺� �����Ͱ� ���� ���̱� �����̴�.

select * from emp_copy;

create or replace view emp_view(�����ȣ,�����,�޿�,�μ���ȣ)
as
select empno, ename, sal, deptno
from emp_copy;
--�����ȣ��  empno, ������ ename... �̷������� 1:1 ��Ī�Ǹ� ���� ����ϴ� empno... �� ��� �Ұ���

select * from emp_view; -- �÷��̸��� �ѱ۷� �Ǿ�����.

select * 
from emp_view
where �μ���ȣ = 30;


-- ���պ�
create or replace view emp_dept_view
as
select empno, ename, sal, e.deptno, d.dname, d.loc
from emp_copy e inner join dept_copy d
on e.deptno = d.deptno
order by empno desc;

select * from emp_dept_view;

-- �μ��� �ּұ޿��� �ִ�޿��� ���ض�.(view)
-- dname, min_sal, max_sal 

create or replace view sal_view
as
select dname, min(sal) as min_sal, max(sal) as max_sal
from emp_copy e inner join dept_copy d
on e.deptno = d.deptno
group by d.dname;

select * from sal_view;

drop view sal_view; --�� ����


-- 2022.10.25
-- ��� ��ü�� �̸��� �ߺ��� �� ����. �����ؾ� ��.
-- �׷���, �̹� �並 ����� ���� ������ �߰��ϰ� �Ͱų�, ����� ������ ���� ��쿡�� or replace�� �ֱ� ������ �����ϴ�. (�����)
create or replace view sal_view
as
select dname, min(sal) as min_sal, max(sal) as max_sal, avg(sal) as avg
from emp_copy e inner join dept_copy d
on e.deptno = d.deptno
group by d.dname;


-- [with check option]
--���� ���� �������� �÷��� ����, ���� ���� ���ϰ� �ϴ� ��. 
create or replace view view_chk30 -- 30�� �μ��� �� �� �ִ� ��
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30 with check option; 

update view_chk30 -- ���� �̷��� 10������ �����ع�����, ���� �����̺��� �������� �ʰ� �ȴ�.
set deptno = 10;
--ORA-01402: ���� WITH CHECK OPTION�� ���ǿ� ���� �˴ϴ�. ( with check option ������ ���� �߻�)



-- [with read only]
-- ��� �÷��� ���� c, u, d �� �Ұ��ϴ�. ������ r(������ ��ȸ)�� ������.
create or replace view view_read30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30 with read only;

update view_read30
set deptno = 10;
--�б� ���� �信���� DML �۾��� ������ �� �����ϴ�.(insert, update, delete)


-- ���� Ȱ��
-- TOP - N ��ȸ�ϱ�
select * from emp
order by hiredate asc;

-- �Ի����� ���� ���� 5���� ����� ��ȸ 
select * from emp
order by hiredate asc;

select * from emp
where hiredate <= '81/05/01';

desc emp;

select rownum,empno,ename,hiredate
from emp
where rownum <=5;

select rownum,empno,ename,hiredate
from emp
where rownum <= 5
order by hiredate asc;
-- ���� �� ���� ����� �̿��ص� �Ի����� ���� ���� 5���� ��ȸ�ϱ�� �����.



create or replace view view_hiredate
as
select empno,ename,hiredate
from emp
order by hiredate asc;

select * from view_hiredate;

select rownum,empno, ename, hiredate
from view_hiredate
where rownum <=7;

-- �Ի����� 2��°���� 5��°�� ����� ��ȸ�ϱ�
select rownum,empno, ename, hiredate
from view_hiredate
where rownum between 2 and 5 ; --rownum�� �������� ���� ���� �ݵ�� 1�� �����ϴ� ���ǽ��� ������ �Ѵ�. �׷��� �ƹ��͵� �ȶ�

create or replace view view_hiredate_rm
as
select rownum rm,empno, ename, hiredate -- rownum�� ��Ī�� ���� ���Ӱ� �����̺� ������ �Ѵ�.
from view_hiredate;

select rm,empno,ename,hiredate
from view_hiredate_rm
where rm between 2 and 5;

-- �ζ��κ� (���� �Խ��� ���鶧 �� ������ ����ؼ� �Խñ��� �������� ������� ����Ѵ�.)
select rm,b.*
from (select rownum rm,a.*
            from (select empno,ename,hiredate
                          from emp
                             order by hiredate asc) a
            ) b
where rm between 2 and 5;

--�ζ��κ����·� �����, �Ի����� ���� ���� 5���� ��ȸ
select rownum, empno,ename,hiredate
from (select empno,ename,hiredate
                 from emp
                       order by hiredate asc)a
where rownum <= 5;


--������
--�ڵ����� ��ȣ�� ������Ű�� ����� �����Ѵ�.
--create, drop���� ó���Ѵ�.
--nextval, currval

--create sequence ��������
--start with ���۰� -> 1
--increment by ����ġ -> 1
--max value �ִ밪 -> 10�� 1027
--min value �ִ밪 -> 10�� -1027
--�ɼ��� ������ �������.


--������ �����ϱ�
create sequence dept_deptno_seq
increment by 10
start with 10;

--������ ������ ��ȸ�ϱ�
select dept_deptno_seq.nextval
from dual;
--�ѹ� �� ��ȸ�ϸ� 10���� 20���� ����Ǿ�����.
--�ѹ� �����ϸ� �� �ȵ�. �����ϱ⸸ ��.

--���簪�� Ȯ���ϴ� �뵵
select dept_deptno_seq.currval
from dual;

drop sequence dept_deptno_seq;

-- ���ο� ������ ����
create sequence emp_seq
increment by 1
start with 1
maxvalue 1000;

--������ �ִ� emp01���̺� ����
drop table emp01;

--�����ʹ� ���� �÷��� �ִ� ���̺� ����
create table emp01
as
select empno, ename, hiredate
from emp
where 1 <> 1;

insert into emp01
values (emp_seq.nextval, 'HONG',SYSDATE);
-- 2���� ���µ� ����Ŭ ���׶� �������� ���� �� 0 ���� ������ 1���� �������� ���� �ȴ�.



create table product(
    pid varchar2(10),
    pname varchar2(10),
    price number(5),
    
    constraint product_pid_pk primary key(pid)
);


--1000�������� �����ϴ� ������ ����
create sequence idx_product_id
start with 1000;

--�������� ���ڿ��� ����
insert into product(pid, pname, price)
values ('pid' || idx_product_id.nextval, 'ġ��',1000);

select * from product;

drop sequence idx_product_id;

---------------------------------------------------------------

--user01���� ��ü �����ֱ�
--grant ��ü��������
--on ��ü��
--to ������

grant select
on emp
to user01;

--��ü ���� ȸ���ϱ�
revoke select
on emp
from user01;

---------------------------------------------------------------

grant select
on emp
to user04;

--��ü ���� �ο�
grant select
on emp
to mrole3;





