{% macro calculate_speed(flight_distance,flight_time) %}
    ({{flight_distance}} * 1000) / {{flight_time}}
{% endmacro %}