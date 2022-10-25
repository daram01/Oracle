--현재 이 계정은 슈퍼계정임

create user user04
identified by 1234;
--system계정과 동일하게 계정 생성이 된다.
--보통 회사에서는 system계정으로 안 하고 이런식으로 슈퍼계정을 만들어서 사용함.

--사용자정의 롤 권한 부여
grant mrole
to user04;

select * from user_role_privs;

