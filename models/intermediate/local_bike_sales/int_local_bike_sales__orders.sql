select order_id,
    o.customer_id,
    c.city,
    c.state,
    order_status,
    order_date,
    store_id,
    staff_id,
    sum(quantity) as total_item_quantity,
    sum(total_order_item_amount) as total_order_amount
from {{ ref('int_local_bike_sales__order_items') }} AS o
left join {{ ref('stg_local_bike_sales__customers') }} as c 
    ON c.customer_id = o .customer_id
group by order_id,
    customer_id,
    city,
    state,
    order_status,
    order_date,
    store_id,
    staff_id





