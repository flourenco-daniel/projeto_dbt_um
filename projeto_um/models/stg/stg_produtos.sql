with source as (
        SELECT *
        FROM {{ source('ecommerce', 'produtos') }}
)

SELECT *
FROM source