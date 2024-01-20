{% macro remove_NA_values(column_name,variable) %}

case
    when {{column_name}} not in ('NA')
        then cast({{column_name}} as timestamp)
    else
        null
    end

{% endmacro %}