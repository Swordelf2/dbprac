-- Найти самое длительное лечение какого-либо вида рака
select l.Лечение_ID,
(max(
    case when t.Окончание is not null then
        t.Окончание
    else
        current_date
    end
) - min(t.Начало)) as "Длительность лечения, д."
from Лечение l
    inner join Терапия t on l.Лечение_ID = t.Лечение_ID
where l.Диагноз_id in (
    select Диагноз_id from Диагноз
    where position('Рак' in Название) != 0 or
            position('рак' in Название) != 0)

group by l.Лечение_ID
order by "Длительность лечения, д." desc
limit 1;
