with source as (
      select * from {{ source('capstone', 'flights') }}
),

brz_flights_table as (
    select * from source
    where deptime != arrtime
)

select * from brz_flights_table

