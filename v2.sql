drop view if exists V2;
create view V2 as (

select ss.Название as "Социальный статус",
"Месяц завершения",
d.Название,
count(distinct p.Пациент_ID) as "Кол-во вылечевшихся пациентов"
from (
    select l.Лечение_ID, l.Пациент_ID, l.Диагноз_ID,
    to_char(max(t.Окончание), 'YYYY-MM') as "Месяц завершения"
    from Лечение l
        -- Оставляем только вылечевшихся
        inner join Завершенные_лечения using (Лечение_ID)
        inner join Терапия t using (Лечение_ID)
    group by l.Лечение_ID
) ll
    inner join Пациент p using (Пациент_ID)
    inner join Социальный_статус ss using (Социальный_статус_ID)
    inner join Диагноз d using (Диагноз_ID)

group by ss.Название, "Месяц завершения", d.Название
order by "Социальный статус", "Месяц завершения", d.Название

);
