select date_of_birth, to_char(date_of_birth,'YYYY/MM/DD') as �������, 
            round((sysdate - date_of_birth) / 365) || '��' as ����
from customers;


select  date_of_birth, round((sysdate - date_of_birth) / 365) || '��' as ����,
            case
                    when round((sysdate - date_of_birth) / 365) >= 10 and round((sysdate - date_of_birth) / 365) < 20 then '10��'
                    when round((sysdate - date_of_birth) / 365) between 20 and 29 then '20��'
                    when round((sysdate - date_of_birth) / 365) between 30 and 39 then '30��'
                    when round((sysdate - date_of_birth) / 365) between 40 and 49 then '40��'
                    when round((sysdate - date_of_birth) / 365) between 50 and 59 then '50��'
                    when round((sysdate - date_of_birth) / 365) between 60 and 69 then '60��'
                    when round((sysdate - date_of_birth) / 365) between 70 and 79 then '70��'
                    else '��Ÿ'
                    end as ���ɴ�
from customers;
