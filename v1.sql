drop view if exists V1;
create view V1 as (

select p.Врач_ID, l.Пациент_ID,
max(t.Окончание) - min(t.Начало) as "Время лечения"
from Прием p
    inner join Терапия t using (Терапия_ID)
    -- Оставляем только вылечевшихся
    inner join Завершенные_лечения using (Лечение_ID)
    inner join Лечение l using (Лечение_ID)
group by p.Врач_ID, l.Пациент_ID

);
