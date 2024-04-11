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
