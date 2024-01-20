with source as (
      select * from {{ source('capstone', 'planes') }}
),
brz_planes as (
    select
        name as planes_name,
        ISO_CODE,
        DAFIF_CODE
    from source
)
select * from brz_planes