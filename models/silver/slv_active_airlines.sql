with

slv_airlines_table_join_routes as (
    select * from {{ref('slv_airlines_join_routes')}}
),


number_of_active_airlines as (
    select
        a.airline_id,
        a.name,
        a.iata,
        a.icao,
        cast(count(a.country) as int) as active_airlines

    from slv_airlines_table_join_routes a
    where a.active_airline = 'true'
    group by 1,2,3,4
    order by 1
)

select * from number_of_active_airlines