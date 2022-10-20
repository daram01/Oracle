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

-- 함수
-- 문자함수 : upper, lower, substr, instr, replace, lpad, rpad, concat
-- 숫자함수
-- 날짜함수


-- 문자함수
select 'Welcome', upper('Welcome')
from dual;

select lower(ename), upper(ename)
from emp;

select *
from emp
where lower(ename) = 'scott'; -- 괄호 안 문자 데이터를 모두 소문자로 변환하여 반환한다.

select ename, length(ename) -- 괄호 안 컬럼의 문자열 길이가 나옴 
from emp;

--         1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 양수
--       -17                                                    -1 음수
select 'Welcome to Oracle', substr('Welcome to Oracle', 2,3), substr('Welcome to Oracle', 10)
from dual; --가상테이블

select 'Welcome to Oracle', substr('Welcome to Oracle', -3,3), substr('Welcome to Oracle', -17)
from dual;

select instr('Welcome to Oracle','e')
from dual; 

select instr('Welcome to Oracle','e',3)
from dual; 

select instr('Welcome to Oracle','e',3,2) -- 시작은 3번째부터 하고, 두번째로 e가 나오는 위치
from dual; 

select 'Welcome to Oracle', replace('Welcome to Oracle', 'to', 'of') -- to 를 of로 바꿔줌. 특정 문자를 다른 문자로 바꾸는 함수
from dual;
 
select 'oracle', lpad('oracle',10,'#'),rpad('oracle',10,'*'), lpad('oracle',10)
from dual;

select rpad('990103-',14,'*')
from dual;

select concat(empno, ename) - concat --두개의 컬럼이 이어져서 조회된다.
from emp;

select concat(empno, ename), empno || '' || ename  -- 두개의 함수는 동일함 concat과 || '' ||
from emp;


-- 숫자함수
select 
        round(1234.5678), -- 자리수를 정해주지 않으면 소수점 첫째자리에서 반올림 된다.
        round(1234.5678,0), -- 위와 동일함
        round(1234.5678,1), -- 소수점 첫번째 자리까지 나타해달라는 뜻. 6에서 반올림이 됨 / 결과값 : 1234.6 
        round(1234.5678,2), -- 소수점 두번째 자리까지 나타내달라는 뜻. 7에서 반올림 됨 / 결과값 : 1234.57
        round(1234.5678,-1), -- -1은 그 자리에서 반올림 하라는 뜻. 음수는 정수에서 반올림 한다. / 결과값 : 1230
        round(1234.5678,-2) -- / 결과값 : 1200
from dual;

select 
        trunc(1234.5678), -- 
        trunc(1234.5678,0), -- 
        trunc(1234.5678,1), -- 
        trunc(1234.5678,2), -- 
        trunc(1234.5678,-1), -- 정수부분에서부터 값을 버리라는 뜻. 결과값 : 1230
        trunc(1234.5678,-2) -- 
from dual;

select 
        ceil(3.14), -- 자신(3.14)보다 큰 가장 가까운 정수 
        floor(3.14), -- 자신보다 작은 가장 가까운 정수
        ceil(-3.14),
        floor(-3.14)
from dual;

select mod(5,2), mod(10,4) -- 5를 2로 나누었을 때, 10을 4로 나누었을 때 나머지 값 
from dual;

select *
from emp
where mod(empno,2) = 1; -- 홀수인 사원 구하기.

--2022.10.19
--날짜함수
--오늘날짜 구하기
select sysdate-1, sysdate, sysdate+1
from dual;

select sysdate - hiredate as 근무일수 --일수를 반환한다.
from emp;

--근속년수 + 소수점 버리기
select trunc((sysdate - hiredate) / (365)) as 근무일수
from emp;

--ROUND함수를 사용하여 날짜 데이터 출력하기 2022.10.19
select  sysdate,
            round(sysdate, 'cc') as format_cc,
            round(sysdate, 'yyyy') as foramt_yyyy,
            round(sysdate, 'q') as format_q, -- 11월 15일이 안넘었기 때문에..
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

--자료형변환 함수
-- to_char() 숫자, 또는 날짜 데이터를 문자 데이터로 변환
-- to_number()
-- to_date()

--날짜를 문자로
select sysdate, to_char(sysdate,'YYYY/MM/DD HH24:MI:SS') as 현재날짜시간
from dual;

select hiredate, to_char(hiredate,'YYYY/MM/DD HH24:MI:SS:DAY')  as 입사연월일시간요일
from emp;

--숫자를 문자로
select to_char(123456, 'L999,999')
from dual;

select sal, to_char(sal, 'L9,999')
from emp;

--문자를 숫자로
--to_number()
--구성은 반드시 문자와 숫자로 되어있어야 한다.
select '20,000' - '5,000' -- to_number() 형변환을 해야한다.
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;


--문자를 날짜로
--to_date()
--문자가 꼭 날짜 형식으로 되어있어야 한다.
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101', 'YYYY/MM/DD');

