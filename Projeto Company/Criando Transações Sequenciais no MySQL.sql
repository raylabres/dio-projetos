-- Primeira transação
start transaction;
	select * from orders;
commit;

-- Segunda transação
start transaction;
	-- select * from orders;
    update orders set orderStatus = 'ENTREGUE' where orderNumbers = 1;
commit;
