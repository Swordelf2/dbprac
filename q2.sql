with get_disabled as (
    select Социальный_статус_ID from Социальный_статус
    where Название = 'Инвалид')
select Врач_ID from Врач
except
select v.Врач_ID from Врач v
    left outer join Прием p on v.Врач_ID = p.Врач_ID
    left outer join Терапия t on p.Терапия_ID = t.Терапия_ID
    left outer join Лечение l on t.Лечение_ID = l.Лечение_ID
    left outer join Пациент pat on l.Пациент_ID = pat.Пациент_ID
where pat.Социальный_статус_ID != (
        select Социальный_статус_ID from Социальный_статус
        where Название = 'Инвалид') or
    pat.Социальный_статус_ID is null;
