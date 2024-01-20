with source as (
      select * from {{ source('capstone', 'routes') }}
),
brz_routes_table as (
    select
        airline,
        airline_id,
        src_airport,
        src_airport_id,
        dst_airport,
        dst_airport_id,
        codeshare,
        stops,
        equipment

    from source
)
select * from brz_routes_table
  