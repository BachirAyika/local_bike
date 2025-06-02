SELECT staff_id,
    first_name,
    last_name,
    email,
    phone,
    CASE WHEN active = 1 THEN true else false end AS is_active,
    store_id,
    CASE WHEN manager_id = 'NULL' THEN null else manager_id end AS manager_id
FROM {{ source('local_bike_sales', 'staffs') }}