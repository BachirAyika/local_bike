SELECT *
FROM {{ source('local_bike_production', 'stocks') }}