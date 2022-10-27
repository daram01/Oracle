-- ����� id, �̸�, ��, �μ��̸�
-- employees, departments


--���ι��
select e.employee_id, e.first_name, e.last_name, d.department_name
from employees e inner join departments d
on e.department_id = d.department_id
where e.department_id = 100;

select count(*) from employees;

select * from employees
where department_id is null;



--�����������
select employee_id,first_name,last_name,e.department_id,
 (select department_name
    from departments d
        where e.department_id = d.department_id) as department_name
from employees e
where department_id = 100;




--�����Լ� ���
create or replace function get_dep_name(dep_id number) 
--�Լ� ����

    return varchar2
    --���� �� ���� ������ Ÿ�� ���ϱ�
is
    sDepName varchar2(30);
    --�������� ����, �ӽ÷� DEPARTMENT_NAME(�μ��̸�) �����ϴ� ����
    
begin
    select department_name
    --2. ���̺��� DEPARTMENT_NAME(�μ��̸�) �÷��� ��ȸ�Ѵ�.
    
    into sDepName
    --4. �ش� �÷��� �����͸� �ӽ÷� �� ������ �����Ѵ�.
    
    from departments
    --1. DEPARTMENTS ���̺��� ȣ��
    where department_id = dep_id;
    --3. �Ű������� ���� DEP_ID(������ ����)�� DEPARTMENT_ID�� ������ �� ������
    return sDepName;
    --5. ������ ������ �����͸� ��ȯ�� �غ� �Ѵ�.
end;
/
variable var_deptname varchar2(30);
--Ÿ�Կ� �´� �ӽ� ������ �����

execute :var_deptname := get_dep_name(90);
--get_dep_name(); �Լ��� ��ȯ ���� var_deptname ������ �����Ѵ�.

print var_deptname;
--get_dep_name(); �Լ����� ���� ���� ����Ѵ�.


select e.employee_id, e.first_name, e.last_name, get_dep_name(department_id) as department_id
from employees e;
--where e.department_id = 90;





--���� 
--employees , jobs
--���id, �̸�, ��, ��Ÿ��Ʋ ��ȸ
--���ι��, �����������, �Լ���� : get_job_title

--���ι��
select e.employee_id, e.first_name, e.last_name, j.job_title
from employees e inner join jobs j
on e.job_id = j.job_id;


--�����������
select e.employee_id, e.first_name, e.last_name,
    (select job_title
        from jobs j
            where e.job_id = j.job_id) as job_title
from employees e;

--�Լ�

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
