SELECT *
FROM {{ source('local_bike_sales', 'order_items') }}