create database oficina;
use oficina;

-- Criando tabela cliente_fisico
create table cliente_fisico (
	id_cliente int auto_increment,
    nome varchar(30) not null,
    cpf char(11) not null,
    endereco varchar(45) not null,
    primary key (id_cliente)
);

-- Criando tabela cliente_juridico
create table cliente_juridico (
	id_cliente int auto_increment,
    razao_social varchar(45) not null,
    cnpj char(14) not null,
    endereco varchar(45) not null,
    primary key(id_cliente)
);

-- Criando tabela equipe
create table equipe (
	id_equipe int auto_increment,
    numero_equipe int not null,
    nome_equipe varchar(45) not null,
    primary key(id_equipe)
);

-- Criando tabela mecanicos
create table mecanicos (
	id_mecanicos int auto_increment,
    nome varchar(45) not null,
    cpf char(14) not null,
    especialidade varchar(45) not null,
    id_equipe_m_fk int,
    primary key(id_mecanicos),
    foreign key (id_equipe_m_fk) references equipe(id_equipe) 
);

-- Criando tabela pecas 
create table pecas (
	id_pecas int auto_increment,
    nome varchar(45) not null,
    valor float not null,
    primary key (id_pecas)
);

-- Criando tabela Os
create table os (
	id_os int auto_increment,
    data_entrega date not null,
    status_os enum('Pendente', 'Aprovado', 'Executado') default('Pendente'),
    data_emissao date not null,
    primary key(id_os)
);

-- Criando tabela pecas_compoe_valor
create table pecas_compoe_valor (
	id_pecas_pcv_fk int,
    id_os_pcv_fk int,
    foreign key(id_pecas_pcv_fk) references pecas(id_pecas),
    foreign key (id_os_pcv_fk) references os(id_os)
);

-- Criando tabela servicos
create table servicos (
	id_servicos int auto_increment,
    nome varchar(45) not null,
    valor float not null,
    primary key(id_servicos)
);

-- Criando a tabela servicos_compoe_valor
create table servicos_compoe_valor (
	id_os_scv_fk int,
    id_servicos_scv_fk int,
    foreign key (id_os_scv_fk) references os(id_os),
    foreign key (id_servicos_scv_fk) references servicos(id_servicos)
);

-- Criando tabela veiculo
create table veiculo (
	id_veiculo int auto_increment,
    marca varchar(20) not null,
    modelo varchar(20) not null,
    ano int not null,
    id_cliente_juridico_v_fk int,
    id_cliente_fisico_v_fk int,
    id_equipe_v_fk int,
    id_os_v_fk int,
    primary key(id_veiculo),
    foreign key (id_cliente_juridico_v_fk) references cliente_juridico(id_cliente),
    foreign key (id_cliente_fisico_v_fk) references cliente_fisico(id_cliente),
    foreign key (id_equipe_v_fk) references equipe(id_equipe),
    foreign key (id_os_v_fk) references os(id_os)
);


show tables;

-- Inserindo valores da cliente_fisico
insert into cliente_fisico (nome, cpf, endereco) values (
	'Ray', '12345678910', 'Rua São Paulo'
);

insert into cliente_fisico (nome, cpf, endereco) values (
	'Emily', '45678912356', 'Rua 35 de Março'
);

insert into cliente_fisico (nome, cpf, endereco) values (
	'Helio', '77889911145', 'Rua São Paulo'
);

-- Inserindo valores na cliente juridico
insert into cliente_juridico (razao_social, cnpj, endereco) values (
	'ALP corporation', '1234567891122', 'Districo Comercial'
);

insert into cliente_juridico (razao_social, cnpj, endereco) values (
	'Consultoria Premium', '9988814567711', 'Rua Santa Marta'
);

insert into cliente_juridico (razao_social, cnpj, endereco) values (
	'Irani', '11112222333344', 'Av Getulio Vargas'
);

-- Inserindo valores na equipe
insert into equipe (numero_equipe, nome_equipe) values (
	1, 'Revisao'
);

insert into equipe (numero_equipe, nome_equipe) values (
	2, 'Manutencao'
);

insert into equipe (numero_equipe, nome_equipe) values (
	3, 'Conserto'
);

-- Inserindo valores na mecanicos 
insert into mecanicos (nome, cpf, especialidade, id_equipe_m_fk) values (
	'Andre', 12345678912, 'Motor', 3
);

insert into mecanicos (nome, cpf, especialidade, id_equipe_m_fk) values (
	'Pedro', 15375689902, 'Motor', 3
);

insert into mecanicos (nome, cpf, especialidade, id_equipe_m_fk) values (
	'João', 17395681911, 'Motor', 3
);

insert into mecanicos (nome, cpf, especialidade, id_equipe_m_fk) values (
	'Gustavo', 34567812345, 'Troca de Oleo', 2
);

