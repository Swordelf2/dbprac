-- non-repeatable read
select Врач_ID, Стаж from Врач where Врач_ID = 1;

-- 2nd session:
-- update Врач set Стаж = (diff val) where Врач_ID = 1; 
-- commit;
