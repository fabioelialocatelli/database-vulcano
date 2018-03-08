SELECT
    LOWER(REGEXP_REPLACE('Campi Flegrei','\s') )
FROM
    dual;

SELECT
    COALESCE(NULL,'Deccan Traps', NULL,'Pinatubo')
FROM
    dual;

SELECT
    NVL(TO_CHAR(isDecade), 'Gone Missing')
FROM
    volcanoActive;