SELECT customer_id,
    first_name,
    last_name,
    CASE WHEN phone = 'NULL' THEN null else phone end as phone,
    email,
    street,
    city,
    state
FROM {{ source('local_bike_sales', 'customers') }}