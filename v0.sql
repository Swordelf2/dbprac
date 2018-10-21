create view Завершенные_лечения as (
    select Лечение_ID from Лечение
    -- Вычитаем те, что не завершены
    except all (
        select Лечение_ID
        from Лечение
            inner join Терапия using (Лечение_ID)
        where Окончание is null or Окончание >= current_date
    )
    -- Вычитаем те, в которых пациенты не вылечились
    -- (Запись в истории болезней с максимальной датой
    --     имеет "плохое' состояние
    except all (
        select Лечение_ID
        from (
            select Лечение_ID,
                max(Дата_изменения) as "Дата_изменения"
            from История_болезней
            group by Лечение_ID
        ) max_dates
            inner join История_болезней
                using (Лечение_ID, Дата_изменения)
        where Состояние_ID != (
            select Состояние_ID
            from Состояние
            where Описание = 'Хорошее'
        )
    )
);
