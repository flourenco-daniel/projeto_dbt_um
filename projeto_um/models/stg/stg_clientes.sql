with source as (
        SELECT *
        FROM {{ source('ecommerce', 'clientes') }}
)

SELECT *
FROM source