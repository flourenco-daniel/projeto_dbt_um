{% test valid_email(model, column_name) %}

with validation as(
    select *
    from {{ model }}
    where {{ column_name }} is not null
      and {{ column_name }} not like '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')

SELECT COUNT(*) AS invalid_email_count
FROM validation
{% endtest %}