-- other constraints
alter table Врач
add column Номер_телефона char(10)
    check (Номер_телефона is null or
    ((substring(Номер_телефона from 1 for 1) = '9') and
    Номер_телефона ~ '^[0-9]+$'));
