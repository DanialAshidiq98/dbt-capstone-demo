with

slv_airlines_table_join_routes as (
    select * from {{ref('slv_airlines_join_routes')}}
),


number_of_active_airlines as (
    select 
        a.name,
        count(a.country) as active_airlines
    from slv_airlines_table_join_routes a
    group by 1
)

select * from number_of_active_airlines