select c.state as "State",
sum(
    case when so.total is not null then
        so.total
    else
        0
    end
) as "Purchase Sum"

from customer c
    inner join sales_order so on c.customer_id = so.customer_id

group by c.state
order by "Purchase Sum" desc
limit 1;
