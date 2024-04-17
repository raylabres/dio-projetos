create database transaction_bd;

create table orders (
	orderNumbers int,
    orderDate date,
    requiredDate date,
    shippedDate date,
    orderStatus enum('DESPACHADO', 'EM PROGRESSO', 'ENTREGUE'),
    customer int,
	primary key(orderNumbers)
);

show tables;

select * from orders;
insert into orders values (1, '2000-01-01', '2000-02-02', '2000-03-03', 'DESPACHADO', 1);