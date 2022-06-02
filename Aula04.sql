DROP IF EXISTS aula_4;
CREATE DATABASE IF NOT EXISTS aula_4 CHARACTER SET utf8 COLLATE utf8_general_ci;
USE aula_4;
DROP TABLE IF EXISTS time_futebol;

SELECT 'Criar tabela time_futebol se não existe' AS 'PRINT DADO';

CREATE TABLE IF NOT EXISTS time_futebol (
    id_time_futebol SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome_time VARCHAR(255) NOT NULL,
    gols INTEGER NOT NULL,
    record_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE time_futebol;

INSERT INTO 
    time_futebol 
    (
        nome_time,
        gols
    )
VALUES
    (
        'Corinthians',
        10
    ),
    (
        'Atlético',
        6
    ),
    (
        'Coxa',
        6
    ),
    (
        'São Paulo',
        4
    );


SELECT * FROM time_futebol;

SELECT 'Alter table insert column' AS 'PRINT DADO';

/*ADICIONANDO UMA COLUNA */

ALTER TABLE
    time_futebol
ADD COLUMN observacao VARCHAR(255) AFTER gols,     
ADD COLUMN ponto_campeonato INTEGER NOT NULL DEFAULT 0 AFTER gols,
ADD COLUMN campeonato enum('brasileiro','libertadores','paranaense','paulista') NOT NULL DEFAULT 'brasileiro' AFTER gols;

SELECT * FROM time_futebol;


/* DELETANDO UMA COLUNA */
ALTER TABLE
    time_futebol
DROP COLUMN observacao;

DESCRIBE time_futebol;
SELECT * FROM time_futebol;

/* MODIFICA UMA COLUNA */

UPDATE
    time_futebol
SET
    ponto_campeonato = 25;

ALTER TABLE
    time_futebol
MODIFY COLUMN ponto_campeonato FLOAT;

DESCRIBE time_futebol;

/* REALIZANDO UMA ALTERAÇÃO DE TODOS OS CAMPO DO PONTO_CAMPEONATO */
UPDATE
    time_futebol
SET 
    ponto_campeonato = 25.2;

SELECT * FROM time_futebol;

/* REALIZANDO UMA ALTERAÇÃO EM UM CAMPO ESPECIFICO */
UPDATE time_futebol  SET ponto_campeonato = 72.5 WHERE nome_time = 'Corinthians';
UPDATE time_futebol  SET ponto_campeonato = 55.5 WHERE nome_time = 'Atlético';
UPDATE time_futebol  SET ponto_campeonato = 45.5 WHERE nome_time = 'Coxa';

SELECT * FROM time_futebol;