--null데이터 처리
--nvl(null(컬럼값),바꾸고싶은데이터)
--nvl은 null 데이터의 타입과 같은 타입으로 변경해야한다.
--예) nvl(숫자,숫자) nvl(문자,문자)
SELECT ename as 사원명, sal, sal * 12 + nvl(comm,0) as 연봉 , comm
from emp;

select *
from emp
where mgr is null;
                            --숫자를 문자로 바꿔준다.
select ename,job,nvl(to_char(mgr,'9999'),'CEO') as mgr
from emp
where mgr is null;

select comm, nvl2(comm,'O','X')
FROM EMP;


--조건문 표현하는 함수
--decode() -> swhich
--case       -> if

select ename, job, deptno,
                decode(deptno, 10,'AAA','20','BBB','30','CCC','기타') AS 부서명 --deptno가 10인 사람은 AAA 부서, 20인 사람은 BBB로 30인 사람은 CCC 
from emp;


--범위를 조건으로 설정 할 수 있다.
--case
--        when 조건식 then 실행문(조건1의 결과 값이 true일 때 반환할 결과)
--        when 조건식2 then 실행문2(조건2의 결과 값이 true일 때 반환할 결과)
--        when 조건식3 then 실행문3(조건3의 결과 값이 true일 때 반환할 결과)
--        else 실행문(위 조건과 일치하는 경우가 없을 때 반환할 결과)
--end as 별칭
select ename, job, deptno,
                case
                    when deptno = 10 then 'AAA'
                    when deptno = 20 then 'BBB'
                    when deptno = 30 then 'CCC'
                    else '기타'
                end as 부서명
from emp;

select ename,job,sal,
                case 
                    when sal between 3000 and 5000 then '임원'
                    when sal >= 2000 and sal < 3000 then '관리자'
                    when sal >= 500 and sal <2000 then '사원'
                else '기타'
                end as 직급
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

--다중행함수
-- sum(), avg(), max(), min(), count() 의 특징
--일반컬럼과 같이 사용 불가 예)select max(sal), min(sal) 
--크기비교가 가능하기 때문에 모든 타입에 사용 가능


select sum(sal) -- 사원들의 급여 총합
from emp;

select avg(sal) -- 사원들의 급여 평균
from emp;

select count(*), count(comm) -- 전체 레코드의 갯수
from emp;

select max(sal), min(sal) -- 에러
from emp;

select ename, max(sal) -- 에러 ename은 14고 max는 1이기 때문에.
from emp;

select min(hiredate), max(hiredate)
from emp
where deptno = 10;

-- select 컬럼명
-- from 테이블명
-- while 조건식 (그룹함수 사용불가/group by, hiving 보다 먼저 실행한다.)
-- group by 기준컬럼명
-- having (group by 에 대한 조건식)
-- order by 컬럼명 정렬방식 > order by는 반드시 맨 마지막에 작성한다.

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
group by deptno,job -- 부서로 한 번 묶고, 직업으로 한번 더 묶는다. 
order by deptno, job;

--급여에 대한 평균
select deptno, avg(sal)
from emp
GROUP BY deptno
having avg(sal) > 2000; -- having > group by에 의해서 조회된 결과에 조건을 준다.
                                       -- 조건식을 작성할 때, 그룹함수를 사용한다.
                                       
--where절과  group by , having 같이 쓰는 경우 where절이 제일 먼저 실행되기 때문에 값이 달라진다.
SELECT deptno, avg(sal)
from emp
--where deptno !=10
group by deptno
having avg(sal) >= 2000;


-- 2022.10.20

--조인(Join)
--2개 이상의 테이블에서 데이터를 조회
-- from절에 2개 이상의 테이블을 작성한다.
-- where절에 조인 조건을 작성해야 한다.
-- cross join (where절 없이 조인) 잘 사용 안하기 때문에 개념만 알아둘 것
-- equi join (where 등가연산자(=)를 사용한다.) ★가장 많이 쓰인다
-- non eaui join (where 범위연산자 : and, or)
-- self join (where 하나의 테이블을 사용한다.)
-- out join (where에 누락되는 데이터를 같이 조회하려고 할 때 (+)를 사용한다.)

-- equi join 예)
select ename,job,e.deptno,dname,loc -- 양쪽에 똑같은 이름의 컬럼이 있을 경우, 어느 테이블에서 정보를 가져올 건지 적어야 한다. 
from emp e, dept d -- 테이블에 별칭을 주는 방법.
where e.deptno = d.deptno -- 등가연산자(=)로 공통 컬럼을 찾을 때 까지 하나하나 비교 후, 같은 값이 있으면 정보를 불러온다.
order by deptno;


select ename,job,e.deptno,sal,dname,loc
from emp e, dept d 
where e.deptno = d.deptno
and sal >= 3000 -- 조건 연산자도 사용 가능하다.
order by deptno;

-- non equi join 예)
--사원의 급여를 가지고 몇등급인지 알아보기
select ename, sal, grade, losal, hisal
from emp e, salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal <=s.hisal; -- 이 where절로도 사용 가능하지만 위의 where절을 더 권장함. 코드가 간결하기 때문이다.

--사원의 사번, 이름, 급여, 부서번호, 부서명, 급여 등급
select empno, ename, sal, d.deptno, dname, grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal; 

