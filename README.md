# dbt-capstone-demo

## A DBT capstone project similar to airline-demo where below feature covers:

Datasets used:
- airlines.csv
- airports.csv
- routes.csv
- carriers.csv
- planes.csv
- OpenFlights_Dataset (Flights 2008)


**Bronze Layer**:
- _sources.yml
- brz_airlines.sql
- brz_airports.sql
- brz_flights.sql
- brz_planes.sql
- brz_routes.sql


**Silver Layer**:
_models.yml



**Gold Layer**:


- Model chaining
**Insert DAG here**


- Source:





Tables:

Views:

Ephemeral:

Incremental (append, merge):





Macros created:

- limit data in dev (simple macro)
- cents to dollars (simple macro)



Generic and Singular Test:
- assert_positive_total_for_flights


Use package macros (from dbt-utils, dbt-expectations) in model and testing


- dbt_utils.expression_is_true
- dbt_utils.not_empty_string
- dbt_expectations.expect_column_values_to_be_between

Documentation (models, source, test, macro):
- dbt docs generate


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
