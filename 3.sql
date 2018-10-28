-- extra!!
-- read committed incosistent snapshot

-- 1 session (any mode)
update Прием
    set Прием_ID = Прием_ID - 1;

-- 2 session (read committed)
delete from Прием where Прием_ID = 5 -- doesn't delete anything!
-- on higher isolation levels blocks
