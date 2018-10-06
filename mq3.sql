-- Определить врачей, под наблюдением которых умирали больные
select distinct v.Врач_id from История_болезней i
    inner join Лечение l on i.Пациент_ID = l.Пациент_ID
    inner join Терапия t on l.Лечение_ID = t.Лечение_ID
            and (i.Дата_изменения between
            t.Начало and t.Окончание)
    inner join Прием p on p.Терапия_ID = t.Терапия_ID
    inner join Врач v on p.Врач_ID = v.Врач_ID
where Состояние_ID = (
    select Состояние_ID from Состояние
    where Описание = 'Умер')
