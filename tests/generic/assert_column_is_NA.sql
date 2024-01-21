{% test assert_column_is_NA(model, column_name) %}

select
    {{column_name}}
from {{model}}
where {{column_name}} in ('NA')

{% endtest %}