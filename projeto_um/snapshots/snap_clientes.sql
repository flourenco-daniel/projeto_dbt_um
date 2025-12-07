{% snapshot pedido_snapshot %}
    {{
        config(
            target_schema='historico',
            target_database='projeto-dbt-479500',
            unique_key='id',
            strategy='timestamp',
            updated_at='data_registro',
            tags=['snapshot clientes']
        )
    }}

    SELECT
        id,
        status,
        valor,
        data_atualizacao
    FROM {{ ref('stg_pedidos') }}

{% endsnapshot %}