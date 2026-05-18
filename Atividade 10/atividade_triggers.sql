GO

CREATE TRIGGER dbo.gain_credits
ON dbo.takes
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE s
    SET s.tot_cred = s.tot_cred + c.credits
    FROM dbo.student AS s
    INNER JOIN inserted AS i ON s.ID = i.ID
    INNER JOIN dbo.course AS c ON i.course_id = c.course_id;
END;
GO