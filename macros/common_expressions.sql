{% macro get_unique_id(digits=12) %}
    floor(random() * {{ 10 ** digits  -}})
{% endmacro %}

{% macro get_as_time_format(column) %}
    SUBSTR(LPAD({{ column }}, 4, '0'), 1, 2) || ':' || SUBSTR(LPAD({{ column }}, 4, '0'), -2)
{% endmacro %}

{% macro get_distance_of_two_points(origin_lat, origin_long, dest_lat, dest_long, unit='km') %}
    {% if unit == 'km' %}
        {% set multiplier = 6371.0  %}
    {% else %}
        {% set multiplier = 3959.0 %}
    {% endif %}

    ACOS(
        SIN(PI() * {{ origin_lat }} / 180.0) * SIN(PI() * {{ dest_lat }} / 180.0)
        + COS(PI() * {{ origin_lat }} / 180.0) * COS(PI() * {{ dest_lat }} / 180.0)
        * COS(PI() * ({{ origin_long }} - {{ dest_long }}) / 180.0)
    ) * {{ multiplier }}
{% endmacro %}