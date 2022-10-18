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
