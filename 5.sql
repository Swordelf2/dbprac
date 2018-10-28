-- phantom

begin isolation level read committed;
select Врач_ID, Стаж from Врач where Стаж = 7;
