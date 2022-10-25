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


-- 2022.10.21
-- DML(데이터조작어) : 테이블의 데이터를 저장, 수정, 삭제 
-- 종류 : insert , update, delete


-- insert : 테이블에 데이터를 삽입하는 것.
-- insert into 테이블명 (컬럼명1, 컬럼명2,...)
-- values(값1, 값2, ...)
-- ★컬럼과 값의 타입과 갯수가 일치해야 한다. (1 : 1)
-- ★작성 순서대로 1:1 매칭 된다.

create table dept_temp
as
select * from dept;

select *
from dept_temp;

--신규로 데이터를 추가 하고 싶을 때
insert into dept_temp (DEPTNO, DNAME, LOC)
values (50,'DATABASE','SEOUL');  --기존 테이블에 사용된 타입을 알아야 하고, insert into과 values에 지정된 갯수가 같아야 하고, 문자열의 같은 경우 ' ' 필수사용

INSERT INTO dept_temp -- 컬럼생략을 하면 이 테이블에 있는 모든 열에 추가 삽입을 하겠다는 뜻
values (70,'HTML','SEOUL');

--두가지만 데이터 추가하고 싶을 때
INSERT INTO dept_temp(DEPTNO, DNAME) --(묵시적 NULL데이터 삽입)
values (60,'JSP');
-- 이렇게 할 경우, LOC는 NULL데이터가 자동으로 삽입된다.

insert into dept_temp -- 컬럼생략을 하고 값의 갯수를 넣고 싶으면 NULL 데이터를 넣으면 된다. (명시적 NULL데이터 삽입)
values (80,NULL,'SEOUL');


-- 날짜데이터 다루기
create table emp_temp
as
select * from emp
where 1 != 1; -- 데이터는 없애고 컬럼 구조만 만드는 방법임.

