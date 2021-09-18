CREATE DATABASE LetsCar;
USE LetsCar;
CREATE TABLE Carro
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    IdModPagamento INT NOT NULL,
    Marca VARCHAR(20) NOT NULL,
    Modelo VARCHAR(20) NOT NULL,
    Ano VARCHAR(4) NOT NULL,
    Cor VARCHAR(15) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_Cliente_Modalidade FOREIGN KEY(IdModPagamento)
		REFERENCES Modalidade_Pagamento(Id)
);

CREATE TABLE Adicionais
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    NomeAdicional VARCHAR(25) NOT NULL
);
CREATE TABLE Adicionado
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    IdCarro INT NOT NULL,
    IdAdicional INT NOT NULL,
    CONSTRAINT FK_Adicionado_Carro FOREIGN KEY(IdCarro)
		References Adicionais(Id),
	CONSTRAINT FK_Adicionado_Adicionais FOREIGN KEY(IdAdicional)
		References Adicionais(Id)
);

CREATE TABLE Modalidade_Pagamento
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(20) NOT NULL
);

Select * From Modalidade_Pagamento;
CREATE TABLE Cliente
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Telefone VARCHAR(15) NULL
);

CREATE TABLE Favoritar
(
	Id INT PRIMARY KEY AUTO_INCREMENT, 
	IdCarro INT NOT NULL,
    IdCliente INT NOT NULL,
    CONSTRAINT FK_Favoritar_Cliente FOREIGN KEY(IdCliente)
		REFERENCES Cliente(Id),
	CONSTRAINT FK_Favoritar_Carro FOREIGN KEY(IdCarro)
		REFERENCES Carro(Id)
);
CREATE TABLE Contato
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    IdCliente INT NULL,
    IdCarro INT NULL,
    EmailParaRetorno VARCHAR(15) NOT NULL,
    Assunto VARCHAR(100) NOT NULL,
    CONSTRAINT FK_Contato_Cliente FOREIGN KEY(IdCliente)
		REFERENCES Cliente(Id),
	CONSTRAINT FK_Contato_Carro FOREIGN KEY(IdCarro)
		REFERENCES Carro(Id)  
);
ALTER TABLE Contato CHANGE EmailParaRetorno TelefoneParaRetorno VARCHAR(15) NOT NULL;


