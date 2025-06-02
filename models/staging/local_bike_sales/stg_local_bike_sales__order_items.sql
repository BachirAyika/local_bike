SELECT order_id,
    item_id,
    CONCAT(order_id,'_', item_id) AS order_item_id,
    product_id,
    quantity,
    list_price,
    discount,
    quantity * (list_price * (1 - discount)) total_order_item_amount
FROM {{ source('local_bike_sales', 'order_items') }}