with airports as (
      select * from {{ ref('brz_airports') }}
),

planes as (
    select * from {{ref('brz_planes')}}
),


slv_airports_table as (
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
        dst as dst_airport,
        tz_database_time_zone as timezone_database,
        type as airport_type,
        source as src_airport 

    from airports
),

transformed as (
    select * from planes
)


select * from slv_airports_table