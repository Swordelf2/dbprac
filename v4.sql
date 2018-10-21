drop view if exists V4;
create view V4 as (

with pat_year as (
    select Пациент_ID, cast(extract (year from Дата_рождения) as integer) as Год_рождения
    from Пациент
)

select pat_year.Год_рождения as "Год рождения",
count(pat_year.Пациент_ID) as "Кол-во пациентов",
(
    select Диагноз_ID
    from Лечение
    -- Фильтруем по году рождения
    where Пациент_ID in (
        select Пациент_ID
        from pat_year p
        where p.Год_рождения = pat_year.Год_рождения
    )
    group by Диагноз_ID
    order by count(Диагноз_ID) desc, Диагноз_ID asc
    limit 1
) as "Самый частый диагноз"

from pat_year
group by pat_year.Год_рождения
order by pat_year.Год_рождения

);
