-- Histórico escolar aprovação/reprovação
SELECT 
    he.id_aluno,
    a.nome AS nome_aluno,
    d.nome AS nome_disciplina,
    he.ano,
    he.semestre,
    he.nota,
    he.situacao
FROM Historico_Escolar he
JOIN Aluno a ON he.id_aluno = a.id_aluno
JOIN Disciplina d ON he.id_disciplina = d.id_disciplina
WHERE he.id_aluno = 3 -- id_aluno
  AND d.id_disciplina IN (
      SELECT id_disciplina
      FROM Historico_Escolar
      WHERE situacao = 'Reprovado'
      INTERSECT
      SELECT id_disciplina
      FROM Historico_Escolar
      WHERE situacao = 'Aprovado'
      AND id_aluno = he.id_aluno
  )
ORDER BY d.nome, he.ano, he.semestre;

--TCC pelo professor
SELECT 
    t.titulo,
    t.ano,
    t.semestre,
    p.nome AS nome_orientador,
    a.nome AS nome_aluno
FROM TCC t
JOIN Professor p ON t.id_orientador = p.id_professor
JOIN TCC_Aluno ta ON t.id_tcc = ta.id_tcc
JOIN Aluno a ON ta.id_aluno = a.id_aluno
WHERE p.id_professor = 2 -- id_professor
ORDER BY t.ano, t.semestre;

-- 2 cursos com disciplina em comum
SELECT 
    c.nome AS nome_curso,
    d.nome AS nome_disciplina,
    cd.semestre
FROM Curso_Disciplina cd
JOIN Curso c ON cd.id_curso = c.id_curso
JOIN Disciplina d ON cd.id_disciplina = d.id_disciplina
WHERE c.nome = 'Ciência da Computação'
ORDER BY cd.semestre;

SELECT 
    c.nome AS nome_curso,
    d.nome AS nome_disciplina,
    cd.semestre
FROM Curso_Disciplina cd
JOIN Curso c ON cd.id_curso = c.id_curso
JOIN Disciplina d ON cd.id_disciplina = d.id_disciplina
WHERE c.nome = 'Ciência de Dados'
ORDER BY cd.semestre;


-- Disciplinas cursadas pelo aluno com nome do professor
SELECT 
    d.codigo,
    d.nome AS nome_disciplina,
    p.nome AS nome_professor
FROM Historico_Escolar he
JOIN Disciplina d ON he.id_disciplina = d.id_disciplina
JOIN Disciplina_Professor dp ON 
    dp.id_disciplina = d.id_disciplina AND 
    dp.semestre = he.semestre AND 
    dp.ano = he.ano
JOIN Professor p ON dp.id_professor = p.id_professor
WHERE he.id_aluno = 1 -- id_aluno
  AND he.situacao = 'Aprovado'
ORDER BY he.ano, he.semestre;

-- Chefes de depto e coords
SELECT 
    p.nome AS nome_professor,
    COALESCE(d.nome, 'nenhum') AS departamento_que_coordena,
    COALESCE(c.nome, 'nenhum') AS curso_que_coordena
FROM Professor p
LEFT JOIN Departamento d ON p.id_professor = d.id_chefe
LEFT JOIN Curso c ON p.id_professor = c.id_coordenador;

-- QUERIES ADICIONAIS

-- 1. Quais são os cursos oferecidos por um determinado departamento?
SELECT 
    c.nome AS nome_curso
FROM Curso c
WHERE c.id_departamento = 1; -- id_departamento

-- 2. Quais são os estudantes matriculados em um curso específico?
SELECT 
    a.nome AS nome_aluno
FROM Aluno a
WHERE a.id_curso = 1; -- id_curso

-- 3. Quais são os cursos ministrados por um instrutor em um determinado semestre?
SELECT DISTINCT c.nome AS nome_curso
FROM Disciplina_Professor dp
JOIN Disciplina d ON dp.id_disciplina = d.id_disciplina
JOIN Curso_Disciplina cd ON d.id_disciplina = cd.id_disciplina
JOIN Curso c ON cd.id_curso = c.id_curso
WHERE dp.id_professor = 3 -- id_professor
  AND dp.semestre = 1     -- semestre
  AND dp.ano = 2023;      -- ano

-- 4. Quais são os cursos com créditos maiores que um determinado valor?
SELECT 
    d.nome AS nome_disciplina,
    d.carga_horaria
FROM Disciplina d
WHERE d.carga_horaria > 50; -- valor da carga_horaria

-- 5. Quais são os alunos que obtiveram uma nota específica em um determinado curso?
SELECT 
    a.nome AS nome_aluno,
    he.nota
FROM Historico_Escolar he
JOIN Aluno a ON he.id_aluno = a.id_aluno
JOIN Disciplina d ON he.id_disciplina = d.id_disciplina
WHERE d.id_disciplina = 103 -- id_disciplina
  AND he.nota = 4.8; -- nota

--  6. Quais são os cursos que não foram oferecidos em um determinado semestre?
SELECT 
    d.nome AS nome_disciplina
FROM Disciplina d
LEFT JOIN Curso_Disciplina cd ON d.id_disciplina = cd.id_disciplina AND cd.semestre = 2 -- semestre
WHERE cd.id_disciplina IS NULL;

--  7. Quais são os cursos que um determinado instrutor ainda não ministrou?
SELECT 
    d.nome AS nome_disciplina
FROM Disciplina d
WHERE d.id_disciplina NOT IN (
    SELECT dp.id_disciplina
    FROM Disciplina_Professor dp
    WHERE dp.id_professor = 2 -- id_professor
);

-- 8. Quais são os instrutores que não ministram nenhum curso em um determinado semestre?
SELECT 
    p.nome AS nome_professor
FROM Professor p
WHERE p.id_professor NOT IN (
    SELECT DISTINCT dp.id_professor
    FROM Disciplina_Professor dp
    WHERE dp.semestre = 2 AND dp.ano = 2023 -- semestre e ano
);

-- 9. Quais são os instrutores e seus departamentos?
SELECT 
    p.nome AS nome_professor,
    d.nome AS nome_departamento
FROM Professor p
JOIN Departamento d ON p.id_departamento = d.id_departamento;

-- 10. Quais são os alunos que participaram de TCCs em um determinado ano?
SELECT 
    a.nome AS nome_aluno,
    t.titulo,
    t.ano
FROM TCC_Aluno ta
JOIN Aluno a ON ta.id_aluno = a.id_aluno
JOIN TCC t ON ta.id_tcc = t.id_tcc
WHERE t.ano = 2022; -- ano
