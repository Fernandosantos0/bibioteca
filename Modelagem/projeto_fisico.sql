/* Criando o banco de dados */
CREATE DATABASE IF NOT EXISTS biblioteca DEFAULT CHARSET 'utf8mb4' DEFAULT CHARACTER SET 'utf8mb4' DEFAULT COLLATE 'utf8mb4_general_ci';

/* Listando todos os bando de dados */
SHOW DATABASES;

/* Selecionando o bando de dados */
USE biblioteca;

/* Criando as tabelas */
CREATE TABLE IF NOT EXISTS Autor (
	Id INT AUTO_INCREMENT,
    Nome VARCHAR(255),
    DAta_Nascimento DATE,
    CPF CHAR(11),
    PRIMARY KEY(id)
) CHARSET = 'utf8', COMMENT = 'Tabela para guardar informações do autor do livro';

CREATE TABLE IF NOT EXISTS Categoria (
	Id INT AUTO_INCREMENT,
    Descricao MEDIUMTEXT,
    PRIMARY KEY(id)
) CHARSET = 'utf8', COMMENT = 'Tabela para guardar a categória do livro';

CREATE TABLE IF NOT EXISTS Livro (
	Id INT AUTO_INCREMENT,
    Id_Categoria INT NOT NULL,
    Titulo VARCHAR(255),
    Editora VARCHAR(155),
    Ano YEAR,
    Isbn VARCHAR(100),
    PRIMARY KEY(id),
    FOREIGN KEY(Id_Categoria) REFERENCES Autor(Id)
) CHARSET = 'utf8', COMMENT = 'Tabela para guardar informações do livro';

CREATE TABLE IF NOT EXISTS Aluno (
    Id INT AUTO_INCREMENT,
	Nome VARCHAR(150),
    RA INT,
    Curso VARCHAR(150),
    PRIMARY KEY(Id)
) CHARSET = 'utf8', COMMENT = 'Tabela para guardar alunos';

CREATE TABLE IF NOT EXISTS Usuario (
    Id INT AUTO_INCREMENT,
	Nome VARCHAR(150),
    Email VARCHAR(150),
    Senha VARCHAR(100),
    PRIMARY KEY(Id)
) CHARSET = 'utf8', COMMENT = 'Tabela para guardar contas de usuários';

CREATE TABLE IF NOT EXISTS Livro_Autor_Assoc (
    Id_livro INT NOT NULL,
    Id_Autor INT NOT NULL,
    FOREIGN KEY(Id_livro) REFERENCES Livro(Id),
    FOREIGN KEY(Id_Autor) REFERENCES Autor(Id),
    PRIMARY KEY(Id_livro, Id_Autor)
) CHARSET = 'utf8', COMMENT = 'Tabela para guardar informações';

CREATE TABLE IF NOT EXISTS Emprestimo (
	Id INT AUTO_INCREMENT,
    Data_Emprestimo DATE NOT NULL,
    Data_devolucao DATE NOT NULL,
    Id_Usuario INT NOT NULL,
    Id_Aluno INT NOT NULL,
    Id_Livro INT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(Id_Usuario) REFERENCES Usuario(Id),
    FOREIGN KEY(Id_Livro) REFERENCES Livro(Id),
    FOREIGN KEY(Id_Aluno) REFERENCES Aluno(Id)
) CHARSET = 'utf8', COMMENT = 'Tabela para guardar informações sobre emprestimos de livros';