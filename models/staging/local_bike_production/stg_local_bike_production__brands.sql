SELECT *
FROM {{ source('local_bike_production', 'brands') }}