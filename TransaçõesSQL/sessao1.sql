-- sessão 1:

-- Q7 

-- 1
begin; 
set transaction isolation level read committed;

-- 2
begin; 
set transaction isolation level repeatable read;

-- consulta 1

select saldo_conta from conta where id_conta = 1;

commit;


-- Q8 

begin; 

-- 1 Phantom Read 
set transaction isolation level read committed;

-- 2
set transaction isolation level repeatable read;

select * from conta where saldo_conta > 1500;

commit;


-- Q9 

-- A read committed
begin;
set transaction isolation level read committed;

update conta set saldo_conta = saldo_conta + 100 where id_conta = 2;

commit;


-- B serializable

begin;
set transaction isolation level serializable;

update conta set saldo_conta = saldo_conta + 100 where id_conta = 3;

commit;

-- C 
rollback;