show databases;
use company_constraints;

show session variables like "%isolation%";
set session transaction isolation level read committed;

-- Sempre autocommit = 0
set @@autocommit = 0;
select @@autocommit;



-- Transações sequenciais no MySQL

