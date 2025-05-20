CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    id_curso INT
);

CREATE TABLE Professor (
    id_professor INT PRIMARY KEY,
    nome VARCHAR(100),
    id_departamento INT
);

CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY,
    nome VARCHAR(100),
    id_chefe INT
);

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    nome VARCHAR(100),
    id_departamento INT,
    id_coordenador INT
);

CREATE TABLE Disciplina (
    id_disciplina INT PRIMARY KEY,
    nome VARCHAR(100),
    codigo VARCHAR(10),
    carga_horaria INT
);

CREATE TABLE Curso_Disciplina (
    id_curso INT,
    id_disciplina INT,
    semestre INT,
    PRIMARY KEY (id_curso, id_disciplina)
);

CREATE TABLE Historico_Escolar (
    id_aluno INT,
    id_disciplina INT,
    semestre INT,
    ano INT,
    nota DECIMAL(4,2),
    situacao VARCHAR(20)
);

CREATE TABLE Disciplina_Professor (
    id_professor INT,
    id_disciplina INT,
    semestre INT,
    ano INT
);

CREATE TABLE TCC (
    id_tcc INT PRIMARY KEY,
    titulo VARCHAR(200),
    ano INT,
    semestre INT,
    id_orientador INT
);

CREATE TABLE TCC_Aluno (
    id_tcc INT,
    id_aluno INT,
    PRIMARY KEY (id_tcc, id_aluno)
);