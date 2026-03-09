CREATE TABLE venda(
id_pedido INT PRIMARY KEY AUTO_INCREMENT,
nome_produto VARCHAR(50),
quantidade INT,
valor_unitario DECIMAL(10,2)
);

INSERT INTO pedido(nome_produto, quantidade, valor_unitario)
VALUES ('shampoo', 1, 5.00),
	   ('sabonete', 3, 2.00),
       ('gel', 10, 7.00);

SELECT * FROM pedido;

SELECT CONCAT('Número do pedido: ', id_pedido, nome_produto) teste FROM pedido;

select valor_unitario FROM pedido,
	CASE WHEN valor_unitario > 2 THEN 'caro'
    ELSE 'normal'
    END
    

