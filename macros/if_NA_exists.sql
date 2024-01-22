{%- macro type_to_time(column_name, _type='int') -%}
    {%- if _type == 'varchar' -%}
        case
            when {{column_name}} in ('NA') then null
            when to_number({{column_name}})<1000 then  to_time(left({{column_name}},1) || ':' || right({{column_name}},2) || ':00') 
            when {{column_name}}='2400' then to_time('00:00:00')
            else to_time(left({{column_name}},2) || ':' || right({{column_name}},2) || ':00') 
        end
    {%- else -%}
        case
            when {{column_name}}=2400 then time_from_parts( 0, 0, 0 )
            else time_from_parts( floor({{column_name}}/100), {{column_name}} % 100, 0 )
        end
    {%- endif -%}
{%- endmacro -%}


{% macro remove_NA_values_timestamp(column_name) %}

case
    when {{column_name}} not in ('NA')
        then {{type_to_time(column_name,"varchar")}}
    else
        null
    end

{% endmacro %}

{% macro remove_NA_values_int(column_name) %}

case
    when {{column_name}} not in ('NA')
        then {{type_to_time(column_name)}}
    else
        null
    end

{% endmacro %}


