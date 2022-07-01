USE trabalhofinal1;

INSERT INTO cargo (
    cargo
)VALUES
(
    'Estoquista'
),
(
    'Vendedor'
),
(
    'Secretário'
),
(
    'Gerente'
);


INSERT INTO usuario (
    nome_usuario,
    endereco_usuario,
    id_cargo
)VALUES
(
    'José Francisco',
    'Rua Cid. Campelo, 2020',
     1    

),
(
    'Maria Leticia',
    'Rua Cid. Campelo, 2020',
    2
    
),
(
    'Isabela Torres',
    'Rua Cid. Campelo, 2020',
    3
   
),
(
    'Pedro Henrique',
    'Rua Cid. Campelo, 2020',
    4
);

INSERT INTO empresa (
    nome_empresa

) VALUE (
    'Nescau'
),
(
    'Cabloco'
),
(
    'Ouro Fino'
);

INSERT INTO produto (
    nome_produto,
    preco_compra,
    preco_venda,
    qtda,
    id_empresa
)VALUES
(
    'Achocolatado',
    7.0,
    9.0,
    120,
    1

),
(
    'Água',
    3.5,
    4.5,
    50,
    3
),
(
    'Café',
    3.5,
    4.5,
    55,
    2
),
(
    'Chocolate',
    2.0,
    3.0,
    30,
    1
);

INSERT INTO clientes (
    nome_clientes,
    cpf_clientes,
    endereco_clientes
) VALUE (
    'Daniel Fialho',
    '069.865.845-55',
    'Rua Argemiro Candido Jardim, 233'

),
(
    'Leticia Mayaraa',
    '114.552.452-88',
    'Rua Otacilio Rodriges, 66'

),
(
    'Maria Socorro',
    '055.458.847-82',
    'Rua Cid. Campelo, 1023'
);

INSERT INTO cliente_produto (
    id_clientes,
    id_produto

) VALUE (
    1,
    1
),
(
    1,
    2
),
(
    2,
    2
),
(
    2,
    3
),
( 
    3,
    1
);

INSERT INTO produto_usuario (
    id_usuario,
    id_produto

) VALUE 
(
    2,
    1
),
(
    2,
    2
),
(
    1,
    2
),
(
    2,
    3
),
(
    3,
    1
);


/*
1 - Query traz o nome do cargo, o nome do usuário, o nome do produto
*/

SELECT 
    cargo.cargo,
    usuario.nome_usuario,
    produto.nome_produto
FROM 
    cargo
INNER JOIN 
    usuario ON  usuario.id_usuario = cargo.id_cargo
INNER JOIN 
    produto_usuario ON  produto_usuario.id_usuario = usuario.id_usuario
INNER JOIN
    produto ON produto_usuario.id_produto = produto.id_produto;

/*
2 - Query traz o nome do cargo, o nome do usuário e o nome do produto - trazer para o nome de um produto específico.
*/

SELECT 
    cargo.cargo,
    usuario.nome_usuario,
    produto.nome_produto
FROM
    cargo
INNER JOIN 
    usuario ON usuario.id_usuario = cargo.id_cargo
INNER JOIN 
    produto_usuario ON produto_usuario.id_usuario = usuario.id_usuario
INNER JOIN 
    produto ON produto.id_produto = produto_usuario.id_produto
WHERE
    produto.nome_produto = 'Café';

/*
3 - Query traz o nome do cliente, a empresa do produto, o nome do produto que o cliente consome e a quantidade do produto em estoque - trazer todos.
*/

SELECT 
    clientes.nome_clientes,
    produto.nome_produto,
    produto.qtda,
    empresa.nome_empresa
    
FROM
    clientes
INNER JOIN
    cliente_produto ON clientes.id_clientes = cliente_produto.id_clientes
LEFT JOIN
    produto ON produto.id_produto = cliente_produto.id_produto
LEFT JOIN
    empresa ON empresa.id_empresa = produto.id_produto;

