use company_constraints;

-- Criando trigger para company_constraints para salário
delimiter \\
create trigger atualiza_salario before update on employee
for each row
begin
    set new.salary = 10000.00;
end \\
delimiter ;
update employee set salary = 90000.00 where fname = 'Pedro';
select * from employee;
desc employee;