-- self join
-- 한 테이블에 있는 사원의 사번, 이름, 상사의 사번, 상사의 이름을 한번에 조회하기
select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m -- 같은 테이블로 조회하는 것이기 때문에 반드시 별칭을 부여해야 한다.
where e.mgr = m.empno;

--scott과 같은 부서에 근무하는 사원을 조회하기
select work.ename, friend.ename
from emp work, emp friend
where work.deptno = friend.deptno
and work.ename = 'SCOTT'
and friend.ename != 'SCOTT';

--외부조인
--등가시 누락되는 데이터를 같이 조회하기 위해서 사용한다.
select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m
where e.mgr = m.empno(+); -- (+) 아웃 조인의 표현방법. 데이터가 없는 테이블쪽에 (+)를 붙인다.

select ename, sal, d.deptno, dname
from emp e, dept d
where e.deptno(+) = d.deptno;

--ANSI-JOIN(표준조인 방식)
--cross join
--inner join ( equi, non equi, self )
--outer join ( (+) ) - left, rigth , full(누락된 데이터 모두를 조회해준다.) outer join
--nature join
select ename, sal, dname, loc
from emp e INNER JOIN dept d
on e.deptno = d.deptno;

select ename, sal, dname, loc
from emp e INNER JOIN dept d
using(deptno) -- 양쪽 테이블의 컬럼명이 동일하다는 가정하에만 가능하다.
where ename = 'SCOTT';

select e.empno, e.ename, e.mgr, m.ename
from emp e inner join emp m
on e.mgr = m.empno;

select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.mgr, m.ename
from emp e left outer join emp m -- outer join ->데이터가 있는 쪽을 지정해주면 됨.
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

--1번

select d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e inner join dept d
on e.deptno = d.deptno --등가연산자(=)로 공통 컬럼을 찾을 때 까지 하나하나 비교 후, 같은 값이 있으면 정보를 불러온다.
where e.sal > 2000;

-- 2번
select 
    e.deptno, 
    d.dname, 
    trunc(avg(sal)),
    max(sal) as mas_sal, 
    min(sal) as min_sal,
    count(*) as cnt
from emp e inner join dept d 
on e.deptno = d.deptno 
--using(deptno) -- 별칭 사용시 적용이 제한된다.
group by e.deptno, d.dname;

--3번
select d.deptno, d.dname, e.empno, e.ename,e.job,e.sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno, e.ename;

--4번
select d.deptno, d.dname,
          e.empno, e.ename, e.mgr, e.sal, e.deptno,
          s.losal, s.hisal, s.grade,
          m.empno, m.ename
from emp e right outer join dept d
on e.deptno = d.deptno -- 두개를 비교한다는 뜻
full outer join salgrade s
on e.sal between s.losal and s.hisal
left outer join emp m
on e.mgr = m.empno
order by d.deptno, e.empno;

--서브 쿼리
--쿼리 안에 쿼리를 또 쓰는 것.
--select 구문을 중첩해서 사용하는 것.
--select (select) 일반 서브쿼리
--from (select) 인라인뷰
--where (select)  서브쿼리
--select, from , where 모두 중첩 가능하지만 보통 where절에 사용하는 걸 서브쿼리라고 한다.

select ename, max(sal)
from emp;

--급여를 가장 많이 받는 사람의 이름과 급여 구하기. 
select ename, sal
from emp
where sal = (
                        select max(sal)
                        from emp
                        );

--문제 > scott이라는 사람의 근무지 부서명을 조회하고 싶다.
select deptno
from emp
where ename = 'SCOTT'; -- 이렇게 하면 SCOTT의 부서번호를 알 수 있다.

select dname
from dept
where deptno = 20; 

select dname
from dept --부서명을 알고 싶으니까 dept
where deptno = ( 
            select deptno
            from emp
            where ename = 'SCOTT'
            );
            
--문제 > 델란스에 근무하고 있는 사람의 이름, 부서번호를 조회하고 싶다.
select ename, deptno
from emp
where deptno = (
                            select deptno
                            from dept
                            where loc = 'DALLAS'
                            );
                            
--문제 > 자신의 직속상관이 KING인 사원의 이름과 급여를 조회하세요. (서브쿼리문으로)
select ename, sal, mgr
from emp
where mgr = (
                        select empno
                        from emp
                        where ename = 'KING' 
                        );
                        
                        
--단일행 서브쿼리 : =, !=, >, < ...
--다중행 서브쿼리 : any ... 
--in : 결과 중에 하나만 만족하면 된다
-- > any : 결과 중에 가장 작은 값 보다 크면 된다
-- > all : 결과 중에 가장 큰 값보다 크면 된다
select *
from emp
where sal in ( 
                        select max(sal)
                        from emp
                        group by deptno
                        );
                        
select *
from emp
where sal > any ( -- > 가장 작은 값보다 크면 조회가 된다. < 가장 큰 값보다  작은 값이 조회가 된다.
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

--다중열 서브쿼리
select *
from emp
where (deptno,sal) in (
                                        select deptno, max(sal)
                                        from emp
                                        group by deptno
                                        );