/* 4 - Query traz o nome do cliente, a empresa do produto, o nome do produto que o cliente consumo e a quantidade do produto em estoque - trazer para o nome de um cliente específico (pelo nome). */

SELECT 
    clientes.nome_clientes,
    produto.nome_produto,
    produto.qtda,
    empresa.nome_empresa
FROM
    clientes
INNER JOIN
    cliente_produto ON clientes.id_clientes = cliente_produto.id_produto
INNER JOIN 
    produto ON produto.id_produto = cliente_produto.id_produto
INNER JOIN
    empresa ON empresa.id_empresa = produto.id_produto
WHERE 
    clientes.nome_clientes = 'Leticia Mayaraa';

/* 5 - Query traz o nome do cliente, a empresa do produto, o nome do produto que o cliente consome e a quantidade do produto em estoque - trazer para um conjunto de clientes (veja in) pelo nome. */

SELECT 
    clientes.nome_clientes,
    produto.nome_produto,
    produto.qtda,
    empresa.nome_empresa
FROM
    clientes
INNER JOIN
    cliente_produto ON cliente_produto.id_clientes = clientes.id_clientes
INNER JOIN 
    produto ON produto.id_produto = cliente_produto.id_produto
INNER JOIN
    empresa ON empresa.id_empresa = produto.id_produto
WHERE 
    clientes.nome_clientes IN ('Daniel Fialho', 'Maria Socorro');

/* 6 - Query traz o nome do cliente, a empresa do produto, o nome do produto que o cliente consumo e a quantidade do produto em estoque - trazer para um conjunto de clientes (veja in) pelo nome -  com limite de 3 registros */

SELECT 
    clientes.nome_clientes,
    produto.nome_produto,
    produto.id_produto,
    empresa.nome_empresa
FROM
    clientes
INNER JOIN  
    cliente_produto ON cliente_produto.id_clientes = clientes.id_clientes
INNER JOIN
    produto ON produto.id_produto = cliente_produto.id_produto
INNER JOIN
    empresa ON empresa.id_empresa = produto.id_produto
WHERE
    clientes.nome_clientes IN ('Daniel Fialho', 'Leticia Mayaraa')
LIMIT 3;

/* 7 - Query traz o nome do cliente, a empresa do produto, o nome do produto que o cliente consumo e a quantidade do produto em estoque - trazer para um conjunto de clientes (veja in) pelo nome - com a ordenação orientada pela quantidade de produtos sendo essa descendente. */

SELECT 
    clientes.nome_clientes,
    produto.nome_produto,
    produto.qtda,
    empresa.nome_empresa
FROM
    clientes
INNER JOIN
    cliente_produto ON cliente_produto.id_produto = clientes.id_clientes
INNER JOIN
    produto ON produto.id_produto = cliente_produto.id_produto
INNER JOIN
    empresa ON empresa.id_empresa = produto.id_empresa
WHERE 
    clientes.nome_clientes IN ('Daniel Fialho', 'Leticia Mayaraa')
ORDER BY produto.id_produto DESC;

/* 8 - Query traz o nome do cliente, a empresa do produto, o nome do produto que o cliente consumo e a quantidade do produto em estoque - trazer para um conjunto de clientes (veja in) pelo nome - com a ordenação orientada pelo preço de compra (do maior para o menor). */

SELECT 
    clientes.nome_clientes,
    produto.nome_produto,
    produto.qtda,
    produto.preco_compra,
    empresa.nome_empresa   
FROM 
    clientes
INNER JOIN
    cliente_produto ON cliente_produto.id_produto = clientes.id_clientes
INNER JOIN
    produto ON produto.id_produto = cliente_produto.id_produto
INNER JOIN
    empresa ON empresa.id_empresa = produto.id_produto
WHERE 
    clientes.nome_clientes IN ('Daniel Fialho', 'Leticia Mayaraa', 'Maria Socorro')
ORDER BY produto.preco_compra DESC;