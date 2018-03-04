USE vulcano
GO

CREATE OR ALTER FUNCTION eruptionMagnitude(@eruptedMass FLOAT)
RETURNS FLOAT
WITH EXECUTE AS CALLER
AS
BEGIN
	DECLARE @magnitude AS FLOAT = LOG(10, @eruptedMass) - 7
	RETURN @magnitude
END
GO

CREATE OR ALTER FUNCTION eruptionIntensity(@massEruptionRate FLOAT)
RETURNS FLOAT
WITH EXECUTE AS CALLER
AS
BEGIN
	DECLARE @intensity AS FLOAT = LOG(10, @massEruptionRate) + 3
	RETURN @intensity
END
GO
