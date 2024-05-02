
	 --Database: dekamilk

 --DROP DATABASE dekamilk;
/*CREATE DATABASE dekamilk
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
*/	



CREATE TABLE cliente (
	id_cliente SERIAL,
	nome VARCHAR(60) NOT NULL,
	cpf VARCHAR(14) UNIQUE NOT NULL,
	cep VARCHAR(9),
	cnpj VARCHAR(14),
	endereco VARCHAR(150),
	cidade VARCHAR(70),
	bairro VARCHAR(70),
	uf VARCHAR(2),
	telefone VARCHAR(20),
	telefone_fixo VARCHAR(20),
	email VARCHAR(70),
	CONSTRAINT PK_cliente PRIMARY KEY (id_cliente)
);

CREATE TABLE Fornecedor (
	id_fornecedor SERIAL,
	nome VARCHAR(60) NOT NULL,
	cpf VARCHAR(14) UNIQUE NOT NULL,
	cep VARCHAR(10),
	cnpj VARCHAR(14),
	endereco VARCHAR(150),
	cidade VARCHAR(70),
	bairro VARCHAR(70),
	uf VARCHAR(2),
	telefone VARCHAR(20),
	telefone_fixo VARCHAR(20),
	email VARCHAR(70),
	CONSTRAINT PK_fornecedor PRIMARY KEY (id_fornecedor)
);
	
CREATE TABLE Operacao (
	id_operacao SERIAL,
	descricao VARCHAR(300) NOT NULL,
	tipo CHAR(1) CHECK (tipo IN ('E', 'S', 'N')), -- pode ser "E" de Entrada e "S" de Saida e "N" de Neutra 
	CONSTRAINT PK_Operacao PRIMARY KEY (id_operacao)
);

