-- 사원의 id, 이름, 성, 부서이름
-- employees, departments


--조인방식
select e.employee_id, e.first_name, e.last_name, d.department_name
from employees e inner join departments d
on e.department_id = d.department_id
where e.department_id = 100;

select count(*) from employees;

select * from employees
where department_id is null;



--서브쿼리방식
select employee_id,first_name,last_name,e.department_id,
 (select department_name
    from departments d
        where e.department_id = d.department_id) as department_name
from employees e
where department_id = 100;




--저장함수 방식
create or replace function get_dep_name(dep_id number) 
--함수 선언

    return varchar2
    --리턴 할 값의 데이터 타입 정하기
is
    sDepName varchar2(30);
    --지역변수 선언, 임시로 DEPARTMENT_NAME(부서이름) 저장하는 역할
    
begin
    select department_name
    --2. 테이블의 DEPARTMENT_NAME(부서이름) 컬럼을 조회한다.
    
    into sDepName
    --4. 해당 컬럼의 데이터를 임시로 이 변수에 저장한다.
    
    from departments
    --1. DEPARTMENTS 테이블을 호출
    where department_id = dep_id;
    --3. 매개변수로 받은 DEP_ID(임의의 숫자)가 DEPARTMENT_ID와 비교했을 때 같으면
    return sDepName;
    --5. 저장한 변수의 데이터를 반환할 준비를 한다.
end;
/
variable var_deptname varchar2(30);
--타입에 맞는 임시 변수를 만든다

execute :var_deptname := get_dep_name(90);
--get_dep_name(); 함수가 반환 값을 var_deptname 변수에 저장한다.

print var_deptname;
--get_dep_name(); 함수에서 받은 값을 출력한다.


select e.employee_id, e.first_name, e.last_name, get_dep_name(department_id) as department_id
from employees e;
--where e.department_id = 90;





--문제 
--employees , jobs
--사원id, 이름, 성, 잡타이틀 조회
--조인방식, 서브쿼리방식, 함수방식 : get_job_title

--조인방식
select e.employee_id, e.first_name, e.last_name, j.job_title
from employees e inner join jobs j
on e.job_id = j.job_id;


--서브쿼리방식
select e.employee_id, e.first_name, e.last_name,
    (select job_title
        from jobs j
            where e.job_id = j.job_id) as job_title
from employees e;

--함수

create or replace function get_job_title(jobs_id varchar2)
    return varchar2
is
    j_title varchar2(30);
begin
    select job_title
    into j_title
    from jobs
    where job_id = jobs_id;
    return j_title;
end;
/

variable var_title varchar2(30);

execute :var_title := get_job_title('AD_VP');

print var_title;

select employee_id, first_name, last_name, get_job_title(job_id)
from employees;
