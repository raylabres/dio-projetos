use company_constraints;
show tables;
desc employee;
desc departament;
desc dept_locations;

-- Número de empregados por departamento e localidade 
create view n_funcionario_dept_localidade 
as
select count(*) as Numero_funcionario, d.dname as Departamento, dl.dlocation as Localizacao from employee e
inner join departament d on e.dno = d.dnumber
inner join dept_locations dl on d.dnumber = dl.dnumber 
group by d.dname;
select * from n_funcionario_dept_localidade;

-- Lista de departamentos e seus gerentes 
desc departament;
desc employee;
create view lista_dept_gerentes 
as
select concat(e.fname, ' ', e.lname) as Gerente, d.Dname as Nome_departamento, d.Dnumber as Numero_departamento from departament d
inner join employee e on d.mgr_ssn = e.ssn
group by d.Mgr_ssn;
select * from lista_dept_gerentes;

-- Projetos com maior número de empregados (ex: por ordenação desc)
desc project;
desc departament;
desc employee;
create view projeto_maior_numero_funcionario
as
select p.pname as nome_projeto, count(*) as Numero_empregado from project p
inner join employee e on p.dnum = e.dno
group by p.pname
order by Numero_empregado desc;
select * from projeto_maior_numero_funcionario;

-- Lista de projetos, departamentos e gerentes
desc departament;
desc employee;
desc project;
create view projeto_departamento_gerentes
as
select concat(e.fname, ' ', e.lname) as Gerente, d.Dname as Nome_departamento, pj.pname from departament d
inner join employee e on d.mgr_ssn = e.ssn
inner join project pj on pj.dnum = d.dnumber;
select * from projeto_departamento_gerentes;

-- Quais empregados possuem dependentes e se são gerentes 
desc employee;
desc dependent;
desc departament;
create view gerente_dependente
as
select concat(e.fname, ' ', e.lname) as Nome_gerente, d.dependent_name as Nome_dependent from employee e
inner join dependent d on e.ssn = d.essn
inner join departament dp on e.ssn = dp.mgr_ssn;
select * from gerente_dependente;

-- Criando usuario gerente e dando permissão para ele das views
create user 'gerente'@localhost identified by '123';
grant all privileges on company_constraints.n_funcionario_dept_localidade to 'gerente'@localhost;
grant all privileges on company_constraints.lista_dept_gerentes to 'gerente'@localhost;
grant all privileges on company_constraints.projeto_maior_numero_funcionario to 'gerente'@localhost;
grant all privileges on company_constraints.projeto_departamento_gerentes to 'gerente'@localhost;
grant all privileges on company_constraints.gerente_dependente to 'gerente'@localhost;
-- Utilizando o usuário gerente escreva essa query:
use company_constraints;
select * from n_funcionario_dept_localidade;
select * from lista_dept_gerentes;
select * from projeto_maior_numero_funcionario;
select * from projeto_departamento_gerentes;
select * from gerente_dependente;
