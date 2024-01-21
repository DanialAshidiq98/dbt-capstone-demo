{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'merge',
        unique_key = 'flight_id',
        on_schema_change = 'append_new_columns'
    )
}}

SELECT
    *
FROM
    {{ ref('slv_flights_enriched') }}