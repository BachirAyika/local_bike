SELECT order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    CASE WHEN shipped_date = 'NULL' THEN null else shipped_date end AS shipped_date,
    store_id,
    staff_id
FROM {{ source('local_bike_sales', 'orders') }}