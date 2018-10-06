select pat.Пациент_ID from Пациент pat
    inner join Лечение l on pat.Пациент_ID = l.Пациент_ID
    inner join Терапия t on l.Лечение_ID = t.Лечение_ID
    inner join Прием p on t.Терапия_ID = p.Терапия_ID
    inner join Врач v on p.Врач_ID = v.Врач_ID
    inner join Врач_Специализация vs on v.Врач_ID = vs.Врач_ID
group by pat.Пациент_ID
having count(distinct Специализация_ID) =
    (select count(Специализация_ID) from Специализация);
