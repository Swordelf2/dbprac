select so.order_id, sum(i.quantity * price.list_price) as "Item-by-item Sum", so.total as "Listed Sum"
from sales_order so
    inner join item i on so.order_id = i.order_id
    inner join product on i.product_id = product.product_id
    inner join price on i.product_id = price.product_id and
        so.order_date >= price.start_date and (price.end_date is null or so.order_date < price.end_date)
group by so.order_id
having abs(sum(i.quantity * price.list_price) - so.total) >= 0.01
order by so.order_id;
