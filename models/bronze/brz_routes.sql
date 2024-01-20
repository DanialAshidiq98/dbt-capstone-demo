with source as (
      select * from {{ source('capstone', 'routes') }}
),
brz_routes as (
    select
        AIRLINE,
        AIRLINE_ID,
        SRC_AIRPORT,
        SRC_AIRPORT_ID,
        DST_AIRPORT,
        DST_AIRPORT_ID,
        CODESHARE,
        STOPS,
        EQUIPMENT

    from source
)
select * from brz_routes
  