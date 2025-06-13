create table Cliente (
	id_cliente int primary key,
	nome_cliente varchar(100),
	cpf_cliente varchar(11)
);

create table Tipo_de_conta (
	id_tipo int primary key,
	nome_tipo varchar(100)
);

create table Conta (
	id_conta int primary key,
	saldo_conta int,
	id_cliente int references Cliente(id_cliente),
	id_tipo int references Tipo_de_conta(id_tipo)
);

insert into Cliente values (1, 'Maria', '11111'), (2, 'Paulo', '22222'), (3, 'Pedro', '33333');
insert into Tipo_de_conta values (1, 'Poupança'), (2, 'Corrente');
insert into Conta values (1, 1000, 1, 1), (2, 2000, 2, 2), (3, 3000, 3, 2);

create view vw_conta as 
select id_conta, nome_cliente "Nome do Cliente", saldo_conta "Saldo na Conta", nome_tipo "Tipo de Conta" from conta co
join cliente c on co.id_cliente = c.id_cliente
join tipo_de_conta tipo on co.id_tipo = tipo.id_tipo
order by c.id_cliente asc;

select * from vw_conta;


