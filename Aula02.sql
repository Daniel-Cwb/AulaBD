CREATE DATABASE IF NOT EXISTS pet;

USE admin_class_teaching;

DROP TABLE IF EXISTS animais;

CREATE TABLE IF NOT EXISTS animais (
    id_animal SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('cachorro', 'gato') NOT NULL,
    nome VARCHAR(70) NOT NULL,
    data TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP

);

INSERT INTO animais (
    tipo,
    nome
) VALUE (
    'cachorro',
    'Loirinho'
),
(
    'gato',
    'Fajola'
);

