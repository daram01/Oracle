create table test
(
    id varchar2(10)
);


insert into test
values ('aaa');
--���� ȸ���� �߱� ������ ������ ���ٰ� ���´�.

--system �������� �뷮 �Ҵ��� ���־��� ������ �ٽ� ������ ������ �� ����,
insert into test
values ('aaa');
--������ ������ �� �ȴ�.

select * from emp;
-- ���̺� �Ǵ� �䰡 �������� �ʽ��ϴ�.
-- emp�� �� ���� �ƴ� scott�� ������ �ֱ� �����̴�.

--scott�������� ��ü ������ ���� ��
select * from scott.emp;


--���� Ȯ���ϱ�
select * from user_role_privs;

select * from scott.emp;

set role all;












