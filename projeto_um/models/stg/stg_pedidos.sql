{{ config( 
        materialized='incremental',
        tags=['stg pedidos']
        )
}}

with source as (
        SELECT *
        FROM {{ source('ecommerce', 'pedidos') }}
)

SELECT *
FROM source

{% if is_incremental() %}
        WHERE data_pedido(SELECT MAX(data_pedido) FROM {{ this }}))
{% endif %}