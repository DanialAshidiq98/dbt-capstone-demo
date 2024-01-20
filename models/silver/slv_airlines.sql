with airlines as (
      select * from {{ ref('brz_airlines') }}
),


transformed as (

    select
        airline_id,
        name,
        alias,
        iata,
        icao,
        callsign,
        country,
        active_airline
    from airlines
)

select * from transformed