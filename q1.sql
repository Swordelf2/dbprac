select l.Лечение_ID from Лечение l
    inner join Терапия t on
        l.Лечение_ID = t.Терапия_ID
group by l.Лечение_ID
having (max(t.Окончание) - min(t.Начало)) < 30
