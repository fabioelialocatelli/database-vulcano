SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%X%U%H%I%S%f');

SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%f');

SELECT UNIX_TIMESTAMP();

SELECT ROUND(UNIX_TIMESTAMP(CURRENT_TIME(5)) * 1000);

SELECT UNIX_TIMESTAMP(CURRENT_TIME(5)) * 1000;

SELECT CURTIME(6);

SELECT 
    CONCAT(DATE_FORMAT(CURRENT_TIMESTAMP(), '%y%m%d%u'),
            '@',
            ROUND(UNIX_TIMESTAMP(CURRENT_TIME(6)) * 1000));

SELECT 
    LENGTH(CONCAT(DATE_FORMAT(CURRENT_TIMESTAMP(), '%y%m%d%u'),
                    '@',
                    ROUND(UNIX_TIMESTAMP(CURRENT_TIMESTAMP) * 1000)));

SELECT 
    CAST(ROUND(UNIX_TIMESTAMP(CURRENT_TIME(5)) * 1000)
        AS CHAR);
        
SELECT COALESCE(NULL, 'Deccan Traps', NULL, 'Pinatubo');
