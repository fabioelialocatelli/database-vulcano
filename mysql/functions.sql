USE vulcano;

DELIMITER $$

DROP FUNCTION IF EXISTS eruptionMagnitude$$
CREATE FUNCTION eruptionMagnitude(eruptedMass FLOAT) RETURNS FLOAT
SQL SECURITY INVOKER
NO SQL
BEGIN
	DECLARE magnitude FLOAT;
    SET magnitude := LOG(10, @eruptedMass) - 7;
	RETURN(magnitude);
END$$

DROP FUNCTION IF EXISTS eruptionIntensity$$
CREATE FUNCTION eruptionIntensity(massEruptionRate FLOAT) RETURNS FLOAT
SQL SECURITY INVOKER
NO SQL
BEGIN
	DECLARE intensity FLOAT;
    SET intensity := LOG(10, @massEruptionRate) + 3;
	RETURN(intensity);
END$$

DELIMITER ;
