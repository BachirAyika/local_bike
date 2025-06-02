SELECT s.stock_id,
    s.store_id, 
    st.store_name,
    s.product_id, 
    p.product_name,
    s.stock_quantity
FROM {{ ref('stg_local_bike_production__stocks') }} AS s
left join {{ ref('stg_local_bike_sales__stores') }} AS st 
    on st.store_id = s.store_id
left join {{ ref('stg_local_bike_production__products') }} AS p 
    on p.product_id = s.product_id