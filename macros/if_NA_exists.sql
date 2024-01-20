{% macro return_null(column_name) %}

case
    when {{column_name}} not in ('NA') 
        then cast({{column_name}} as timestamp)
    else
        null
    end

{% endmacro %}