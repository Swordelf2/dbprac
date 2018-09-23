select so.order_id, i.item_id, so.order_date, p.start_date, p.end_date, p.list_price, i.quantity, so.total
from sales_order so
    inner join item i on so.order_id = i.order_id
    inner join product on i.product_id = product.product_id
    inner join price p on product.product_id = p.product_id
where so.order_id = 509
order by order_id, item_id;
