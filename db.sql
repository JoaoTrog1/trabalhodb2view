/* Criação do banco de dados */
DROP DATABASE lojaExView;
CREATE DATABASE lojaExView;
USE lojaExView;

/* Criação da tabela de clientes */
CREATE TABLE tbcliente (
    id_cliente INT AUTO_INCREMENT,
    nome_cliente VARCHAR(100),
    email_cliente VARCHAR(100),
    cidade_cliente VARCHAR(50),
    CONSTRAINT pk_tbcliente PRIMARY KEY(id_cliente)
)ENGINE=INNODB;

/* Criaçao da tabela fornecedor */
CREATE TABLE tbfornecedor (
    id_fornecedor INT AUTO_INCREMENT,
    nome_fornecedor VARCHAR(100),
    cnpj_fornecedor VARCHAR(20) UNIQUE,
    CONSTRAINT pk_tbfornecedor PRIMARY KEY(id_fornecedor)
)ENGINE=INNODB;

/* Criação da tabela de produtos */
CREATE TABLE tbproduto (
    id_produto INT AUTO_INCREMENT,
    nome_produto VARCHAR(100),
    id_fornecedor INT NOT NULL,
    valor_produto DOUBLE,
    quantidade_produto INT,
    CONSTRAINT pk_tbproduto PRIMARY KEY(id_produto),
    CONSTRAINT fk_tbproduto_tbfornecedor FOREIGN KEY(id_fornecedor) REFERENCES tbfornecedor(id_fornecedor)

    ON DELETE CASCADE ON UPDATE CASCADE 
)ENGINE=INNODB;

/* Criação da tabela de pedidos */
CREATE TABLE tbpedido (
    id_pedido INT AUTO_INCREMENT,
    data_pedido DATE,
    id_cliente INT NOT NULL,
    CONSTRAINT pk_tbpedido PRIMARY KEY(id_pedido),
    CONSTRAINT fk_tbpedido_tbcliente FOREIGN KEY (id_cliente) REFERENCES tbcliente(id_cliente)

    ON DELETE CASCADE ON UPDATE CASCADE 
)ENGINE=INNODB;


/*Criação da tabela tbpedidotbroduto para referenciar um pedido aos produtos */
CREATE TABLE tbpedidotbproduto (
    id_tbpedidotbproduto INT AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade_produto INT,
    valor_produto DOUBLE,
    CONSTRAINT pk_tbpedidotbproduto PRIMARY KEY(id_tbpedidotbproduto),
    CONSTRAINT fk_tbpedidotbproduto_tbpedido FOREIGN KEY(id_pedido) REFERENCES tbpedido(id_pedido),
    CONSTRAINT fk_tbpedidotbproduto_tbproduto FOREIGN KEY (id_produto) REFERENCES tbproduto(id_produto)

    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;





/* Inserção na tabela clientes */
INSERT INTO tbcliente (nome_cliente, email_cliente, cidade_cliente) VALUES
('Carlos Silva', 'carlos.silva@example.com', 'São Paulo'),
('Maria Oliveira', 'maria.oliveira@example.com', 'Rio de Janeiro'),
('João Pereira', 'joao.pereira@example.com', 'Belo Horizonte'),
('Ana Costa', 'ana.costa@example.com', 'Porto Alegre'),
('Fernanda Almeida', 'fernanda.almeida@example.com', 'Curitiba'),
('Ricardo Santos', 'ricardo.santos@example.com', 'Recife');

/* Inserção na tabela fornecedor */
INSERT INTO tbfornecedor (nome_fornecedor, cnpj_fornecedor) VALUES
('Fornecedor Alpha Ltda', '01.234.567/0001-89'),
('Fornecedor Beta S.A.', '23.456.789/0001-01'),
('Fornecedor Gama Comércio', '34.567.890/0001-12');

/* Inserção na tabela produtos */
INSERT INTO tbproduto (nome_produto, id_fornecedor, valor_produto, quantidade_produto) VALUES
('Smartphone X200', 1, 599.99, 10), 
('Notebook UltraPro 15', 1, 1299.49, 10),
('Cadeira Ergonômica Pro', 2, 219.89, 10),
('Mesa de Escritório Compacta', 2, 159.99, 10),
('Fone de Ouvido Bluetooth 4.0', 3, 89.00, 10),
('Monitor LED 24"', 3, 179.75, 10),
('Teclado Mecânico RGB', 1, 89.50, 10),
('Mouse Sem Fio Ergonomic', 3, 45.30, 10);

/* Inserção na tabela pedidos */
INSERT INTO tbpedido (data_pedido, id_cliente) VALUES
('2024-08-01', 1), 
('2024-08-02', 2), 
('2024-08-03', 3),  
('2024-08-04', 4),  
('2024-08-05', 5),  
('2024-08-06', 6); 

/* Inserção na tabela tbpedidotbproduto */
INSERT INTO tbpedidotbproduto (id_produto, id_pedido, quantidade_produto, valor_produto) VALUES
(3, 1, 2, 219.89),
(1, 1, 1, 599.99),
(2, 1, 5, 1299.49),
(8, 2, 2, 45.30),
(7, 3, 1, 89.50),
(5, 4, 1, 89.00),
(6, 5, 2, 179.75),
(4, 6, 3, 159.99);
