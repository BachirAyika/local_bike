select oi.order_id,
    oi.order_item_id,
    o.customer_id,
    o.order_status,
    o.order_date,
    o.store_id,
    o.staff_id,
    oi.product_id,
    quantity,
    list_price,
    discount,
    total_order_item_amount
from {{ ref('stg_local_bike_sales__order_items') }} AS oi
left join {{ ref('stg_local_bike_sales__orders') }} AS o 
    ON o.order_id = oi.order_id 