insert into mecanicos (nome, cpf, especialidade, id_equipe_m_fk) values (
	'Lucas', 00112233781, 'Geral', 2
);

insert into mecanicos (nome, cpf, especialidade, id_equipe_m_fk) values (
	'Guilherme', 88899911132, 'Geral', 1
);

-- Inserindo valores na pecas
insert into pecas (nome, valor) values (
	'Parachoque', 200.00 
);

insert into pecas (nome, valor) values (
	'Cambio', 500.00
);

insert into pecas (nome, valor) values (
	'Lanterna', 100.00
);

insert into pecas (nome, valor) values (
	'Pistao', 1000.00
);

insert into pecas (nome, valor) values (
	'Vela de Ignicao', 800.00
);

-- Inserindo valores servicos
insert into servicos (nome, valor) values (
	'Troca de Oleo', 250.00
);

insert into servicos (nome, valor) values (
    'Tampar Vazamento', 300.00
);

insert into servicos (nome, valor) values (
    'Fazer Motor', 2000.00
);

insert into servicos (nome, valor) values (
    'Revisao simples', 300.00
);

insert into servicos (nome, valor) values (
    'Revisao completa', 600.00
);

insert into servicos (nome, valor) values (
    'Manutencao padrao', 200.00
);

-- Inserindo valores os
insert into os (data_entrega, status_os, data_emissao) values (
	'2024-05-01', default, '2024-04-01'
);

insert into os (data_entrega, status_os, data_emissao) values (
	'2024-04-20', 'Aprovado', '2024-04-01'
);

insert into os (data_entrega, status_os, data_emissao) values (
	'2024-01-10', 'Executado', '2024-01-01'
);

insert into os (data_entrega, status_os, data_emissao) values (
	'2024-02-20', 'Executado', '2024-02-15'
);

insert into os (data_entrega, status_os, data_emissao) values (
	'2024-02-20', 'Executado', '2024-02-15'
);


-- Inserindo valores em pecas_compoe_valor
insert into pecas_compoe_valor (id_pecas_pcv_fk, id_os_pcv_fk) values (
	4, 1
);

insert into pecas_compoe_valor (id_pecas_pcv_fk, id_os_pcv_fk) values (
	2, 2
);

insert into pecas_compoe_valor (id_pecas_pcv_fk, id_os_pcv_fk) values (
	2, 4 
);

insert into pecas_compoe_valor (id_pecas_pcv_fk, id_os_pcv_fk) values (
	1, 4
);

insert into pecas_compoe_valor (id_pecas_pcv_fk, id_os_pcv_fk) values (
	3, 5
);

-- Inserindo valores em servicos_compoe_valor
insert into servicos_compoe_valor (id_os_scv_fk, id_servicos_scv_fk) values (
	3, 1
);

insert into servicos_compoe_valor (id_os_scv_fk, id_servicos_scv_fk) values (
	2, 6
);

insert into servicos_compoe_valor (id_os_scv_fk, id_servicos_scv_fk) values (
	4, 6
);

insert into servicos_compoe_valor (id_os_scv_fk, id_servicos_scv_fk) values (
	1, 3
);

insert into servicos_compoe_valor (id_os_scv_fk, id_servicos_scv_fk) values (
	5, 4
);

-- Inserindo valores no veiculo
insert into veiculo (marca, modelo, ano, id_cliente_fisico_v_fk, id_cliente_juridico_v_fk, id_equipe_v_fk, id_os_v_fk) values (
	'Chevrolet', 'Celta', 2005, 1, null, 2, 3
);

insert into veiculo (marca, modelo, ano, id_cliente_juridico_v_fk, id_cliente_fisico_v_fk, id_equipe_v_fk, id_os_v_fk) values (
	'Fiat', 'Toro', 2024, 3, null, 3, 1
);

insert into veiculo (marca, modelo, ano, id_cliente_fisico_v_fk, id_cliente_juridico_v_fk,id_equipe_v_fk, id_os_v_fk) values (
	'BMW', 'X4', 2022, 2, null, 2, 4
);

insert into veiculo (marca, modelo, ano, id_cliente_juridico_v_fk, id_cliente_fisico_v_fk, id_equipe_v_fk, id_os_v_fk) values (
	'Fiat', 'Uno', 2003, 3, null, 2, 2
);

insert into veiculo (marca, modelo, ano, id_cliente_fisico_v_fk, id_cliente_juridico_v_fk,id_equipe_v_fk, id_os_v_fk) values (
	'Fiat', 'Argo', 2023, 3, null, 1, 5
);

use oficina;
show tables;
select * from cliente_fisico;
select * from cliente_juridico;
select * from equipe;
select * from mecanicos order by id_equipe_m_fk;
select * from pecas;
select * from servicos;
select * from os;
select * from pecas_compoe_valor;
select * from servicos_compoe_valor;
select * from veiculo;
