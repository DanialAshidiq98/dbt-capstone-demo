{%- test expect_table_column_count_to_greater_then_or_equals_other_table(model, compare_model) -%}
    {%- if execute -%}
        {%- set number_columns = (adapter.get_columns_in_relation(model) | length) -%}
        {%- set compare_number_columns = (adapter.get_columns_in_relation(compare_model) | length) -%}
        WITH test_data AS (

            SELECT
                {{ number_columns }} as number_columns,
                {{ compare_number_columns }} as compare_number_columns

        )
        SELECT 
            *
        FROM 
            test_data
        WHERE
            number_columns < compare_number_columns
    {%- endif -%}
{%- endtest -%}