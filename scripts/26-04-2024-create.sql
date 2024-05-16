
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



CREATE TABLE Cliente (
	cliente_id SERIAL NOT NULL,
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
	CONSTRAINT PK_cliente PRIMARY KEY (cliente_id)
);

CREATE TABLE Fornecedor (
	fornecedor_id SERIAL NOT NULL,
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
	CONSTRAINT PK_fornecedor PRIMARY KEY (fornecedor_id)
);
	
CREATE TABLE Operacao (
	operacao_id SERIAL NOT NULL,
	descricao VARCHAR(300) NOT NULL,
	tipo CHAR(1) CHECK (tipo IN ('E', 'S', 'N')), -- pode ser "E" de Entrada e "S" de Saida e "N" de Neutra 
	CONSTRAINT PK_Operacao PRIMARY KEY (operacao_id)
);

CREATE TABLE Movimento(
	movimento_id SERIAL NOT NULL,
	operacao_id INT NOT NULL,
	quantidade FLOAT NOT NULL,
	fornecedor_id INT,
	cliente_id INT , 
	descricao VARCHAR(300) NOT NULL,
	data_lancamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT PK_movimento_id PRIMARY KEY (movimento_id),
	CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
	CONSTRAINT FK_fornecedor_id FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
	CONSTRAINT FK_operacao_id FOREIGN KEY (operacao_id) REFERENCES Operacao(operacao_id)

);

CREATE TABLE PrecoUnitarioLitro (
    preco_unitario_id SERIAL NOT NULL,
	valor_unitario FLOAT NOT NULL DEFAULT '0.00',
	data_preco DATE NOT NULL,
	cliente_id INT NOT NULL,
	CONSTRAINT PK_preco_unitario_id PRIMARY KEY (preco_unitario_id),
	CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE Funcao(
	funcao_id SERIAL NOT NULL,
	nome VARCHAR(20) NOT NULL,
	CONSTRAINT PK_funcao_id PRIMARY KEY (funcao_id)
);

CREATE TABLE Usuario (
	usuario_id SERIAL NOT NULL,
	nome_usuario VARCHAR(60) NOT NULL UNIQUE,
	senha_usuario VARCHAR(20) NOT NULL,
	cpf VARCHAR(14) NOT NULL UNIQUE DEFAULT '000.000.000-00',
    email VARCHAR(70),
	funcao_id INT NOT NULL,
	telefone VARCHAR(15) DEFAULT '00 00000-0000',
	CONSTRAINT PK_usuario_id PRIMARY KEY (usuario_id),
	CONSTRAINT FK_funcao FOREIGN KEY (funcao_id) REFERENCES Funcao(funcao_id)
);

CREATE TABLE Raca(
	raca_id SERIAL NOT NULL,
	nome VARCHAR(20) NOT NULL,
	CONSTRAINT PK_raca_id PRIMARY KEY (raca_id)
);

CREATE TABLE Animal(
	animal_id SERIAL NOT NULL,
	raca_id INT NOT NULL,
	nr_brinco INT NOT NULL,
	idade INT,
	data_nasc DATE,
	apelido VARCHAR(15) NOT NULL,
	nome_pai VARCHAR(15),
	nome_mae VARCHAR(15),
	is_inseminada BOOLEAN NOT NULL,
	is_lactante BOOLEAN,
	numero_crias INT,
	peso FLOAT,
	sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
	data_ult_cria DATE, 
	CONSTRAINT PK_animal_id PRIMARY KEY (animal_id),
	CONSTRAINT FK_raca_id FOREIGN KEY (raca_id) REFERENCES Raca(raca_id)
);

CREATE TABLE Vacina(
	vacina_id SERIAL NOT NULL,
	nome_comercial VARCHAR NOT NULL,
	nome_doenca VARCHAR,
	principio_ativo VARCHAR NOT NULL, 
	tempo_previsto INT, -- refere-se a primeira a idade que deve ser feita a primeira vacinacao 
	tipo_aplicacao VARCHAR NOT NULL,
	CONSTRAINT PK_vacina_id PRIMARY KEY (vacina_id)
);

CREATE TABLE CalendarioVacinacao(
	vacinacao_id SERIAL NOT NULL, 
	animal_id INT NOT NULL, 
	vacina_id INT NOT NULL,
	data_vacinacao DATE NOT NULL,
	tempo_carencia INT, 
	data_prevista_proxima_vacinacao DATE,
	CONSTRAINT PK_vacinacao_id PRIMARY KEY (vacinacao_id),
	CONSTRAINT FK_animal_id FOREIGN KEY (animal_id) REFERENCES Animal(animal_id),
	CONSTRAINT FK_vacina_id FOREIGN KEY (vacina_id) REFERENCES Vacina(vacina_id)
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

INSERT INTO Usuario (nome_usuario, senha_usuario, cpf, email, funcao_id, telefone) VALUES
('Dekamilk', 'deka','924.445.570-69', 'administrativo@dekamilk.com.br', 1, '54 70707-7070');


INSERT INTO Raca (nome) VALUES
('Holandesa(ês)'),
('Jersey'),
('Pardo Suíço'),
('Gir'),
('Girolando'),
('Guzerá'),
('Sindi'),
('Angus');

INSERT INTO Animal(raca_id, numero_brinco,nome, nome_pai, nome_mae, is_inseminada, is_lactante, numero_crias, sexo, data_cria)VALUES
( 1, 211, 'Jeniffer', null, null, true, 'S', 1, 'F', '13/03/2022'),
( 1, 212, 'Mimosa', 'Tonhao', 'Alberta', false, 'S', 1, 'F', '15/09/2022'),
( 1, 213, 'Xuxinha', null, null, true, 'N', 1, 'F', '12/02/2022'),
( 1, 214, 'Chapisco', null, null, false, 'N', 1, 'M', '22/02/2022');

*/