select *
from emp_temp; -- 결과 : 값이 하나도 없고, 컬럼명만 나옴

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (9999,'홍길동','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (3111,'심청이','MANAGER',9999,SYSDATE,4000,NULL,30);
--오늘 날짜로 자동으로 데이터가 삽입된다.


-- update : 컬럼의 데이터를 변경(수정) 
-- update 테이블명
-- set 값을 바꿔주고 싶은 컬럼명 = 바꿀 값 (최소 1개 이상)
-- where 필요에 따라 조건식 사용 가능하나 조건식은 거의 필수임.
-- 조건절을 사용하지 않으면 해당 컬럼이 모두 변경된다.★

--만들어진 테이블을 삭제 하고 싶을 때.
drop table dept_temp2;

create table dept_temp2
as
select * from dept;

--update dept_temp2
--set loc = 'SEOUL';
--dept_temp2 의 테이블에서 모든 loc 컬럼의 데이터를 SEOUL로 변경한다.

update dept_temp2
set dname = 'DATABASE', loc = 'SEOUL'
where deptno = 40;
--deptno의 값이 40인 곳만 부서의 이름과 근무지를 변경한다.



-- delete (데이터 삭제)
-- delete from 삭제할 테이블명
-- where 조건식
-- 조건절을 사용하지 않으면 모든 데이터가 삭제된다. ★

create table emp_temp2
as
select * from emp;

delete from emp_temp2
where ename = 'SCOTT';
--이름이 SCOTT인 사람만 삭제한다.



-- TCL (트랜잭션 데이터의 영구 저장, 취소 등과 관련된 명령어)
-- commit , rollback, savepoint(자주 사용하지는 않음)
-- commit : 데이터 영구 저장 (테이블의 데이터를 반영)
                    -- create구문을 사용해서 객체를 생성할 때 자동으로 commit된다.
-- rollback : 데이터 변경 취소  (테이블의 데이터 미반영) 원상복귀
                    -- 천재지변, 전기가 나가거나, 전쟁 같은 경우에 자동으로 rollback된다.

create table dept01
as
select * from dept;

select *
from dept01;

delete from dept01; 

-- 작업하는 작업자에게만 삭제된 것 처럼 보일 뿐, 실제로 외부에서 접속했을 때는 삭제 안된 상태가 보여짐
-- 데이터를 완전하게 삭제하려고 하면 위의 과정에서 commit을 사용해야한다. 

commit;

drop table dept_dept01; -- 테이블 삭제하는 방법

create table dept_dept01
as
select * from dept;

--데이터를 삭제하는 구문이 delete 말고도 하나가 더 있음.
delete from dept01; 
truncate table dept01; -- rollback 사용 불가임 ( 자동으로 commit 발생)
rollback; -- 실행해보면 rollback 안됨.


-- DDL (테이블(모든객체)을 생성, 변경, 삭제 할 때 사용한다.)
-- create(생성), alter(변경), drop(삭제)

--create table 테이블명( -- table(객체)
--        컬럼명1 타입,       -- column(속성)
--        컬럼명2 타입,
--        컬럼명3 타입
--       );
        
-- 직접 테이블 만드는 방법        
create table emp_ddl(
--  사번, 이름, 직책, 관리자, 입사일, 급여, 성과금, 부서번호
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date, --날짜데이터를 받는 컬럼이기 때문에 date
    sal number(7,2), -- 전체적으로는 7자리의 숫자를 사용하지만, 2자리는 소숫점으로 사용하겠다는 뜻. 즉 5자리는 정수.
    comm number(7,2),
    deptno number(2)
);

insert into emp_ddl
values (9999,'이순신','MANAGER',1111,SYSDATE,1000,NULL,10);

--기존에 있는 테이블을 복사하는 방법(테스트를 진행하거나, 원본에 문제가 있을 경우 사용하기 위해서)
create table dept_ddl
as
select * from dept;

--부서가 30번인 테이블을 만들고 싶을 때
create table dept_30
as
select * from dept
where deptno = 30;

--dept의 dname,loc만 가져와서 테이블을 만들고 싶을 때
create table dept_m
as
select dname,loc
from dept;

--데이터 제외한 구조만 만들고 싶을 때
create table dept_d
as
select * from dept
where 1 != 1; -- 테이블의 구조만 복사하겠다는 의미.


-- 만들어진 테이블을 변경하기 (컬럼의 정보 수정)
-- 1. 새로운 컬럼 추가(add), 2. 컬럼의 이름 변경(rename column), 3. 자료형의 변경(modify), 4. 컬럼을 삭제(drop column)
-- alter    

--복사테이블 하나 만들기
create table emp_alter
as
select * from emp;

--테이블이 잘 만들어졌는지 확인하는 작업
select *
from emp_alter;

--새로운 컬럼 추가
alter table emp_alter
    add address varchar2(100);
    
--컬럼의 이름 변경    
alter table emp_alter
    rename column address to addr;
    
--데이터 타입, 크기 변경
alter table emp_alter
    modify empno number(10); -- 기존의 크기보다 작게는 안되지만 크게는 가능하다.

--컬럼 삭제    
alter table emp_alter
    drop column addr;

--만든 테이블 삭제하기
--drop table 테이블명
drop table emp_alter;    
    
--테이블이 제대로 삭제됐는지 확인하기    
select *
from emp_alter;

--문제1번
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
    
--문제2번    
alter table emp_hw
    add bigo varchar2(20);

--문제3번
alter table emp_hw
    modify bigo varchar2(30);
    
--문제4번
alter table emp_hw
    rename column bigo to remark;

--문제5번
insert into emp_hw
select empno, ename, job, mgr, hiredate, sal, comm, deptno,NULL
from emp;
    
--문제6번    
drop table emp_hw;

--데이터사전
desc user_tables; 

-- 현재 사용자가 만들어서 사용하고 있는 테이블 정보 확인하기
select table_name
from user_tables;

--남이 만든 테이블 정보 확인하기
select table_name
from all_tables; 

--남이 만든 테이블의 주인 정보 확인하기
select owner, table_name
from all_tables; 

--index(검색속도를 향상하기 위해 사용한다.) index는 객체이다.
--생성할 때는 create 삭제할때는 drop 
--select 구문의 검색 속도를 향상 시킨다.
--전체 레코드의 3% ~ 5% 일때 속도가 빠르다. 
--index객체를 컬럼에 생성해서 사용한다.

--create index 인덱스명
--on 테이블 이름(
--                컬럼명1 asc or desc
--                컬럼명2 asc or desc
--                컬럼명3 asc or desc
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
select * from emp01; -- 917,504 행이 삽입될때까지만 하고 멈추기

insert into emp01(empno, ename)
values (1111,'bts');

--index 생성 전 0.029 ~ 0.04 사이
--index 생성 후 0.001초
select empno, ename
from emp01
where ename = 'bts';

--index 생성
create index idx_emp01_ename
on emp01(ename);

--index 삭제
drop index idx_emp01_ename;

--테이블 삭제후 원상복구
show recyclebin; --명령어 실행한 뒤, 
flashback table emp_alter
    to before drop;

--휴지통 비우는 방법
purge recyclebin;


--제약조건
--테이블을 만들 때 사용하는 것
--제약조건은 무결성을 구현하기 위하여 설정하는 것이며, 무결성이란 잘못된 값이 데이터로 사용되지 못하게 하는 것이다.
--not null - null데이터를 허용하지 않는다.
--unique - 지정한 열이 유일한 값을 가져야 한다.
--primary key (기본키) - 유일하면서도 null 데이터를 허용하지 않는다.
--foreign key (외래키) - 다른 테이블의 열을 참조하여 존재하는 값만 허용한다.
-- 1. 부모와 자식의 관계를 가지고 있을 때,  자식쪽 테이블에 설정한다.
-- 2. 부모쪽 테이블의 컬럼은 반드시 primary key 또는 unique 해야한다.
-- 3. null데이터를 허용한다.
--check 
--default

-- emp, dept
insert into emp
values (1111,'aaa','MANAGER','9999',SYSDATE,1000,NULL,50);
--오류 보고 -
--ORA-02291: 무결성 제약조건(SCOTT.FK_DEPTNO)이 위배되었습니다- 부모 키가 없습니다
--마지막에 입력된 부서번호가 50이기 때문이다. dept의 부서번호에도 50은 없음.

drop table emp02; -- 테이블 삭제

--not null(반드시 null이 아닌 데이터가 들어와야 한다.)
create table emp02(
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2)
    );

insert into emp02
values (null,null,'MANAGER',30);
--오류 보고 -
--ORA-01400: NULL을 ("SCOTT"."EMP02"."EMPNO") 안에 삽입할 수 없습니다

insert into emp02
values (1111,'홍길동','MANAGER',30);

insert into emp02
values (1111,'이순신','MANAGER',20);
--위의 홍길동과 사원번호가 동일한데도 삽입할 수 있다는 오류가 있음.

delete from emp02; -- 데이터 삭제




--unique(지정한 열이 유일한 값을 가져야 한다. NULL은 중복에서 제외된다.)
create table emp02(
    empno number(4) not null unique,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2)
    );
    
