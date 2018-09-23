select product.description as "Product Name", so.order_date as "Order Date", c.customer_id as "Customer ID", c.name as "Customer Name"
from sales_order so
    inner join item i on so.order_id = i.order_id
    inner join product on i.product_id = product.product_id
    inner join customer c on so.customer_id = c.customer_id

where not exists (
    select 1 from price
    where price.product_id = product.product_id and
        start_date <= order_date and
        (end_date is null or order_date < end_date)
    );
