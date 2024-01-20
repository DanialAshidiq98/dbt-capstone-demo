with source as (
      select * from {{ source('capstone', 'flights') }}
),
transformed as (
    select
        year
        ,month
        ,dayofmonth  AS day_of_month
        ,dayofweek   AS day_of_week
        ,{{return_null('deptime')}} AS dep_time
        ,cast(crsdeptime as timestamp) as crs_dep_time
        ,case 
            when arrtime not in ('NA') 
            then cast(arrtime as timestamp)
            end AS arr_time
        , cast(crsarrtime as timestamp)  AS crs_arr_time
        , uniquecarrier                  AS unique_carrier
        , flightnum                      AS flight_num
        , tailnum                        AS tail_num
        , case 
            when actualelapsedtime not in ('NA') 
            then cast(actualelapsedtime as int)
            end AS actaul_elapsed_time
        , crselapsedtime                 AS crs_elapsed_time
        , airtime                        AS air_time
        , case 
            when arrdelay not in ('NA') 
            then cast(arrdelay as int)
            end AS arr_delay
        , case 
            when depdelay not in ('NA') 
            then cast(depdelay as int)
            end AS dep_delay
        , origin
        , dest 
        , distance
        , case 
            when taxiin not in ('NA') 
            then cast(taxiin as int)
            end AS taxi_in
        , case 
            when taxiout not in ('NA') 
            then cast(taxiout as int)
            end AS taxi_out
        , cancelled
        , cancellationcode          AS cancellation_code
        , diverted      
        , carrierdelay              AS carrier_delay 
        , weatherdelay              AS weather_delay
        , nasdelay                  AS nas_delay
        , securitydelay             AS security_delay
        , lateaircraftdelay         AS late_aircraft_delay
    from source
), 

brz_flight_table AS(
    SELECT
        {{ dbt_utils.generate_surrogate_key(['crs_dep_time', 'arr_time', 'crs_arr_time',get_unique_id(12), get_unique_id(10) ]) }} as flight_id,
        *
        , (distance * 1.6) AS distance_in_km
    FROM
        transformed
)

select * from brz_flight_table
  