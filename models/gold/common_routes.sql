{{
    config(
        materialized = 'table',
        unique_key = 'airline_key',
    )
}}

with airlines_routes as (
    SELECT
        *
    FROM
        {{ ref('slv_airlines_join_routes') }}
),

final as (
    select
        name,
        count(airline_id) as most_common_airline
    from airlines_routes
    where country in ('United States')
    group by 1
    order by 2 desc
)

select * from final
