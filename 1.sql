-- lost changes

-- concurrent execution of 2 or more of these transactions
--     may lead to lost changes
update Врач
    set Стаж = Стаж + 1;