insert into emp02
values (1111,'홍길동','MANAGER',30);

insert into emp02
values (1111,'이순신','MANAGER',20);
--오류 보고 -
--ORA-00001: 무결성 제약 조건(SCOTT.SYS_C0011056)에 위배됩니다

insert into emp02
values (null,'김유신','SALESMAN',20);
--오류 보고 -
--ORA-01400: NULL을 ("SCOTT"."EMP02"."EMPNO") 안에 삽입할 수 없습니다


--primary key(기본키 - 지정한 열이 유일한 값이면서 중복될 수 없는 것. 테이블에 하나만 지정 가능하다.)
create table emp02(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2)
    );
    
insert into emp02
values (1111,'홍길동','MANAGER',30);

insert into emp02
values (2222,'홍길동','MANAGER',30);

insert into emp02
values (null,'김유신','SALESMAN',20);
--오류 보고 -
--ORA-01400: NULL을 ("SCOTT"."EMP02"."EMPNO") 안에 삽입할 수 없습니다

insert into emp02
values (2222,'옥동자','SALESMAN',10);
--오류 보고 -
--ORA-00001: 무결성 제약 조건(SCOTT.SYS_C0011061)에 위배됩니다


--제약조건명 작성하기 (constraint 테이블명_컬럼명_약어 제약조건)
create table emp02(
    empno number(4) constraint emp02_empno_pk  primary key,
    ename varchar2(10) constraint emp02_empno_nn not null,
    job varchar2(9),
    deptno number(2)
    );
        
