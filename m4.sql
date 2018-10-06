delete from Врач v
where not exists (
    select Врач_ID from Врач_Специализация
    where Врач_ID = v.Врач_ID)
and
not exists (
    select Врач_ID from Прием
    where Врач_ID = v.Врач_ID);
