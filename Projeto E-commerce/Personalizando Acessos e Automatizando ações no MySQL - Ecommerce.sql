use ecommerce;
show tables;
desc cliente_fisico;

-- Criando a tabela para armazenar as informações que o usuário deletar
create table salva_informacoes_usuario (
id_cliente	int(11),
nome varchar(45),
cpf	char(11),
edereco	varchar(45),
data_nascimento	date,
id_pedido_cf_fk int(11)
);

-- Criando a trigger para armazenar os dados deletados
-- drop trigger deleta_usuario;
delimiter \\
create trigger deleta_usuario before delete on cliente_fisico
for each row 
begin
	insert into salva_informacoes_usuario(id_cliente, nome, cpf, edereco, data_nascimento, id_pedido_cf_fk)
    values (old.id_cliente, old.nome, old.cpf, old.edereco, old.data_nascimento, old.id_pedido_cf_fk);
end \\
delimiter ;

-- Inserindo valores na tabela pedido e cliente_fisico
insert into pedido values (2, default, 'nada', 130.00, '11212121');
insert into cliente_fisico(nome, cpf, edereco, data_nascimento, id_pedido_cf_fk) values ('Ray', 12345678911, 'Salto', '2004-08-08', 1);


-- deletando o usuário
delete from cliente_fisico where id_cliente = 4;

select * from salva_informacoes_usuario;


-- Criando trigger para company_constraints para salário