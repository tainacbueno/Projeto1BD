-- Inserindo Departamentos
INSERT INTO Departamento (id_departamento, nome, id_chefe) VALUES
(1, 'Ciência da Computação', 1),
(2, 'Matemática', 4);

-- Inserindo Cursos
INSERT INTO Curso (id_curso, nome, id_departamento, id_coordenador) VALUES
(1, 'Ciência da Computação', 1, 1),
(2, 'Ciência de Dados', 1, 2),
(3, 'Matemática', 2, 4);

-- Inserindo Professores
INSERT INTO Professor (id_professor, nome, id_departamento) VALUES
(1, 'Dr. João Almeida', 1),
(2, 'Profa. Ana Silva', 1),
(3, 'Dr. Carlos Souza', 2),
(4, 'Profa. Juliana Lima', 2);

-- Inserindo Disciplinas
INSERT INTO Disciplina (id_disciplina, nome, codigo, carga_horaria) VALUES
(101, 'Banco de Dados', 'BD001', 70),
(102, 'Estrutura de Dados', 'ED001', 80),
(103, 'Estatística I', 'EST001', 60),
(104, 'Cálculo I', 'CAL001', 60);

-- Inserindo Relação Curso-Disciplina
INSERT INTO Curso_Disciplina (id_curso, id_disciplina, semestre) VALUES
(1, 101, 3),
(1, 102, 2),
(1, 103, 4),
(2, 101, 3),
(2, 103, 2),
(3, 103, 3),
(3, 104, 1);

-- Inserindo Alunos
INSERT INTO Aluno (id_aluno, nome, data_nascimento, id_curso) VALUES
(1, 'João Silva', '10/05/2000', 1),
(2, 'Maria Souza', '15/03/2001', 1),
(3, 'Pedro Santos', '20/08/2002', 2),
(4, 'Ana Clara', '05/11/2000', 3);

-- Inserindo Histórico Escolar (com reprovação e aprovação)
INSERT INTO Historico_Escolar (id_aluno, id_disciplina, semestre, ano, nota, situacao) VALUES
(1, 101, 1, 2023, 4.5, 'Reprovado'),
(1, 101, 2, 2023, 8.0, 'Aprovado'),
(2, 102, 1, 2023, 7.0, 'Aprovado'),
(3, 103, 1, 2023, 5.0, 'Reprovado'),
(3, 103, 2, 2023, 7.5, 'Aprovado'),
(4, 104, 1, 2023, 6.0, 'Aprovado');


-- Inserindo Disciplinas Lecionadas por Professores
INSERT INTO Disciplina_Professor (id_professor, id_disciplina, semestre, ano) VALUES
(1, 101, 1, 2023),
(2, 102, 1, 2023),
(3, 103, 1, 2023),
(4, 104, 1, 2023);

-- Inserindo TCCs
INSERT INTO TCC (id_tcc, titulo, ano, semestre, id_orientador) VALUES
(1, 'Sistema de Recomendação de Filmes', 2023, 2, 1),
(2, 'Análise de Dados de Vendas', 2023, 2, 2);

-- Inserindo Alunos nos TCCs
INSERT INTO TCC_Aluno (id_tcc, id_aluno) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4);