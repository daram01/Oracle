create table test
(
    id varchar2(10)
);


insert into test
values ('aaa');
--권한 회수를 했기 때문에 권한이 없다고 나온다.

--system 계정에서 용량 할당을 해주었기 때문에 다시 데이터 삽입을 해 보면,
insert into test
values ('aaa');
--데이터 삽입이 잘 된다.

select * from emp;
-- 테이블 또는 뷰가 존재하지 않습니다.
-- emp는 내 것이 아닌 scott의 계정에 있기 때문이다.

--scott계정에서 객체 권한을 받은 후
select * from scott.emp;


--권한 확인하기
select * from user_role_privs;

select * from scott.emp;

set role all;












