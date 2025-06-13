-- sessão 2:

-- Q7 

-- 1

begin;
set transaction isolation level read committed;

update conta set saldo_conta = 1200 where id_conta = 1;

commit;

-- 2 

begin; 
set transaction isolation level repeatable read;

update conta set saldo_conta = 1400 where id_conta = 1;

commit;


-- Q8

begin;

-- 1 
set transaction isolation level read committed;

insert into conta values (4, 2500, 1, 1);

-- 2
set transaction isolation level repeatable read;

insert into conta values (5, 2800, 2, 2);

commit;

-- Q9

-- A read committed
begin;
set transaction isolation level read committed;

update conta set saldo_conta = saldo_conta + 200 where id_conta = 2;

commit;


-- B serializable

begin;
set transaction isolation level serializable;

update conta set saldo_conta = saldo_conta + 200 where id_conta = 3;


-- C
commit;
