-- Distance over time = Speed should always be > 0.
-- Therefore return records where this isn't true to make the test fail.
select
    flight_id,
    airport_distance_in_km,
    crs_elapsed_time,
    speed_in_km_h
from {{ ref('slv_flights_enriched') }}
having not(speed_in_km_h >= 0)