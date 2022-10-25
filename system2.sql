grant create view 
to scott;

-- ����� ����
-- create , drop
-- create user ������(�����ڿ��� �䱸�ϴ� ���·�) (��ҹ��� ���� ����) identified by �н����� (��ҹ��� ������)
-- alter user ������ identified by �н�����
-- drop user ������ cascade


--����� ����
create user user01
identified by  1234;

--���ӱ��� �ֱ�(DCL)
grant CREATE SESSION
to user01;

--���̺� ���� ���� �ֱ�
grant create table
to user01;

--���̺� ���� ���� ȸ��
revoke create table
from user01;

--DCL(�����)
--grant(���� �ο�), revoke(���� ȸ��)
--grant �ý��۱��� to ������
--revoke �ý��۱��� from ������

--���� ����
drop user user01 CASCADE;

--���� ����( ��ü�̱� ������ create�� alter��ɾ ����Ѵ�. )
alter user user01 identified by ��й�ȣ;

--�뷮 �Ҵ�
alter user user01
quota 2m on users;

-- �ý��� ���� (create ...)
-- ��ü ���� (select ... )



-- �� 

-- ����� ����
create user user02
identified by 1234;

--������ ���� �ο�
grant connect, resource --������ �ο����ִ� �� �̸�����
to user02;



--���۰���
create user nbac identified by 1234;

drop user nbac;

grant dba,connect,resource
to nbac;
--system == nbac �� �Ǵ� ����.


--����� ���� �� ����
--������ ���������� �����ϴ�.
--create role �Ѹ�
--grant ���� �ְ� ���� ���Ѹ� to �Ѹ�

create role mrole;

grant create session, create table, create view
to mrole;


-- ������ �������� �� ����
create role mrole2;

-- ��ü ������ ������ �� �������� �����ؾ���.
--scott ����
grant select
on emp
to mrole2;

-- �� ������ ������ ���������� ����
grant mrole2
to user04;

-- �� ���� ȸ���ϱ�
revoke mrole2 from user04;

--------------------------------------------------------------

create role mrole3;

grant mrole3
to user01;

grant mrole3
to user04;

revoke mrole3 from user04;
revoke mrole3 from user01;

---------------------------------------------------------------

create user user05 identified by 1234;

grant connect,resource
to user05;

grant mrole3
to user05;

revoke mrole3 from user05;



