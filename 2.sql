-- dirty read
select Врач_ID, Стаж from Врач
where Врач_ID = 1;

--2nd session:
-- update Врач set Стаж = 5 where Врач_ID = 1;

-- perform select again
