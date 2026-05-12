GO

CREATE PROCEDURE dbo.salaryHistogram 
    @numIntervalos INT
AS
BEGIN

    DECLARE @minSalary DECIMAL(18,2), @maxSalary DECIMAL(18,2), @amplitude DECIMAL(18,2);
    
    SELECT @minSalary = MIN(salary), @maxSalary = MAX(salary) FROM instructor;
    
    SET @amplitude = (@maxSalary - @minSalary) / @numIntervalos;

    ;WITH Faixas AS (
        SELECT 
            salary,
            FLOOR((salary - @minSalary) / CASE WHEN @amplitude = 0 THEN 1 ELSE @amplitude END) AS indice
        FROM instructor
    ),
    Indices AS (
        SELECT 
            salary, 
            CASE WHEN indice >= @numIntervalos THEN @numIntervalos - 1 ELSE indice END AS idx
        FROM Faixas
    )
    SELECT 
        FLOOR(@minSalary + (idx * @amplitude)) AS valorMinimo,
        FLOOR(@minSalary + ((idx + 1) * @amplitude)) AS valorMaximo,
        COUNT(*) AS total
    FROM Indices
    GROUP BY idx
    ORDER BY idx;
END;
GO