insert into emp02
values (1111,'홍길동','MANAGER',30);

insert into emp02
values (2222,'홍길동','MANAGER',30);

insert into emp02 
values (null,'김유신','SALESMAN',20);
--오류 보고 -
--ORA-01400: NULL을 ("SCOTT"."EMP02"."EMPNO") 안에 삽입할 수 없습니다

insert into emp02
values (2222,'옥동자','SALESMAN',10);
--오류 보고 -
--ORA-00001: 무결성 제약 조건(SCOTT.EMP02_EMPNO_PK)에 위배됩니다



--2022.10.24
--foreign key (참조키) - 자식테이블에 fk 설정
create table emp03(
    empno number(4) constraint emp03_empno_pk  primary key ,
    ename varchar2(10) constraint emp03_ename_nn not null ,
    job varchar2(9),
    deptno number(2) constraint emp03_deptno_fk references dept03(deptno)
    );
    
create table dept03(
    deptno number(2) constraint dept03_deptno_pk primary key, -- 부모쪽에 반드시 프라이머리 키 설정을 해야한다.
    dname varchar2(20) constraint dept03_dname_nn not null,
    loc varchar2(20) constraint dept03_loc_nn not null
    );

-- 서브쿼리문을 사용한 데이터 삽입
-- 꼭 부모테이블부터 데이터 삽입을 해줘야 한다.
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
-- ORA-02290: 체크 제약조건(SCOTT.EMP03_SAL_CK)이 위배되었습니다

insert into emp04
values (3333,'HONG',2000,'E');
--ORA-02290: 체크 제약조건(SCOTT.EMP03_GENDER_CK)이 위배되었습니다

--default
create table dept04(
    deptno number(2) primary key,
    dname varchar2(10) not null,
    loc varchar2(15) default 'SEOUL'
);

insert into dept04 (deptno, dname)
values (10, 'SALES');

insert into dept04 (deptno, dname, loc)
values (20, 'SALES','BUSAN'); -- 기본값은 서울이지만, 내가 직접 지정하여 데이터를 넣어주면 넣어준 데이터로 출력이 된다.

select * from dept04;

--제약조건 설정방식
--컬럼 레벨의 설정 (위에서 해왔던 방식이 컬럼 레벨의 설정)
--테이블 레벨의 설정

--테이블 레벨의 설정 방식 ( not null 은 테이블 레벨 설정에서는 불가능하며, 컬럼 레벨에서만 가능하다.)
--컬럼을 다 정의하고 나서 , 붙인 뒤 아래에 제약조건을 붙인다.
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
--ORA-02291: 무결성 제약조건(SCOTT.EMP05_DEPTNO_FK)이 위배되었습니다- 부모 키가 없습니다


-- 복합키(기본키를 두개의 컬럼에 사용하는 경우)
-- 테이블 레벨 방식으로만 적용 가능
--1. 테이블안에서 정의하는 방식
--2. alter 명령어 사용하는 방식 ( 제약조건을 걸지 않은 상태에서 테이블을 만든 후 추후에 추가해야 할 때 )

