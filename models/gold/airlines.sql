{{
    config(
        materialized = 'table',
        unique_key = 'airline_key',
    )
}}

SELECT
    *
FROM
    {{ ref('slv_airlines_join_routes') }}