show databases;
use company_constraints;
use transaction_bd;
show tables;
select @@autocommit;
set @@autocommit = 0;

set @next = 1;

select @next;

set @next2 = @next;
select @next2;

start transaction;
set @next1 = 100;
set @var = @next1 + 1000;
insert into orders values (@next1, '2005-01-01', '2005-01-10', '2005-10-10', 'Despachado', 2);
savepoint insercao_order;
-- nova inserção em ordersdetails
insert into orderdetails values (@var+1, 12345, 30, '156');
savepoint insercao_order_details;
rollback to savepoint insercao_order;
commit;