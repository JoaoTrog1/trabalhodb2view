/* retornar todos os pedidos */
CREATE VIEW vw_pedidos AS
    SELECT id_pedido, data_pedido, id_cliente
    FROM tbpedido;


/*INSERT*/
INSERT INTO vw_pedidos (data_pedido, id_cliente)
VALUES ('2024-08-07', 6);

/*UPDATE*/
UPDATE vw_pedidos
SET data_pedido = '2024-08-08'
WHERE data_pedido = '2024-08-07';


/*DELETE*/
DELETE FROM vw_pedidos
WHERE data_pedido = '2024-08-08';

/*RENAME*/
RENAME TABLE vw_pedidos TO vw_pedido;


/* atualizar uma view */
CREATE OR REPLACE VIEW vw_pedidos AS
    SELECT P.data_pedido, C.nome_cliente, SUM(PP.valor_produto*PP.quantidade_produto) "Valor Total"
    FROM tbpedido P
    JOIN tbcliente C ON P.id_cliente = C.id_cliente
    JOIN tbpedidotbproduto PP ON P.id_pedido = PP.id_pedido
    GROUP BY P.id_pedido;

SELECT * FROM vw_pedidos;

UPDATE tbpedidotbproduto
SET valor_produto = 40
WHERE id_produto = 8;


SELECT * FROM vw_pedidos;

/*Usando views para formatar dados*/
CREATE VIEW vw_formatar_data_tbpedido AS
    SELECT id_pedido, DATE_FORMAT(data_pedido, '%d/%m/%Y') AS "data_pedido", id_cliente FROM tbpedido;

/*Junção de views*/
CREATE OR REPLACE VIEW vw_pedidos AS
    SELECT P.data_pedido, C.nome_cliente, SUM(PP.valor_produto*PP.quantidade_produto) "Valor Total"
    FROM vw_formatar_data_tbpedido P
    JOIN tbcliente C ON P.id_cliente = C.id_cliente
    JOIN tbpedidotbproduto PP ON P.id_pedido = PP.id_pedido
    GROUP BY P.id_pedido;




