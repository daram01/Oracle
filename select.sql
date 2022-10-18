--DQL(질의어) 테이블에 들어있는 데이터를 조회할 때 사용
--select 컬럼명
--from 사용하고 싶은 테이블명

--전체데이터
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

select * --별표로 전체데이터를 조회할 수 있다.
from emp;

--부분컬럼데이터
select empno,ename,sal
from emp;

select deptno
from emp;

--중복데이터를 삭제하는 distinct
select DISTINCT(deptno)
from emp;

 select distinct(job)
 from emp;

-- 데이터를 활용해 연봉 구하기
-- 연봉과 성과금을 합친 금액 구하기
-- +, -, *, / 연산자가 있음. 나머지(%) 연산자는 없음.
-- 컬럼을 대상으로 연산한다.
-- null 값은 연산 불가하다. null값에 연산을 하면 모두 null이 된다.
-- nvl(comm,0) -> comm이 null일 경우 0 으로 대체한다. 라는 뜻
-- 컬럼의 이름이 어렵거나 알아볼 수 없을 때 별칭을 사용한다. ( 컬럼명 as 별칭 )
SELECT ename as 사원명, sal, sal * 12 + nvl(comm,0) as 연봉 , comm
from emp;

-- 2022.10.18

--데이터 정렬
--select 컬럼명
--from 테이블명
--order by 컬럼명 (정렬기준이 되는 값) asc(오름차순, 작은값 -> 큰값) / desc(내림차순, 큰값 -> 작은값) 
--order by 만 쓰면 기본이 오름차순이기 때문에 asc를 적는 것은 생략 가능하다.
--숫자(1 ~ 10), 날짜(과거날짜 ~ 최근날짜), 문자(사전순서) -> 오름차순, 내림차순은 반대로 생각하면 됨

--연봉기준
select *
from emp
order by sal  desc;

--입사기준
select *
from emp
order by hiredate desc;

--조건검색
--select 컬럼명
--from 테이블명
--where 조건식(컬럼명 =(연산자) 제시한 값); <, >, =, != / <>, <=, >=, and, or 
--오라클에서 문자열 사용할때는 ' ' 사용한다.
--실제 테이블에 있는 문자값은 무조건 대소문자 구분해서 동일하게 적어야 한다.


SELECT *
FROM emp
where sal >= 3000; -- 급여가 3천 이상인 사원

SELECT *
FROM emp
where deptno = 30; -- 30 부서에 근무하는 사원 



--and -> 두가지 이상의 조건이 모두 참인 경우
SELECT *
FROM emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499; -- 부서번호가 30이고, 직업이 SALESMAN이며 사원번호가 7499인 사원

-- 문자를 조건절에 사용할 때 지켜야 하는 조건
-- 1. 대소문자 2. ' ' 
select *
from emp
where ename = 'FORD'; -- ford 라고 소문자라고 적으면 아무 결과도 나오지 않음. FORD라는 이름만 있기 때문이다.

--날짜를 조건절에 사용할 때
-- ' ' (날짜도 조건이 있음)
-- 년도 두자리 월 두자리 날짜 두자리, 즉 80/12/20만 나오지만 사실은 1980년 12월 20일 시간 분 초 요일 의 정보가 다 들어가있음. (축약형태)
select *
from emp
where hiredate < '1982/01/01'; -- 1982년 01월 01일 이전에 입사한 사원 조회

--or 두 개 이상의 조건중에 하나만 참인 경우
select *
from emp
where deptno = 10 or sal > 2000; -- 둘 중에 하나의 조건만 만족하는 사원

--not 논리 부정 연산자
select *
from emp
where sal != 3000;

select *
from emp
where not sal = 3000; -- 3000을 받지 않는 사원  

--and, or 범위 조건을 표현할 때도 사용
select *
from emp
where sal >= 1000 and sal <= 3000; -- 1000만원 이상 ~ 3000만원 이하 사이인 사원

select *
from emp
where sal <= 1000 or sal >= 3000; -- 1000만원 이하거나, 3000만원 이상인 사원

--and 를 대신해서 사용하는 조건식 between and
select *
from emp
where sal between 1000 and 3000; -- 1000만원 이상 ~ 3000만원 이하 사이인 사원

--or를 대신해서 사용하는 조건식 in
select *
from emp
where sal = 800 or sal = 3000 or sal = 5000; -- 800만원, 3000만원, 5000만원인 사원 

select *
from emp
where sal in (800, 3000, 5000); -- 800만원, 3000만원, 5000만원인 사원 

--like 연산자
--값의 일부만 가지고 데이터를 조회한다.
--와이드 카드를 사용한다 ( %, _ )
-- % -> 길이와 상관없이 모든 문자 데이터를 의미한다. 모든 문자를 대체한다.
-- _ -> 어떤 값이든 상관없이 한 개의 문자 데이터를 의미한다. 한 문자를 대체한다.
select *
from emp
where ename like 'F%'; -- 시작이 F로 시작하는 사원

select *
from emp
where ename like '%D'; -- 마지막이 D로 끝나는 사원

select *
from emp
where ename like '%O%'; -- 이름 중에 O가 포함되어 있는 사원

select *
from emp
where ename like '___D'; -- 이름 중에 반드시 4번째에 D가 있는 사원

select *
from emp
where ename like 'S___%'; -- 이름 첫 글자가 S이고, 뒤에 세글자가 오고 그 이후는 글자가 있든 없든 상관 없는 경우

--null 연산자
-- is null / is not null
select *
from emp
where comm = null; -- null은 비교 불가라서 에러.

select *
from emp
where comm is null; -- comm이 null인 것

select *
from emp
where comm is not null; -- comm이 null이 아닌 것

--집합연산자 ( 두개 이상의 테이블을 조회할 때 )
--두 개의 select 구문을 사용한다.
--컬럼의 갯수가 동일해야 한다.
--컬럼의 타입이 동일해야 한다.
--컬럼의 이름은 상관 없다.
--합집합(union), 교집합(INTERSECT), 차집합(minus)
select empno, ename, sal, deptno
from emp
where deptno = 10
union --(합집합을 표현하는 절)
select empno, ename, sal, deptno
from emp
where deptno = 20;

--중복되어질 경우 한 번만 조회 된다.
select empno, ename, sal, deptno
from emp
where deptno = 10
union --(합집합을 표현하는 절)
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename, sal, deptno
from emp
where deptno = 10
union all -- 중복되어도 다 조회 하고 싶을 때
select empno, ename, sal, deptno
from emp
where deptno = 10;

select empno, ename, sal, deptno
from emp
minus --차집합
select empno, ename, sal, deptno
from emp
where deptno = 10;

--부적절한 식별자라고 나올 때는 컬럼명이 오류임.

select empno, ename, sal, deptno
from emp
INTERSECT -- 교집합
select empno, ename, sal, deptno
from emp
where deptno = 10;

--where
--비교연산자, 논리연산자, like, is null / is not null, 집합연산자
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
--where deptno between 20 and 30 and sal > 2000; 내가 한 것

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
--where sal >= 2000 and sal <= 3000; 내가 한 것 

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

