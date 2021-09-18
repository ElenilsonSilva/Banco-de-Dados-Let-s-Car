DELIMITER //
CREATE PROCEDURE VerFavoritos(idCliente INT)
BEGIN
	SELECT c.*
	FROM Favoritar f
		INNER JOIN Carro c
			ON f.IdCarro = c.Id
		INNER JOIN Cliente cl
			ON f.IdCliente = cl.Id
	WHERE cl.Id = idCliente;
END //
DELIMITER ;
-- -------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE VerTodosCarros()
BEGIN 
	SELECT c.*, ad.NomeAdicional AS 'Adicional'
    FROM Carro c
		INNER JOIN Adicionado a
			ON c.Id = a.IdCarro
		INNER JOIN Adicionais ad
			ON ad.Id = a.IdAdicional
	ORDER BY c.Id;
END //
DELIMITER ;
-- ------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE VerCarrosMarca(marca varchar(20))
BEGIN 
	SELECT c.*, ad.NomeAdicional AS 'Adicional'
    FROM Carro c
		INNER JOIN Adicionado a
			ON c.Id = a.IdCarro
		INNER JOIN Adicionais ad
			ON ad.Id = a.IdAdicional
	WHERE c.Marca = marca;	
END //
DELIMITER ;
-- ---------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE VerCarrosModelo(modelo varchar(20))
BEGIN 
	SELECT c.*, ad.NomeAdicional AS 'Adicional'
    FROM Carro c
		INNER JOIN Adicionado a
			ON c.Id = a.IdCarro
		INNER JOIN Adicionais ad
			ON ad.Id = a.IdAdicional
	WHERE c.Modelo = modelo;	
END //
DELIMITER ;
-- ------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE VerCarrosAno(ano varchar(4))
BEGIN 
	SELECT c.*, ad.NomeAdicional AS 'Adicional'
    FROM Carro c
		INNER JOIN Adicionado a
			ON c.Id = a.IdCarro
		INNER JOIN Adicionais ad
			ON ad.Id = a.IdAdicional
	WHERE c.Ano = ano;	
END //
DELIMITER ;
CALL VerCarrosAno(2022);
-- ----------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE VerCarrosCor(cor varchar(15))
BEGIN 
	SELECT c.*, ad.NomeAdicional AS 'Adicional'
    FROM Carro c
		INNER JOIN Adicionado a
			ON c.Id = a.IdCarro
		INNER JOIN Adicionais ad
			ON ad.Id = a.IdAdicional
	WHERE c.Cor = cor;	
END //
DELIMITER ;

-- -------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE VerCarrosPreco(preco INT)
BEGIN 
	SELECT c.*, ad.NomeAdicional AS 'Adicional'
    FROM Carro c
		INNER JOIN Adicionado a
			ON c.Id = a.IdCarro
		INNER JOIN Adicionais ad
			ON ad.Id = a.IdAdicional
	WHERE c.Preco <= preco;	
END //
DELIMITER ;
-- ----------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE VerAdicionais()
BEGIN 
	SELECT * FROM Adicionais;
END //
DELIMITER ;
-- -------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE VerAdicionados()
BEGIN 
	SELECT ad.NomeAdicional, count(a.IdCarro) AS 'Adicionais por Carro'
    FROM Adicionado a
		INNER JOIN Adicionais ad
        ON a.IdAdicional = ad.Id
	GROUP BY a.IdCarro;
END //
DELIMITER ;

-- ------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE VerTodosClientes()
BEGIN 
	SELECT * FROM Cliente;
END //
DELIMITER ;
-- -----------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE VerClientesId(id INT)
BEGIN 
	SELECT * 
    FROM Cliente c 
    WHERE c.Id = id;
END //
DELIMITER ;
-- -------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE EditarDadosCliente(id INT, nome VARCHAR(50), telefone VARCHAR(15))
BEGIN 
	UPDATE Cliente c
    SET c.Nome = nome, c.Telefone = telefone
    Where c.Id = id;
END //
DELIMITER ;

-- --------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE VerMensagensContato()
BEGIN
	SELECT COALESCE(c.IdCliente, 'Usuário') AS 'Quem Enviou', 
		   ca.Marca AS 'Marca do Carro', ca.Modelo AS 'Modelo', 
           ca.Ano AS 'Ano', c.Assunto AS 'Assunto'
    FROM Contato c
		INNER JOIN Cliente cl
			ON c.IdCliente = cl.Id
		INNER JOIN Favoritar fa
			ON fa.IdCliente = cl.Id
		RIGHT JOIN Carro ca
			ON fa.IdCarro = ca.Id;
END //
DELIMITER ;

-- ---------------------------------------
DELIMITER //
CREATE PROCEDURE InserirContatoCliente(idCliente INT, idCarro INT, assunto VARCHAR(100))
BEGIN
	INSERT INTO Contato(IdCliente, IdCarro, TelefoneParaRetorno, Assunto)
		VALUES(IdCliente, idCarro, IdCliente.Telefone, assunto);
END //
DELIMITER ;


