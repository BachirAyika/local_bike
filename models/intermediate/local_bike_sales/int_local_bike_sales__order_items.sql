SELECT oi.order_id,
    item_id, 
    list_price,
    quantity,
    product_id,
    o.customer_id,
    o.order_status,
    o.order_date,
    o.required_date
FROM
{{ ref('stg_local_bike_sales__order_items') }} AS oi
INNER JOIN
{{ ref('stg_local_bike_sales__orders') }} o
ON oi.order_id = o.order_id