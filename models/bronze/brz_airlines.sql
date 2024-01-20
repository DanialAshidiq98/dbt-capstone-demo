with source as (
      select * from {{ source('capstone', 'airlines') }}
),
brz_airlines as (
    select
        airline_id,
        name,
        alias,
        iata,
        icao,
        callsign,
        country,
        active as active_airline

    from source
)
select * from brz_airlines
  