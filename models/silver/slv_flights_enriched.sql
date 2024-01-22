with flights_info_joins as (
    select
        *
    from
        {{ ref('slv_flights_join_airports') }}
), 


slv_flight_table_enriched as (
    select
        *
        ,cast(
            (
                year || '-' || month || '-' || day_of_month
            ) as date) as flight_date
        {% for column in ['dep_time', 'crs_dep_time', 'arr_time', 'crs_arr_time'] %}
        ,cast(
            (
                flight_date || ' ' || {{ get_as_time_format(column) }}
            ) as string)  as {{ column }}_timestamp
        {% endfor %}
        , round({{ get_distance_of_two_points('origin_latitude', 'origin_longitude', 'dest_latitude', 'dest_longitude', 'km') }},2) as airport_distance_in_km
    from
        flights_info_joins
),

slv_flight_table_enriched_2 as (
    select
        *,
        round( {{calculate_speed('airport_distance_in_km','difference_seconds')}}  , 2) as speed_in_km_h
    from slv_flight_table_enriched
)


select
    *
from
    slv_flight_table_enriched_2
    