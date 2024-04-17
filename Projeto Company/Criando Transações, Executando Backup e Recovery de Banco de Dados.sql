show databases;
set @@autocommit = 0;
select @@autocommit;

-- Parte 1 Primeira transação
start transaction;
use company_constraints;
show tables;
select * from employee;
select * from departament;
update employee set fname = 'Fulaninho' where fname = 'Fulano';
INSERT INTO departament (Dname, Dnumber, Mgr_ssn, Mgr_start_date, Dept_create_date) VALUES ('Departamento A', 1001, '123456789', '2023-01-01', '2022-12-31');
rollback;
commit;

-- Parte 2 Procedure e Transação
select * from departament;
desc departament;
delimiter //
create procedure insert_dados_departament(
	in dname_p varchar(15),
    in dnumber_p int,
    in mgr_ssn_p char(9),
    in mgr_start_date_p date,
    in depte_create_date_p date
)
begin
	declare exit handler for sqlexception
    begin
		rollback;
        resignal;
	end;
    start transaction;
    INSERT INTO departament (Dname, Dnumber, Mgr_ssn, Mgr_start_date, Dept_create_date) 
    VALUES (dname_p, dnumber_p, mgr_ssn_p, mgr_start_date_p, depte_create_date_p);
    commit;
end //
delimiter ;
call insert_dados_departament('Departamento A', '1111', '123456789', '2023-01-01', '2022-12-31');

