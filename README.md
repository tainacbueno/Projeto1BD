#### Grupo 4:
Tainá Cunha Bueno <br>
RA: 22.119.025-9

### Descrição
Este projeto simula um banco de dados simples de uma universidade. Ele inclui tabelas de Departamentos, Cursos, Professores, Alunos, Disciplinas, Históricos Escolares e TCCs, e todos os dados inseridos são fictícios. <br>
Algumas das consultas feitas são: <br>
-Disciplinas cursadas por um aluno e seus respectivos professores; <br>
-Alunos que participaram de TCCs; <br>
-Cursos com disciplinas em comum; <br>
-Professores que não lecionaram em determinado semestre.

### Como executar o projeto
Este projeto é composto por quatro scripts principais em SQL. Abaixo está a ordem recomendada de execução e o que cada um faz:

1. DDL.sql – Criação das Tabelas <br>
Este é o primeiro script que você deve rodar. Ele cria toda a estrutura do banco de dados, incluindo as tabelas necessárias para armazenar os dados da universidade (como alunos, professores, cursos, disciplinas, etc.) <br>
*Importante: Execute esse script antes de qualquer outro.*

2. Insercao.sql – Inserção de Dados <br>
Depois que as tabelas forem criadas, este script insere dados fictícios nelas. Ele preenche o banco com informações como nomes de alunos, professores, disciplinas, cursos e históricos escolares.

3. consistenciaDosDados.sql – Validação dos Dados <br>
Este script executa uma série de consultas para verificar se os dados inseridos estão consistentes. Ele checa, por exemplo, se todos os alunos estão vinculados a cursos válidos e se os professores estão corretamente associados às disciplinas, entre outros pontos.
O ideal é que nenhuma linha seja retornada nessas consultas, indicando que está tudo certo.

4. Queries.sql – Consultas e Análises <br>
Por fim, este script contém várias consultas SQL que extraem informações úteis do banco de dados.

### Modelo Relacional na 3FN
![MR - 3FN](https://github.com/user-attachments/assets/36b03382-07b9-4f29-b39f-94cf78fa491d)

### Modelo Entidade Relacionamento (MER) 
![MER_final](https://github.com/user-attachments/assets/9b4a9123-8d80-457b-b6a7-1d9e6633b14a)
