use transaction_bd;
show tables;
drop procedure sql_fail;
delimiter //
create procedure sql_fail()
	begin
		declare exit handler for sqlexception
		begin
			rollback;
            select 'A transação foi encerrada devido algum erro ocorrido' as warning;
		end;
		start transaction;
        insert into orders values (999, '2000-01-01', '2000-01-02', '2000-01-10', 'EM PROGRESSO', 90);
		insert into orderdetails values (999, '12121', '13', '3123', 90);
		commit;
	end //
delimiter ;

call sql_fail();