with airlines as (
      select * from {{ ref('brz_airlines') }}
),

routes as (
    select * from {{ ref('brz_routes')}}
),

planes as (
    select * from {{ref('brz_planes')}}
),


routes_enriched as (
    select * 
    from routes a
    left join planes b on a.equipment = b.ISO_CODE
),


slv_airlines_table_enriched as (

    select
        a.airline_id,
        a.name,
        a.alias,
        a.iata,
        a.icao,
        a.country,
        a.active_airline,
        b.src_airport,
        b.src_airport_id,
        b.dst_airport,
        b.dst_airport_id,
        b.codeshare,
        b.stops,
        b.planes_name,
        b.ISO_CODE,
        b.DAFIF_CODE

    from airlines a
    left join routes_enriched b on a.iata = b.airline and a.airline_id = b.airline_id
    order by 1
),


slv_airlines_table AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['airline_id', 'name', 'IATA','ICAO','src_airport', 'src_airport_id' , 'dst_airport' ,'dst_airport_id' , 'planes_name' ]) }} as airline_key,
        *
    FROM
        slv_airlines_table_enriched
)


select * from slv_airlines_table





