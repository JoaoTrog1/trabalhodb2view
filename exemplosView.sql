
/* retorna todos os pedidos */
CREATE VIEW vw_pedidos AS
SELECT C.nome_cliente, PD.nome_produto, P.data_pedido FROM tbpedido P INNER JOIN tbproduto PD ON P.id_produto = PD.id_produto INNER JOIN tbcliente C ON P.id_cliente = C.id_cliente;

