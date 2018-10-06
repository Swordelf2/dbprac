-- Определить заболевания, для которых врачи назначали несколько разных видов терапии
select distinct l.Диагноз_ID from Лечение l
    inner join Терапия t on l.Лечение_ID = t.Лечение_ID
group by l.Диагноз_ID, l.Лечение_ID
having count(distinct Вид_терапии_ID) > 1;
