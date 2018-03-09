SELECT
    LOWER(REGEXP_REPLACE('Campi Flegrei','\s') )
FROM
    dual;

SELECT
    COALESCE(NULL,'Deccan Traps',NULL,'Pinatubo')
FROM
    dual;

SELECT
    NVL(TO_CHAR(isDecade),'Gone Missing')
FROM
    volcanoActive;

SELECT
    CURRENT_DATE
FROM
    dual;

SELECT
    CURRENT_TIMESTAMP,
    LOCALTIMESTAMP
FROM
    dual;

SELECT
    TO_CHAR(LOCALTIMESTAMP,'YYYY/MM/DD HH24:MM:SSxFF')
FROM
    dual;

SELECT
    CURRENT_TIMESTAMP - NUMTODSINTERVAL(100,'DAY')
FROM
    dual;

SELECT
    REGEXP_REPLACE(TO_CHAR(LOCALTIMESTAMP,'YYYYMMDDHH24MMSSFF'),'\s')
FROM
    dual;