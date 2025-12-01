with source as (
        SELECT *
        FROM {{ source('ecommerce', 'itens_pedidos') }}
)

SELECT *
FROM source