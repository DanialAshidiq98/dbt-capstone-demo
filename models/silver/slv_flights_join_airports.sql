with slv_flights_table as (
      select * from {{ref('slv_flights')}}
),

slv_airports as (
      select * from {{ref('slv_airports')}}
),

transformed as (
    select
        flt.*
        , air_origin.airport_id         AS origin_airport_id
        , air_origin.airport_name       AS origin_airport_name
        , air_origin.city               AS origin_airport_city
        , air_origin.country            AS origin_airports_country
        , air_dest.airport_id           AS dest_airport_id
        , air_dest.airport_name         AS dest_airport_name
        , air_dest.city                 AS dest_airport_city
        , air_dest.country              AS dest_airports_country
        , air_origin.latitude           AS origin_latitude
        , air_origin.longitude          AS origin_longitude
        , air_dest.latitude             AS dest_latitude
        , air_dest.longitude            AS dest_longitude
    from
    slv_flights_table flt
    inner join slv_airports air_origin on flt.origin = air_origin.iata
    inner join slv_airports air_dest   on flt.dest = air_dest.iata
)

select * from transformed