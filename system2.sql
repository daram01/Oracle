grant create view 
to scott;

-- 사용자 관리
-- create , drop
-- create user 계정명(관리자에서 요구하는 형태로) (대소문자 구분 없음) identified by 패스워드 (대소문자 구분함)
-- alter user 계정명 identified by 패스워드
-- drop user 계정명 cascade


--사용자 생성
create user user01
identified by  1234;

--접속권한 주기(DCL)
grant CREATE SESSION
to user01;

--테이블 생성 권한 주기
grant create table
to user01;

--테이블 생성 권한 회수
revoke create table
from user01;

--DCL(제어어)
--grant(권한 부여), revoke(권한 회수)
--grant 시스템권한 to 계정명
--revoke 시스템권한 from 계정명

--계정 삭제
drop user user01 CASCADE;

--계정 수정( 객체이기 때문에 create와 alter명령어를 사용한다. )
alter user user01 identified by 비밀번호;

--용량 할당
alter user user01
quota 2m on users;

-- 시스템 권한 (create ...)
-- 객체 권한 (select ... )



-- 롤 

-- 사용자 생성
create user user02
identified by 1234;

--롤으로 권한 부여
grant connect, resource --권한을 부여해주는 롤 이름들임
to user02;



--슈퍼계정
create user nbac identified by 1234;

drop user nbac;

grant dba,connect,resource
to nbac;
--system == nbac 가 되는 것임.


--사용자 정의 롤 생성
--관리자 계정에서만 가능하다.
--create role 롤명
--grant 내가 주고 싶은 권한명 to 롤명

create role mrole;

grant create session, create table, create view
to mrole;


-- 관리자 계정에서 롤 생성
create role mrole2;

-- 객체 권한은 권한을 줄 계정에서 진행해야함.
--scott 접속
grant select
on emp
to mrole2;

-- 롤 권한은 관리자 계정에서만 가능
grant mrole2
to user04;

-- 롤 권한 회수하기
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



