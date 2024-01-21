{{
    config(
        materialized = 'table',
        unique_key = 'airline_id',
    )
}}

SELECT
    *
FROM
    {{ ref('slv_active_airlines') }}