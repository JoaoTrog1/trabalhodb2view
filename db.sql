-- Criação do banco de dados
DROP DATABASE lojaExView;
CREATE DATABASE lojaExView;
USE lojaExView;

-- Criação da tabela de clientes
CREATE TABLE tbcliente (
    id_cliente INT AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) NOT NULL,
    cidade_cliente VARCHAR(50),
    CONSTRAINT pk_tbcliente PRIMARY KEY(id_cliente)
)ENGINE=INNODB;

--Criaçao da tabela fornecedor
CREATE TABLE tbfornecedor (
    id_fornecedor INT AUTO_INCREMENT,
    nome_fornecedor VARCHAR(100) NOT NULL,
    cnpj_fornecedor VARCHAR(20) NOT NULL UNIQUE,
    CONSTRAINT pk_tbfornecedor PRIMARY KEY(id_fornecedor)
)ENGINE=INNODB;

-- Criação da tabela de produtos
CREATE TABLE tbproduto (
    id_produto INT AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    id_fornecedor INT NOT NULL,
    CONSTRAINT pk_tbproduto PRIMARY KEY(id_produto),
    CONSTRAINT fk_tbproduto_tbfornecedor FOREIGN KEY(id_fornecedor) REFERENCES tbfornecedor(id_fornecedor)
)ENGINE=INNODB;
INSERT INTO tbproduto 


-- Criação da tabela de pedidos
CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    produto VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
INSERT INTO pedido (cliente_id, produto, valor, data_pedido) VALUES
(1, 'Produto A', 100.00, '2024-01-15'),
(2, 'Produto B', 150.00, '2024-01-16'),
(1, 'Produto C', 200.00, '2024-02-01');

CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY
)



-- Inserção na tabela clientes
INSERT INTO tbcliente (nome_cliente, email_cliente, cidade_cliente) VALUES
('Carlos Silva', 'carlos.silva@example.com', 'São Paulo'),
('Maria Oliveira', 'maria.oliveira@example.com', 'Rio de Janeiro'),
('João Pereira', 'joao.pereira@example.com', 'Belo Horizonte'),
('Ana Costa', 'ana.costa@example.com', 'Porto Alegre'),
('Fernanda Almeida', 'fernanda.almeida@example.com', 'Curitiba'),
('Ricardo Santos', 'ricardo.santos@example.com', 'Recife');

-- Inserção na tabela fornecedor
INSERT INTO tbfornecedor (nome_fornecedor, cnpj_fornecedor) VALUES
('Fornecedor Alpha Ltda', '01.234.567/0001-89'),
('Fornecedor Beta S.A.', '23.456.789/0001-01'),
('Fornecedor Gama Comércio', '34.567.890/0001-12');
