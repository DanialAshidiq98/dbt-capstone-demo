with source as (
      select * from {{ source('capstone', 'airlines') }}
),
brz_airlines_table as (
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
    where airline_id > 0
)
select * from brz_airlines_table
  