CREATE DATABASE IF NOT EXISTS aula3;

USE aula3;

DROP TABLE tempo_cidade;

CREATE TABLE IF NOT EXISTS tempo_cidade (
    id_tempo_cidade SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome_cidade VARCHAR(100) NOT NULL,
    tempo ENUM('Sol','Nublado','Chuva') NOT NULL DEFAULT 'Sol',
    temperatura FLOAT,
    record_data DATETIME DEFAULT CURRENT_TIMESTAMP
);

insert into tempo_cidade (
    nome_cidade,
    tempo,
    temperatura
)
values (
    'Curitiba',
    'Sol',
    11.2
),
(
    'londrina',
    'Sol',
    29.2
),
(
    'Rio de Janeiro',
    'Nublado',
    35.2
),
(
    'Salvador',
    'Sol',
    36.2
),
(
    'Florianopolis',
    'Chuva',
    15.2
),
(
    'Porto Alegre',
    'Nublado',
    5.2
),
(
    'Cuiaba',
    'Sol',
    30
),
(
    'Governador Valadares',
    'Sol',
    58
);

SELECT * FROM tempo_cidade;

UPDATE 
    tempo_cidade 
SET 
    temperatura=29.1
WHERE
    nome_cidade = 'Governador Valadares';


SELECT * FROM tempo_cidade WHERE nome_cidade = 'Governador Valadares';

UPDATE 
    tempo_cidade
SET
    tempo='Chuva'
WHERE
    tempo='Sol';

SELECT * FROM tempo_cidade;

UPDATE tempo_cidade SET nome_cidade='PERDEU';

SELECT * FROM tempo_cidade;