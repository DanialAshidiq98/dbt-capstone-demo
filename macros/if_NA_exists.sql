{% macro remove_NA_values_timestamp(column_name) %}

case
    when {{column_name}} not in ('NA')
        then cast({{column_name}} as timestamp)
    else
        null
    end

{% endmacro %}

{% macro remove_NA_values_int(column_name) %}

case
    when {{column_name}} not in ('NA')
        then cast({{column_name}} as int)
    else
        null
    end

{% endmacro %}