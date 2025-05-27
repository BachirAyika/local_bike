 {{ config(
    materialized = 'table'
) }}

with order_item_grouped_by_order as (
select order_id,
    item_id,
    order_status,
    order_date,
    required_date,
    SUM(list_price) as total_order_price,
    SUM(quantity) as total_items,
    count(distinct product_id) as total_distinct_items
from {{ ref('int_local_bike_sales__order_items') }}
group by order_id,
    item_id,
    order_status,
    order_date,
    required_date
)
SELECT oi.order_id,
    o.customer_id,
    s.store_id,
    s.store_name,
    s.city,
    s.state,
    oi.order_status,
    oi.order_date,
    oi.required_date,
    coalesce(oi.total_order_price,0) AS total_order_price,
    coalesce(oi.total_items,0) AS total_items,
    coalesce(oi.total_distinct_items,0) AS total_distinct_items
FROM order_item_grouped_by_order AS oi 
LEFT JOIN {{ ref('stg_local_bike_sales__orders') }} AS o 
    ON o.order_id = oi.order_id
LEFT JOIN {{ ref('stg_local_bike_sales__stores') }} AS s 
    ON o.store_id = s.store_id 





