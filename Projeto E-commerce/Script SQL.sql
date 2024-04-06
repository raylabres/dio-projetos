create database ecommerce;
use ecommerce;
show tables;

-- Criando a tabela produto
create table produto (
	id_produto int auto_increment primary key,
    categoria varchar(45) not null,
    descricao varchar(45) not null,
    valor float not null
);

-- Criando a tabela de vendedores terceiros
create table vendedor_terceiro (
	id_terceiro int auto_increment primary key,
    razao_social varchar(45) not null
);

-- Criando a tabela de fornecedores
create table fornecedores (
	id_fornecedores int auto_increment primary key,
    razao_social varchar(45) not null,
    cnpj varchar(45) not null
);

-- Criando a tabela Estoque
create table estoque (
	id_estoque int auto_increment primary key,
    local varchar(45) not null
);

-- Criando a tabela pedido
create table pedido (
	id_pedido int auto_increment primary key,
    satus varchar(10) not null default('Pendente'),
    descricao varchar(45) not null,
    frete float not null,
    codigo_rastreio varchar(45) not null
);

-- Criando tabela vendedor_vende_produto 
create table vendedor_vende_produto (
	id_produto_vvp_fk int not null,
    id_terceiro_vvp_fk int not null,
    quantidade int,
    foreign key(id_produto_vvp_fk) references produto(id_produto),
    foreign key(id_terceiro_vvp_fk) references vendedor_terceiro(id_terceiro)
);

-- Criando tabela disponibiliza_produto
create table disponibiliza_produto (
	id_fornecedores_dp_fk int,
    id_produto_dp_fk int,
    foreign key (id_produto_dp_fk) references fornecedores(id_fornecedores),
    foreign key (id_produto_dp_fk) references produto(id_produto)
);

-- Criando a tabela produto_em_estoque
create table produto_em_estoque (
	id_produto_pee_fk int,
    id_estoque_pee_fk int,
	foreign key (id_produto_pee_fk) references  produto(id_produto),
    foreign key (id_estoque_pee_fk) references estoque(id_estoque)
);

-- Criando a tabela relacao_produto_pedido 
create table relacao_produto_pedido (
	id_pedido_rpp_fk int,
    id_produto_rpp_fk int,
    quantidade int,
	foreign key (id_produto_rpp_fk) references  produto(id_produto),
    foreign key (id_pedido_rpp_fk) references pedido(id_pedido)
);

-- Criando a tabela pagamento
create table pagamento (
	id_pagamento int auto_increment,
    tipo_pagamento enum('Boleto', 'Cartão') not null,
    status_pagamento enum('Pago', 'Pendente') default('Pendente') not null,
    id_pedido_p_fk int,
    primary key (id_pagamento),
    foreign key (id_pedido_p_fk) references pedido(id_pedido)
);

-- Criando a tabela cliente_fisico
create table cliente_fisico (
	id_cliente int auto_increment,
    nome varchar(45) not null,
    cpf char(11),
    edereco varchar(45),
    data_nascimento date,
    id_pedido_cf_fk int,
    primary key (id_cliente),
    foreign key (id_pedido_cf_fk) references pedido(id_pedido)
);

-- Criando a tabela cliente_juridico
create table cliente_juridico (
	id_cliente int auto_increment,
    razao_social varchar(45) not null,
    cnpj char(14),
    edereco varchar(45),
    id_pedido_cf_fk int,
    primary key (id_cliente),
    foreign key (id_pedido_cf_fk) references pedido(id_pedido)
);

show tables;