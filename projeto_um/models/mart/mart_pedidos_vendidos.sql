{{
    config(
        materialized='table',
        tags=['mart vendas']
    )
}}

SELECT
    *
FROM
    {{ ref('int_pedidos_vendidos') }}