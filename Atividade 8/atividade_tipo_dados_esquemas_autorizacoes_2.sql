-- Questão 1

GRANT SELECT (ID, name , dept_name)
ON instructor
TO User_B;

GRANT SELECT (ID, course_id, sec_id, semester, year)
ON takes
TO User_B;

-- Questão 2

GRANT SELECT, UPDATE (course_id, sec_id, semester, year)
ON section
TO User_C;

-- Questão 3

GRANT SELECT ON instructor TO User_D;
GRANT SELECT ON student TO User_D;
GRANT SELECT ON grade_points TO User_D;

-- Questão 4

GO

CREATE VIEW student_civil_eng AS SELECT * FROM student
WHERE dept_name = 'Civil Eng.';

GO

GRANT SELECT
ON student_civil_eng
TO User_E;

-- Questão 5

REVOKE SELECT ON student_civil_eng FROM User_E;

-- Questão 6

SELECT 
    USER_NAME(grantee_principal_id) AS Usuario,
    permission_name AS Privilegio,
    state_desc AS Estado,
    OBJECT_NAME(major_id) AS Objeto
FROM sys.database_permissions
WHERE USER_NAME(grantee_principal_id) IN ('User_A', 'User_B', 'User_C', 'User_D', 'User_E');