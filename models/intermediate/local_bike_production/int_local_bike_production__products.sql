SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    b.brand_name
FROM {{ ref('stg_local_bike_production__products') }} as p
LEFT JOIN {{ ref('stg_local_bike_production__categories')}} as c 
    ON c.category_id = p.category_id
LEFT JOIN {{ ref('stg_local_bike_production__brands') }} as b 
    ON b.brand_id = p.brand_id