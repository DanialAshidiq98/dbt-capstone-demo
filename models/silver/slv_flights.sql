with source as (
      select * from {{ref('brz_flights')}}
),


transformed as (
    select
        year
        ,month
        ,dayofmonth                                     AS day_of_month
        ,dayofweek                                      AS day_of_week
        ,{{remove_NA_values_timestamp('deptime')}}      AS dep_time
        ,{{type_to_time('crsdeptime')}}                 AS crs_dep_time
        ,{{remove_NA_values_timestamp('arrtime')}}      AS arr_time
        ,{{type_to_time('crsdeptime')}}                 AS crs_arr_time
        , uniquecarrier                                 AS unique_carrier
        , flightnum                                     AS flight_num
        , tailnum                                       AS tail_num
        , {{remove_NA_values_int('actualelapsedtime')}} AS actual_elapsed_time
        , {{remove_NA_values_int('crselapsedtime')}}    AS crs_elapsed_time
        , airtime                                       AS air_time
        , {{remove_NA_values_int('arrdelay')}}          AS arr_delay
        , {{remove_NA_values_int('depdelay')}}          AS dep_delay
        , origin
        , dest
        , distance
        , {{remove_NA_values_int('taxiin')}}            AS taxi_in
        , {{remove_NA_values_int('taxiout')}}           AS taxi_out
        , cancelled
        , cancellationcode                              AS cancellation_code
        , diverted      
        , carrierdelay                                  AS carrier_delay 
        , weatherdelay                                  AS weather_delay
        , nasdelay                                      AS nas_delay
        , securitydelay                                 AS security_delay
        , lateaircraftdelay                             AS late_aircraft_delay
    from source
), 

slv_flights_table AS(
    SELECT
        {{ dbt_utils.generate_surrogate_key(['crs_dep_time', 'arr_time', 'crs_arr_time',get_unique_id(12), get_unique_id(10) ]) }} as flight_id,
        *
        , (distance * 1.6) AS distance_in_km
        , TIMESTAMPDIFF(SECONDS, dep_time, arr_time) AS difference_seconds
    FROM
        transformed
    where difference_seconds > 0
)

select * from slv_flights_table