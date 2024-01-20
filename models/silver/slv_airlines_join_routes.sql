with airlines as (
      select * from {{ ref('brz_airlines') }}
),

routes as (
    select * from {{ ref('brz_routes')}}
),

slv_airlines_table_join_routes as (

    select
        a.airline_id,
        a.name,
        a.alias,
        a.iata,
        a.icao,
        a.country,
        a.active_airline,
        b.src_airport,
        b.src_airport_id,
        b.dst_airport,
        b.dst_airport_id,
        b.codeshare,
        b.stops,
        b.equipment

    from airlines a
    left join routes b on a.airline_id = b.airline_id
    where active_airline = 'true'
    order by 1
)

select * from slv_airlines_table_join_routes


