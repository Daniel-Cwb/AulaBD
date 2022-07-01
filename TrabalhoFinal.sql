


CREATE DATABASE trabalhofinal1 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE trabalhofinal1;


CREATE TABLE IF NOT EXISTS cargo (
    id_cargo SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cargo ENUM('Estoquista','Vendedor','Secretário', 'Gerente') NOT NULL DEFAULT 'Vendedor'
);

CREATE TABLE IF NOT EXISTS empresa (
  id_empresa SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  nome_empresa ENUM('Nescau','Cabloco','Ouro Fino') NOT NULL DEFAULT 'Nescau'
);

CREATE TABLE IF NOT EXISTS clientes (
  id_clientes SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  nome_clientes VARCHAR(18) NOT NULL,
  cpf_clientes VARCHAR(18) NOT NULL UNIQUE,
  endereco_clientes VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS usuario (
    id_usuario SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(70) NOT NULL,
    endereco_usuario VARCHAR(100) NOT NULL,
    id_cargo SMALLINT UNSIGNED,
    CONSTRAINT fk_cargo FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo)
);

CREATE TABLE IF NOT EXISTS produto (
  id_produto SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  nome_produto ENUM('Achocolatado','Água','Café','Chocolate') NOT NULL DEFAULT 'Achocolatado',
  preco_compra FLOAT NOT NULL,
  preco_venda FLOAT NOT NULL,
  qtda SMALLINT NOT NULL,
  id_empresa SMALLINT UNSIGNED,
  CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);



CREATE TABLE IF NOT EXISTS produto_usuario (
id_produto SMALLINT  UNSIGNED NOT NULL,
id_usuario SMALLINT  UNSIGNED NOT NULL,
CONSTRAINT fk_produto_usuario FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
CONSTRAINT fk_usuario_produto FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS cliente_produto(
id_clientes SMALLINT UNSIGNED,
id_produto SMALLINT UNSIGNED,
CONSTRAINT fk_cliente_produto FOREIGN KEY(id_clientes) REFERENCES clientes(id_clientes),
CONSTRAINT fk_produto_cliente FOREIGN KEY(id_produto) REFERENCES produto(id_produto)
);
