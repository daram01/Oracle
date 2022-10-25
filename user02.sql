create table test(
    id varchar2(10)
);
-- 롤으로 권한을 주었기 때문에 테이블 생성에 아무런 문제가 없다.

insert into test
values ('aaa');
-- 데이터 삽입에도 문제가 없다.

select* from test;

select * from user_role_privs;

set role all;