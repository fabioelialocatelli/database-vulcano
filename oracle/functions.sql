CREATE OR REPLACE FUNCTION eruptionMagnitude (
    eruptedMass IN FLOAT
) RETURN FLOAT IS
    DECLARE   magnitude FLOAT := LOG(10, eruptedMass) - 7;
BEGIN
    RETURN magnitude;
END;

CREATE OR REPLACE FUNCTION eruptionIntensity (
    massEruptionRate IN FLOAT
) RETURN FLOAT IS
    DECLARE   intensity FLOAT := LOG(10, massEruptionRate) + 3;
BEGIN
    RETURN intensity;
END;
