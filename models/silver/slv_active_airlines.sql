with

slv_airlines_table_join_routes as (
    select * from {{ref('slv_airlines_join_routes')}}
),


number_of_active_airlines as (
    select DISTINCT
        a.airline_id,
        a.name,
        a.iata,
        a.icao,
        a.planes_name,
        a.country,
        cast(count(a.name) as int) as active_airlines

    from slv_airlines_table_join_routes a
    where a.active_airline = 'true'
    AND planes_name is not null
    group by 1,2,3,4,5,6
    order by 2
)

select * from number_of_active_airlines