{% macro calculate_speed(flight_distance,flight_time) %}
    {% if flight_time == 0 or flight_distance == 0 %}
        NULL
    {% else %}    
        ({{flight_distance}} * 1000) / {{flight_time}}
    {% endif %}
{% endmacro %}