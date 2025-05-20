SELECT * 
FROM Curso c
WHERE c.id_departamento NOT IN (SELECT id_departamento FROM Departamento);

SELECT * 
FROM Aluno a
WHERE a.id_curso NOT IN (SELECT id_curso FROM Curso);

SELECT * 
FROM Disciplina_Professor dp
WHERE dp.id_disciplina NOT IN (SELECT id_disciplina FROM Disciplina);

SELECT * 
FROM Disciplina_Professor dp
WHERE dp.id_professor NOT IN (SELECT id_professor FROM Professor);

SELECT * 
FROM TCC t
WHERE t.id_orientador NOT IN (SELECT id_professor FROM Professor);

SELECT * 
FROM TCC_Aluno ta
WHERE ta.id_aluno NOT IN (SELECT id_aluno FROM Aluno);

