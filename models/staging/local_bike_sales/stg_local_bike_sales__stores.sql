SELECT *
FROM {{ source('local_bike_sales', 'stores') }}