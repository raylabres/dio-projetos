show databases;
use transaction_bd;

create table orderDetails (
	orderNumbers int,
    productCode varchar(255),
    quatityOrder int,
    price varchar(255),
    foreign key (orderNumbers) references orders(orderNumbers),
    primary key (orderNumbers, productCode)
);
desc orders;
desc orderDetails;

select @@autocommit; -- se igual 1 toda ação que executa vai ser executa automáticamente

-- setar autocommit como off ou false ou 0

set @@autocommit = 0;  -- Agora a ação que executar só vai ser executada se eu dar um commit

start transaction;
	select @orderNumbers:= max(orderNumbers) + 1
    from orders;
    -- select orderNumbers as Number;
    insert into orders values (@orderNumbers, '2000-01-01', '2000-02-02', '2000-03-03', 'EM PROGRESSO', 1),
    (@orderNumbers + 1, '2000-01-01', '2000-02-02', '2000-03-03', 'EM PROGRESSO', 1);
    
	select @orderNumbers:= max(orderNumbers) + 1
    from orders;
	insert into orderDetails values 
	(@orderNumbers, '181_749', '30', '150'),
	(@orderNumbers + 1, '181_500', '50', '200');

set @@autocommit = 0;

insert into orders values (9, '2000-01-01', '2000-02-02', '2000-03-03', 'EM PROGRESSO', 1);
select * from orders;
select * from orderDetails;
commit;
