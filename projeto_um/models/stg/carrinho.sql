with source as (
        SELECT *
        FROM {{ source('ecommerce', 'avaliacoes') }}
)

SELECT *
FROM source