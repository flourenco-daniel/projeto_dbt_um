with source as (
        SELECT *
        FROM {{ source('ecommerce', 'pagamentos') }}
)

SELECT *
FROM source