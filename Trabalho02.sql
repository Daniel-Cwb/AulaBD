DROP IF EXISTS trabalho_02;
CREATE DATABASE IF NOT EXISTS trabalho_02 CHARACTER SET utf8 COLLATE utf8_general_ci;
USE trabalho_02;
DROP TABLE IF EXISTS bebidas;


CREATE TABLE IF NOT EXISTS bebidas (
    id_bebida SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(30) NOT NULL,
    marca VARCHAR(30) NOT NULL,
    record_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE bebidas;

INSERT 
    bebidas
    (
        tipo,
        marca
    )
    VALUES
    (
        'Destilado',
        'vodka'
    ),
    (
        'Destilado',
        'conhaque'
    ),
    (
        'Destilado',
        'cachaça'
    );

    SELECT * FROM bebidas;

    ALTER TABLE
        bebidas
    ADD COLUMN cor VARCHAR(25) AFTER marca;
    
    SELECT * FROM bebidas;
