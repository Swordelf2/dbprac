with caries as (
    select Лечение_ID, Пациент_ID from Лечение l
    where Диагноз_ID = (
        select Диагноз_ID from Диагноз
        where Название = 'Кариес')
)

select (
-- consider keyword 'distinct' in 'count'
select count(c.Лечение_ID) from caries c
    inner join Пациент p on c.Пациент_ID = p.Пациент_ID
    inner join История_болезней i on p.Пациент_ID = i.Пациент_ID
where i.Состояние_ID = (
    select Состояние_ID from Состояние
    where Описание = 'Умер')
)
* 100.0 /
case when (select count(Лечение_ID) from caries) = 0 then
    1
else
    (select count(Лечение_ID) from caries)
end as "Процент смертности от кариеса";
