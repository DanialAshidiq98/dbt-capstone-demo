with source as (
      select * from {{ source('capstone', 'flights') }}
),

brz_flights_table as (
    select * from source
)

select * from brz_flights_table

