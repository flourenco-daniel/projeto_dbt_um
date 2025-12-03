with source as (
        SELECT *
        FROM {{ source('ecommerce', 'pedidos') }}
)

SELECT *
FROM source