{{
    config(
        tags=["vendas", "int", "pedidos_vendidos"],
    )
}}

WITH pedidos AS (
    SELECT
        id,
        cliente_id,
        endereco_id,
        data_pedido,
        status
    FROM
        {{ ref('stg_pedidos') }}
    WHERE
        status = 'concluído'
),

cliente as (
    SELECT
        id,
        nome,
        email,
        telefone,
        data_registro
    FROM
        {{ ref('stg_clientes') }}
),

itens_pedidos AS (
    SELECT
        pedido_id,
        produto_id,
        quantidade,
        preco_unitario,
        subtotal
    FROM
        {{ ref('stg_itens_pedidos') }}
),

produtos AS (
    SELECT
        id,
        nome,
        descricao,
        categoria_id,
        preco,
        marca,
        estoque,
        data_cadastro
    FROM
        {{ ref('stg_produtos') }}
),

pagamentos AS (
    SELECT
        id,
        pedido_id,
        valor,
        metodo,
        status,
        data_pagamento
    FROM
        {{ ref('stg_pagamentos') }}
)

SELECT
    c.id AS cliente_id,
    c.nome AS cliente_nome,
    c.email AS cliente_email,
    c.telefone AS cliente_telefone,
    c.data_registro AS cliente_data_registro,
    p.id AS pedido_id,
    p.endereco_id AS pedido_endereco_id,
    p.data_pedido AS pedido_data_pedido,
    ip.produto_id AS item_produto_id,
    pr.nome AS produto_nome,
    pr.categoria_id AS produto_categoria_id,
    pr.preco AS produto_preco,
    ip.quantidade AS item_quantidade,
    ip.preco_unitario AS item_preco_unitario,
    ip.subtotal AS item_subtotal,
    pg.valor AS pagamento_valor,
    pg.metodo AS pagamento_metodo,
    pg.status AS pagamento_status,
    pg.data_pagamento AS pagamento_data_pagamento

FROM
    pedidos p
    LEFT JOIN cliente c ON p.cliente_id = c.id
    LEFT JOIN itens_pedidos ip ON p.id = ip.pedido_id
    LEFT JOIN produtos pr ON ip.produto_id = pr.id
    LEFT JOIN pagamentos pg ON p.id = pg.pedido_id