CREATE TABLE Movimento(
	id_movimento SERIAL,
	id_operacao INT NOT NULL,
	quantidade FLOAT NOT NULL,
	id_fornecedor INT NOT NULL,
	id_cliente INT NOT NULL, 
	descricao VARCHAR(300) NOT NULL,
	data_lancamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT PK_id_movimento PRIMARY KEY (id_movimento),
	CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
	CONSTRAINT FK_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

CREATE TABLE PrecoUnitarioLitro (
    id_preco_unitario SERIAL,
	valor_unitario FLOAT NOT NULL DEFAULT '0.00',
	data_preco DATE NOT NULL,
	id_cliente INT NOT NULL,
	CONSTRAINT PK_id_preco_unitario PRIMARY KEY (id_preco_unitario),
	CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Funcao(
	id_funcao SERIAL,
	nome VARCHAR(20) NOT NULL,
	CONSTRAINT PK_id_funcao PRIMARY KEY (id_funcao)
);

CREATE TABLE Usuario (
	id_usuario SERIAL,
	nome_usuario VARCHAR(60) NOT NULL UNIQUE,
	senha_usuario VARCHAR(20) NOT NULL,
	cpf VARCHAR(14) NOT NULL UNIQUE DEFAULT '000.000.000-00',
    email VARCHAR(70),
	funcao INT NOT NULL,
	telefone VARCHAR(15) UNIQUE DEFAULT '00 00000-0000',
	CONSTRAINT PK_id_usuario PRIMARY KEY (id_usuario),
	CONSTRAINT FK_funcao FOREIGN KEY (funcao) REFERENCES Funcao(id_funcao)
);

CREATE TABLE Raca(
	id_raca SERIAL NOT NULL,
	nome VARCHAR(20) NOT NULL,
	CONSTRAINT PK_id_raca PRIMARY KEY (id_raca)
);

CREATE TABLE Animal(
	id_animal SERIAL NOT NULL,
	id_raca INT NOT NULL,
	nr_brinco INT NOT NULL,
	idade INT,
	data_nasc DATE,
	apelido VARCHAR(15) NOT NULL,
	nome_pai VARCHAR(15),
	nome_mae VARCHAR(15),
	inseminada BOOLEAN NOT NULL,
	is_lactante BOOLEAN,
	numero_crias INT,
	peso FLOAT,
	sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
	data_ult_cria DATE,
	is_inseminada BOOLEAN, 
	CONSTRAINT PK_id_animal PRIMARY KEY (id_animal),
	CONSTRAINT FK_id_raca FOREIGN KEY (id_raca) REFERENCES Raca(id_raca)
);

CREATE TABLE Vacina(
	id_vacina SERIAL,
	nome_comercial VARCHAR NOT NULL,
	nome_doenca VARCHAR,
	principio_ativo VARCHAR NOT NULL, 
	tempo_previsto INT, -- refere-se a primeira a idade que deve ser feita a primeira vacinacao 
	tipo_aplicacao VARCHAR NOT NULL,
	CONSTRAINT PK_id_vacina PRIMARY KEY (id_vacina)
);

CREATE TABLE CalendarioVacinacao(
	id_vacinacao SERIAL, 
	id_animal INT NOT NULL, 
	id_vacina INT NOT NULL,
	data_vacinacao DATE NOT NULL,
	tempo_carencia INT, 
	data_prevista_proxima_vacinacao DATE,
	CONSTRAINT PK_id_vacinacao PRIMARY KEY (id_vacinacao),
	CONSTRAINT FK_id_animal FOREIGN KEY (id_animal) REFERENCES Animal(id_animal),
	CONSTRAINT FK_id_vacina FOREIGN KEY (id_vacina) REFERENCES Vacina(id_vacina)
);

-- incerção de dados primários
/*

INSERT INTO Cliente( Nome, cpf, cep, endereco, cidade, bairro, uf, telefone, telefone_fixo, email)VALUES
('Coperida cooperativa', '651.551.390-90', '99830-000', 'R. Dr. Maruri, 1586', 'Gaurama', 'Centro', 'RS', '49 3441-4200', null, 'coperdia@hotmail.com');

INSERT INTO Fornecedor( nome, Cpf, cep, endereco, cidade, bairro, uf, telefone,telefone_fixo, email)VALUES
('Nutribov', '924.445.570-69', '15084-160', 'Rua Jose Polachini Sobrinho, 896', 'Sao Paulo', 'Centro', 'SP', ' (17) 3304-8387',null, 'nutribov@hotmail.com');

INSERT INTO Operacao( Descricao, Tipo)VALUES
('Venda de Leite','E'),
('Venda de Terneiros','E'),
('Compra de Vacinas','S'),
('Compra de Ração', 'S'),
 ('Compra de Pastagem' ,'S');
 

INSERT INTO Funcao(nome)VALUES
('administrador'),
('funcionario');

INSERT INTO Usuario (nome_usuario, senha_usuario, cpf, email, funcao, telefone) VALUES
('Dekamilk', 'deka','924.445.570-69', 'administrativo@dekamilk.com.br', 1, '54 70707-7070');

INSERT INTO ClassificacaoBovina (nome) VALUES
('0 a 12 meses'), 
('13 a 24 meses'),
('25 a 36 meses'),
('mais de 36 meses');

INSERT INTO Raca (nome) VALUES
('Holandesa(ês)'),
('Jersey'),
('Pardo Suíço'),
('Gir'),
('Girolando'),
('Guzerá'),
('Sindi'),
('Angus');

INSERT INTO Animal(id_cassificacao,id_raca, numero_brinco,nome, nome_pai, nome_mae, inseminada, lactante, numero_crias, sexo, data_cria)VALUES
(3, 1, 211, 'Jeniffer', null, null, true, 'S', 1, 'F', '13/03/2022'),
(2, 1, 212, 'Mimosa', 'Tonhao', 'Alberta', false, 'S', 1, 'F', '15/09/2022'),
(3, 1, 213, 'Xuxinha', null, null, true, 'N', 1, 'F', '12/02/2022'),
(3, 1, 214, 'Chapisco', null, null, false, 'N', 1, 'M', '22/02/2022');

*/