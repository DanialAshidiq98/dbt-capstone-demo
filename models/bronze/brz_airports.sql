with source as (
      select * from {{ source('capstone', 'airports') }}
),
brz_airports_table as (
    select
        airport_id,
        name,
        city,
        country,
        iata,
        icao,
        latitude,
        longitude,
        altitude,
        timezone,
        dst,
        tz_database_time_zone,
        type,
        source 

    from source
)
select * from brz_airports_table
  