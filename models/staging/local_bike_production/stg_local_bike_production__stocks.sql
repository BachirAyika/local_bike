SELECT store_id,
    product_id,
    CONCAT(store_id, '_', product_id) AS stock_id
    quantity AS stock_quantity
FROM {{ source('local_bike_production', 'stocks') }}