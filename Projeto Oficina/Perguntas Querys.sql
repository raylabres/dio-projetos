use oficina;
show tables;

-- Selects statement simples em cada tabela
-- Pergunta 1, quero ver os valores de cada, como fazer?
select * from cliente_fisico;
select * from cliente_juridico;
select * from equipe;
select * from mecanicos;
select * from os;
select * from pecas;
select * from pecas_compoe_valor;
select * from servicos_compoe_valor;
select * from veiculo;

-- Selects com where
-- Pergunta 2: Quais são meus clientes fisicos que tem Ray no nome?
select * from cliente_fisico where nome = 'Ray';
select * from cliente_fisico where nome like '%a%';
select * from cliente_fisico where nome like 'R%';
select * from cliente_fisico where nome like '%ay';
select * from cliente_fisico cf where cf.endereco like '%Rua%' union all select * from cliente_juridico cj  where cj.endereco like '%Rua%';
select * from veiculo where id_cliente_fisico_v_fk = 1;

-- Select utilizando Case
-- Pergunta 3: mostrar os veiculos os números dos clientes, quando for nulo mostrar não se aplica, como fazer?
select marca as Marca, modelo as Modelo, ano as Ano,
case when id_cliente_juridico_v_fk is null then 'Não se aplica' else id_cliente_juridico_v_fk end as Juridico,
case when id_cliente_fisico_v_fk is null then 'Não se aplica' else id_cliente_fisico_v_fk end as Fisico
from veiculo;

select nome as Nome, cpf as CPF,
case 
when especialidade = 'Motor' then 'Faz o motor'
when especialidade = 'Geral' then 'Serviço geral'
else 'Serviço simples'
end as Especialidade
from mecanicos;

-- Utilizando order by
-- Pergunta 4: Como order minhas ordens de serviços por crescente e descrente?
-- Pergunta 5: Como saber as datas de entrega dos meus serviços são menores ou iguais a data de hoje?
select * from os order by data_emissao;
select * from os order by data_emissao desc;
select * from os where data_entrega <= (select date(now())) order by data_entrega;

-- Utilizando groupy by e having
-- Pergunta 6: Quais são as peças que eu vendo no valor igual ou superior a 500 reais agrupados por nome?
-- Pergunta 7: Quais são os serviços que eu faço no valor igual ou superior a 300 reais agrupados por nome?
select nome as Nome, concat('R$', ' ', valor) as Preco, sum(valor) as Soma from pecas group by nome having sum(valor) >= 500;
select nome as Nome, concat('R$', ' ', valor) as Preco , sum(valor) as Soma from servicos group by nome having sum(valor) >= 300;

--  Utizando Joins
-- Pergunta 8: Quais são os donos dos veiculos?
select v.marca, v.modelo, v.ano, cf.nome, cj.razao_social from veiculo v 
left join cliente_fisico cf on v.id_cliente_fisico_v_fk = cf.id_cliente
left join cliente_juridico cj on v.id_cliente_juridico_v_fk = cj.id_cliente;

-- Pergunta 9: Quais servicos e pecas compoe essa os?
-- Pergunta 10: Como ver minha Os e os serviços e peças nela?
select p.nome, p.valor, pv.id_os_pcv_fk from pecas p inner join pecas_compoe_valor pv on p.id_pecas = pv.id_pecas_pcv_fk;
select s.nome, s.valor, sv.id_os_scv_fk from servicos s inner join servicos_compoe_valor sv on s.id_servicos = sv.id_servicos_scv_fk;

select o.id_os as Numero_OS, o.data_emissao as Data_emissao, o.data_entrega as Data_entrega, o.status_os as Status_OS, table_pecas.nome as Pecas, table_pecas.valor as Preco_pecas, table_servicos.nome as Servicos, table_servicos.valor as Preco_servico from os o
left join
(select p.nome, p.valor, pv.id_os_pcv_fk from pecas p inner join pecas_compoe_valor pv on p.id_pecas = pv.id_pecas_pcv_fk) as table_pecas
on o.id_os = table_pecas.id_os_pcv_fk
left join 
(select s.nome, s.valor, sv.id_os_scv_fk from servicos s inner join servicos_compoe_valor sv on s.id_servicos = sv.id_servicos_scv_fk) as table_servicos 
on o.id_os = table_servicos.id_os_scv_fk;


