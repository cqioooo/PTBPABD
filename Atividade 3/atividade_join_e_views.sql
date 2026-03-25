-- Questão 1: relação a partir da união das tabelas student e takes.

SELECT s.ID, s.name, s.dept_name, s.tot_cred, t.course_id, t.sec_id, t.semester, t.year, t.grade
FROM student AS s
JOIN takes  AS t
  ON s.ID = t.ID;

-- Questão 2: quantidade de cursos realizados pelos alunos do departamento de Civil Eng. 

SELECT s.ID, s.name, COUNT(*) AS qtd_cursos
FROM student AS s
JOIN takes   AS t
  ON s.ID = t.ID
WHERE s.dept_name = 'Civil Eng.'
GROUP BY s.ID, s.name
ORDER BY qtd_cursos DESC;


-- Questão 3: view chamada 'civil_eng_students' a partir da relação construída na Questão 2.
-- Query só aceita quando executada individualmente das outras, por isso comentada 


/* CREATE VIEW civil_eng_students AS
SELECT s.ID, s.name, COUNT(*) AS qtd_cursos
FROM student s
JOIN takes t ON s.ID = t.ID
WHERE s.dept_name = 'Civil Eng'
GROUP BY s.ID, s.name;
