drop view if exists V3;
create view V3 as (

select v.Врач_ID, count(ll.Успешно) as "Вылеченные пациенты",
count(ll.Лечение_ID) as "Всего пациентов"
from (
    select l.Лечение_ID, zl.Лечение_ID as Успешно
    from Терапия t
        inner join Лечение l using (Лечение_ID)
        left outer join Завершенные_лечения zl using (Лечение_ID)

    group by l.Лечение_ID, zl.Лечение_ID
    having current_date - min(t.Начало) <= 365
) ll
    inner join Терапия t using (Лечение_ID)
    inner join Прием p using (Терапия_ID)
    right outer join Врач v using (Врач_ID)

group by v.Врач_ID
order by v.Врач_ID

);
