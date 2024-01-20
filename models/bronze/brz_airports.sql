with source as (
      select * from {{ source('capstone', 'airports') }}
),
transformed as (
    select
        airport_id as id ,
        name as airport_name ,
        city,
        country,
        iata,
        icao,
        latitude,
        longitude,
        altitude,
        timezone,
        dst as destination,
        tz_database_time_zone as timezone_database,
        type as airport_type,
        source as src 

    from source
)
select * from transformed
  