-- =============================================
-- Sistema de Pedidos para Restaurante
-- Schema do banco de dados
-- =============================================

CREATE DATABASE IF NOT EXISTS restaurante CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE restaurante;

-- ---------------------------------------------
-- Tabela: usuarios
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------
-- Tabela: categorias
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY key,
    nome VARCHAR(80) NOT NULL UNIQUE,
    ordem INT DEFAULT 0 
);

-- ---------------------------------------------
-- Tabela: itens
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS itens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(8, 2) NOT NULL,
    ativo TINYINT(1) DEFAULT 1,
    CONSTRAINT fk_item_categoria FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- ---------------------------------------------
-- Tabela: pedidos
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mesa INT NOT NULL,
    status ENUM('novo', 'preparando', 'pronto', 'entregue') DEFAULT 'novo',
    total DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ---------------------------------------------
-- Tabela: pedido_itens
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS pedido_itens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    item_id INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    preco_unit DECIMAL(8,2) NOT NULL,
    obs VARCHAR(200),
    CONSTRAINT fk_pedidoitem_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    CONSTRAINT fk_pedidoitem_item FOREIGN KEY (item_id) REFERENCES itens(id)
);

-- Usuário administrador (senha: admin123)
INSERT INTO usuarios (nome, email, senha_hash) VALUES
('Administrador', 'admin@restaurante.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi');

-- Categorias
INSERT INTO categorias (nome, ordem) VALUES
('Entradas', 1),
('Pratos Principais', 2),
('Sobremesas', 3),
('Bebidas', 4);

-- Itens
INSERT INTO itens (categoria_id, nome, descricao, preco, ativo) VALUES
(1, 'Pão de Alho', 'Pão francês com manteiga e alho', 12.90, 1),
(1, 'Bolinho de Bacalhau', 'Porção com 6 unidades', 24.90, 1),
(2, 'Frango Grelhado', 'Filé de frango com arroz e salada', 38.90, 1),
(2, 'Picanha na Brasa', 'Picanha 300g com fritas e vinagrete', 69.90, 1),
(2, 'Massa ao Molho Ragu', 'Tagliatelle com ragu de carne', 42.90, 1),
(3, 'Pudim de Leite', 'Pudim caseiro com calda de caramelo', 14.90, 1),
(3, 'Brownie com Sorvete', 'Brownie quente com sorvete de creme', 18.90, 1),
(4, 'Refrigerante Lata', 'Coca-Cola, Guaraná ou Sprite', 7.90, 1),
(4, 'Suco Natural', 'Laranja, limão ou maracujá', 11.90, 1),
(4, 'Água Mineral', 'Com ou sem gás 500ml', 5.90, 1);