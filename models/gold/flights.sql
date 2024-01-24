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


-- fail: Triggers an error message when the source and target schemas diverge
-- append_new_columns: Append new columns to the existing table. 
        -- Note that this setting does not remove columns from the existing table that are not present in the new data.
-- sync_all_columns: Adds any new columns to the existing table, and removes any columns that are now missing. 
        -- Note that this is inclusive of data type changes. On BigQuery, changing column types requires a full table scan; be mindful of the trade-offs when implementing.
        -- Append new columns to the existing table. Note that this setting does not remove columns from the existing table that are not present in the new data.