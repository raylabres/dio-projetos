show databases;
use company_constraints;
show tables;

-- Criando índices
select * from employee;
create index index_employee on employee(Ssn);
create index index_manager on employee(Super_ssn);
show index from employee; -- Criando index na PK (ssn) identificação dos empregados e FK (identificação dos gerentes)

select * from departament;
create index index_departament on departament(Dnumber); -- Criando index na PF (Dnumber) indentificação dos depatamentos
show index from departament;

select * from dept_locations;
create index index_numero_departamento_localizacao on dept_locations(dnumber);
show index from dept_locations; -- Criando index na PK (Dnumber) indentificação do departamento



-- Criando Querys para responder as perguntas
-- Qual o departamento com maior número de pessoas? 
select d.dnumber as Nº_Departamento, count(*) as Quantidade_empregados from employee e
inner join departament d on e.dno = d.dnumber
group by d.dnumber
order by d.dnumber;

-- Quais são os departamentos por cidade? 
select d.dname as Nome_departamento, d.dnumber as Numero_departamento, dl.dlocation as Localizacao from departament d
inner join dept_locations dl on d.dnumber = dl.dnumber;

-- Relação de empregrados por departamento 
select concat(fname, ' ', lname) as Empragado, ssn as Identificacao, d.dnumber as Nº_Departamento from employee e
inner join departament d on e.dno = d.dnumber
order by d.dnumber;

-- Criando Procedure para manipudação de dados
drop procedure manipulacao_dados_employee;
delimiter \\
create procedure manipulacao_dados_employee (
	opcao_p int ,
	fname_p varchar(15),
	minit_p char(1),
	lname_p varchar(15),
	ssn_p	char(9),
	bdate_p date,
	address_p varchar(30),
	sex_p char(1),
	salary_p decimal(10,2),
	super_ssn_p char(9),
	dno_p int(11)
)
begin
	if opcao_p = 1 then
		select * from employee;
	elseif opcao_p = 2 then
		insert into employee (fname, minit, lname, ssn, bdate, sex, salary, super_ssn, dno) values (fname_p, minit_p, lname_p, ssn_p, bdate_p, sex_p, salary_p, super_ssn_p, dno_p);
	elseif opcao_p = 3 then
		update employee set sex = sex_p, address = address_p, salary = salary_p;
	end if;
end \\
delimiter ;

call manipulacao_dados_employee(1, null, null, null, null, null, null, null, null, null, null); -- Chamando procedure para select (opcao 1)
call manipulacao_dados_employee(2, 'Michael', 'J', 'Johnson', '234567890', '1988-12-10', '789 Oak St', 'M', 55000.00, '123456789', 5); -- Chamando procedure para insert into (opcao 2)
call manipulacao_dados_employee(3,  null, null, null, null, null, 'Salto Jardim São João', 'M', 5000.00, null, null); -- Chamando procedure para update nos campos possíveis (opcao 3)


