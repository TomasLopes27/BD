-- Criação da Base de Dados
CREATE SCHEMA GestaoEventos DEFAULT CHARSET = utf8mb4;
DROP DATABASE gestaoeventos;
-- Identificação da base de dados de trabalho 
USE GestaoEventos;

-- Criação da tabela "Cliente"
-- DROP TABLE Cliente;
CREATE TABLE Cliente(
    NIF INT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Contacto INT NOT NULL,
    Email VARCHAR(45) NOT NULL, 
    CodigoPostal VARCHAR(8) NOT NULL
);

-- Criação da tabela "Funcionario"
-- DROP TABLE Funcionario
CREATE TABLE Funcionario(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Contacto INT NOT NULL,
    Email VARCHAR(45) NOT NULL
);

-- Criação da tabela "Participante"
-- DROP TABLE Participante
CREATE TABLE Participante(
    NIF INT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Contacto INT NOT NULL,
    Email VARCHAR(45) NOT NULL,
    Idade INT NOT NULL
);

-- Criação da tabela "Fornecedor"
-- DROP TABLE Fornecedor
CREATE TABLE Fornecedor(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Contacto INT NOT NULL
);

-- Criação da tabela "Material"
-- DROP TABLE Material
CREATE TABLE Material(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Preco DECIMAL(6,2) NOT NULL,
    Quantidade INT NOT NULL
);

-- Criação da tabela "Espaco"
-- DROP TABLE Espaco
CREATE TABLE Espaco(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Capacidade INT NOT NULL,
    Descricao VARCHAR(200) NOT NULL
);

-- Criação da tabela "Evento"
-- DROP TABLE Evento
CREATE TABLE Evento(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Descricao VARCHAR(200) NOT NULL,
    Estado VARCHAR(15) NOT NULL,
    DataEvento DATE NOT NULL,
    Lotacao INT NOT NULL,
    PrecoBilhete DECIMAL(4,2),
    IdadeMinima INT,
    Cliente_NIF INT,
    Funcionario_ID INT,
    FOREIGN KEY (Cliente_NIF) REFERENCES Cliente(NIF),
    FOREIGN KEY (Funcionario_ID) REFERENCES Funcionario(ID)
);

-- Criação da tabela "Evento_Espaco"
-- DROP TABLE Evento_Espaco
CREATE TABLE Evento_Espaco (
    Evento_ID INT,
    Espaco_ID INT,
    PRIMARY KEY (Evento_ID, Espaco_ID),
    FOREIGN KEY (Evento_ID) REFERENCES Evento(ID),
    FOREIGN KEY (Espaco_ID) REFERENCES Espaco(ID)
);

-- Criação da tabela "Participante_Evento"
-- DROP TABLE Participante_Evento
CREATE TABLE Participante_Evento (
    Participante_NIF INT,
    Evento_ID INT,
    PRIMARY KEY (Participante_NIF, Evento_ID),
    FOREIGN KEY (Participante_NIF) REFERENCES Participante(NIF),
    FOREIGN KEY (Evento_ID) REFERENCES Evento(ID)
);

-- Criação da tabela "Evento_Material"
-- DROP TABLE Evento_Material
CREATE TABLE Evento_Material (
    Evento_ID INT,
    Material_ID INT,
    Quantidade INT,
    PRIMARY KEY (Evento_ID, Material_ID),
    FOREIGN KEY (Evento_ID) REFERENCES Evento(ID),
    FOREIGN KEY (Material_ID) REFERENCES Material(ID)
);

-- Criação da tabela "Material_Fornecedor"
-- DROP TABLE Material_Fornecedor
CREATE TABLE Material_Fornecedor (
    Material_ID INT,
    Fornecedor_ID INT,
    Quantidade INT,
    PRIMARY KEY (Material_ID, Fornecedor_ID),
    FOREIGN KEY (Material_ID) REFERENCES Material(ID),
    FOREIGN KEY (Fornecedor_ID) REFERENCES Fornecedor(ID)
);

-- -- -- -- -- -- -- --  --- -----------------------------

-- Gestor
CREATE USER 'gestor'@'localhost' IDENTIFIED BY '123gestor123';
GRANT ALL PRIVILEGES ON gestaoeventos.* TO 'gestor'@'localhost' WITH GRANT OPTION;

CREATE USER 'funcionario'@'localhost' IDENTIFIED BY '123funcionario123';
GRANT SELECT ON gestaoeventos.* TO 'funcionario'@'localhost';
GRANT EXECUTE ON gestaoeventos.* TO 'funcionario'@'localhost';
GRANT UPDATE ON gestaoeventos.evento TO 'funcionario'@'localhost';


Delimiter //
CREATE PROCEDURE MaterialFornecidoPorEvento (IN IDEvento INT)
BEGIN 
 SELECT E.Nome, F.Nome, M.Nome, MF.Quantidade
 FROM Evento E
 join Evento_Material EM ON E.ID = EM.Evento_ID
Join Material M on EM.Material_id = M.ID
 Join Material_fornecedor MF on M.ID=MF.Material_ID
 Join Fornecedor F on MF.Fornecedor_id = F.ID
 WHere E.ID = IDEVENTO;
END;
//


