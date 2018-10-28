-- extra!!
-- serialization problem
-- mydb database!
delete from t;
insert into t values
    (0, 10), (1, 10);

begin isolation level serializable;
insert into t values
    (0, (select sum(val) from t where id = 1));

