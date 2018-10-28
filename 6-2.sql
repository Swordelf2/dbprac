begin isolation level serializable;
insert into t values
    (1, (select sum(val) from t where id = 0));