create table member(
    name varchar2(10),
    address varchar2(30),
    hphone varchar(10),
    
    constraint member_name_address_pk primary key(name, address), -- 복합키로 묶는다. 
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

-- not null은 변경의 개념으로 사용한다.( null -> not null )
alter table emp06
modify job constraint emp06_job_nn not null;

alter table emp06
modify ename constraint emp06_ename_nn not null;

-- 제약조건 삭제하는 방법
-- 제약조건명(constraint 뒤에 있는 조건명) 또는 제약조건(pk,fk,nn) 두가지 방식이 있지만 제약조건명을 사용하는게 확실하다.
alter table emp06
drop constraint emp06_empno_pk;

--삭제했던 제약조건 다시 부여하기
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

-- 부모쪽 데이터 삭제하기
delete from dept07
where deptno = 10;
-- ORA-02292: 무결성 제약조건(SCOTT.EMP07_DEPTNO_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다
-- 자식이 참조하고 있기 때문에 데이터를 지울 수 없다.
-- 굳이 사용하지 않으려고 한다면 비활성화를 사용한다.

--비활성화 하는 방법
alter table dept07
disable primary key cascade;

--제약조건 완전 삭제
alter table dept07
drop primary key cascade;


--연습문제
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




-- 뷰
-- 객체 : table, index, view 
-- create or replace view 뷰테이블이름 [(alias별칭)]
-- as 
-- 서브쿼리(select)
-- [with check option]
-- [with read only]
-- alias, with check option, with read only 는 선택. 나머지는 필수

-- 단일뷰
-- 원본테이블 복사 
create table dept_copy
as
select * from dept;

create table emp_copy -- 복사되는 테이블은 제약조건이 안 넘어온다.
as
select * from emp;

-- 복사테이블이기 때문에 제약조건 직접 만들어 주기
alter table emp_copy
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);



--view 테이블 생성
create or replace view emp_view30 -- 30번 부서에게만 보여줄 테이블
as
select empno, ename, sal, deptno 
from emp_copy
where deptno = 30;

-- 테이블 조회하는 방법
select * from emp_view30;

insert into emp_view30
values (1111,'HONG',1000,30); -- emp_view30 에 실제로 존재하는건 아니고, emp_copy(원본파일)에 데이터가 생성되어져있다.

insert into emp_view30(empno,ename,sal)
values (2222,'HONG',2000); --foreign key가 null데이터를 허용하기 때문에 emp_copy에 데이터 생성됨.
-- 부서번호가 null이기 때문에 뷰 테이블 조회를 하면 보여지지 않음.

insert into emp_view30
values (3333,'HONG',2000,50);
--ORA-02291: 무결성 제약조건(SCOTT.EMP_COPY_DEPTNO_FK)이 위배되었습니다- 부모 키가 없습니다
--원본테이블에 데이터가 들어가는 것이기 때문이다.

select * from emp_copy;

create or replace view emp_view(사원번호,사원명,급여,부서번호)
as
select empno, ename, sal, deptno
from emp_copy;
--사원번호와  empno, 사원명과 ename... 이런식으로 1:1 매칭되며 원래 사용하던 empno... 는 사용 불가임

select * from emp_view; -- 컬럼이름이 한글로 되어있음.

select * 
from emp_view
where 부서번호 = 30;


-- 복합뷰
create or replace view emp_dept_view
as
select empno, ename, sal, e.deptno, d.dname, d.loc
from emp_copy e inner join dept_copy d
on e.deptno = d.deptno
order by empno desc;

select * from emp_dept_view;

-- 부서별 최소급여와 최대급여를 구해라.(view)
-- dname, min_sal, max_sal 

create or replace view sal_view
as
select dname, min(sal) as min_sal, max(sal) as max_sal
from emp_copy e inner join dept_copy d
on e.deptno = d.deptno
group by d.dname;

select * from sal_view;

drop view sal_view; --뷰 삭제


-- 2022.10.25
-- 모든 객체의 이름은 중복될 수 없다. 유일해야 함.
-- 그러나, 이미 뷰를 만들고 나서 조건을 추가하고 싶거나, 변경될 내용이 있을 경우에도 or replace가 있기 때문에 가능하다. (덮어쓰기)
create or replace view sal_view
as
select dname, min(sal) as min_sal, max(sal) as max_sal, avg(sal) as avg
from emp_copy e inner join dept_copy d
on e.deptno = d.deptno
group by d.dname;


-- [with check option]
--현재 사용된 조건절의 컬럼을 수정, 변경 하지 못하게 하는 것. 
create or replace view view_chk30 -- 30번 부서만 볼 수 있는 뷰
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30 with check option; 

update view_chk30 -- 만약 이렇게 10번으로 수정해버리면, 위의 뷰테이블은 존재하지 않게 된다.
set deptno = 10;
--ORA-01402: 뷰의 WITH CHECK OPTION의 조건에 위배 됩니다. ( with check option 때문에 오류 발생)



-- [with read only]
-- 모든 컬럼에 대한 c, u, d 가 불가하다. 오로지 r(데이터 조회)만 가능함.
create or replace view view_read30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30 with read only;

update view_read30
set deptno = 10;
--읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.(insert, update, delete)


-- 뷰의 활용
-- TOP - N 조회하기
select * from emp
order by hiredate asc;

-- 입사일이 가장 빠른 5명의 사원을 조회 
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
-- 위의 두 가지 방법을 이용해도 입사일이 가장 빠른 5명을 조회하기는 어려움.



create or replace view view_hiredate
as
select empno,ename,hiredate
from emp
order by hiredate asc;

select * from view_hiredate;

select rownum,empno, ename, hiredate
from view_hiredate
where rownum <=7;

-- 입사일이 2번째에서 5번째인 사람만 조회하기
select rownum,empno, ename, hiredate
from view_hiredate
where rownum between 2 and 5 ; --rownum은 조건절에 직접 사용시 반드시 1을 포함하는 조건식을 만들어야 한다. 그래서 아무것도 안뜸

create or replace view view_hiredate_rm
as
select rownum rm,empno, ename, hiredate -- rownum의 별칭을 만들어서 새롭게 뷰테이블 생성을 한다.
from view_hiredate;

select rm,empno,ename,hiredate
from view_hiredate_rm
where rm between 2 and 5;

-- 인라인뷰 (보통 게시판 만들때 이 구조를 사용해서 게시글을 가져오는 방식으로 사용한다.)
select rm,b.*
from (select rownum rm,a.*
            from (select empno,ename,hiredate
                          from emp
                             order by hiredate asc) a
            ) b
where rm between 2 and 5;

--인라인뷰형태로 만들며, 입사일이 가장 빠른 5명을 조회
select rownum, empno,ename,hiredate
from (select empno,ename,hiredate
                 from emp
                       order by hiredate asc)a
where rownum <= 5;


--시퀀스
--자동으로 번호를 증가시키는 기능을 수행한다.
--create, drop으로 처리한다.
--nextval, currval

--create sequence 시퀀스명
--start with 시작값 -> 1
--increment by 증가치 -> 1
--max value 최대값 -> 10의 1027
--min value 최대값 -> 10의 -1027
--옵션의 순서는 상관없다.


--시퀀스 생성하기
create sequence dept_deptno_seq
increment by 10
start with 10;

--생성한 시퀀스 조회하기
select dept_deptno_seq.nextval
from dual;
--한번 더 조회하면 10에서 20으로 변경되어있음.
--한번 증가하면 백 안됨. 증가하기만 함.

--현재값을 확인하는 용도
select dept_deptno_seq.currval
from dual;

drop sequence dept_deptno_seq;

-- 새로운 시퀀스 생성
create sequence emp_seq
increment by 1
start with 1
maxvalue 1000;

--기존에 있던 emp01테이블 삭제
drop table emp01;

--데이터는 없고 컬럼만 있는 테이블 생성
create table emp01
as
select empno, ename, hiredate
from emp
where 1 <> 1;

insert into emp01
values (emp_seq.nextval, 'HONG',SYSDATE);
-- 2부터 들어가는데 오라클 버그라서 시퀀스를 만들 때 0 으로 만들어야 1부터 차례차례 들어가게 된다.



create table product(
    pid varchar2(10),
    pname varchar2(10),
    price number(5),
    
    constraint product_pid_pk primary key(pid)
);


--1000단위부터 시작하는 시퀀스 생성
create sequence idx_product_id
start with 1000;

--시퀀스를 문자열에 결합
insert into product(pid, pname, price)
values ('pid' || idx_product_id.nextval, '치즈',1000);

select * from product;

drop sequence idx_product_id;

---------------------------------------------------------------

--user01에게 객체 권한주기
--grant 객체권한종류
--on 객체명
--to 계정명

grant select
on emp
to user01;

--객체 권한 회수하기
revoke select
on emp
from user01;

---------------------------------------------------------------

grant select
on emp
to user04;

--객체 권한 부여
grant select
on emp
to mrole3;





