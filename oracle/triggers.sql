CREATE OR REPLACE TRIGGER calderaAdded AFTER
    INSERT ON volcanoCaldera
    FOR EACH ROW
BEGIN
    DECLARE
        timestampSystem       TIMESTAMP := SYSTIMESTAMP;
        timestampFormatting   VARCHAR2(30 CHAR) := 'DD-MM-YYYY HH24:MI:SS';
        timestampFormatted    VARCHAR2(30 CHAR) := TO_CHAR(timestampSystem,timestampFormatting);
        newCaldera            VARCHAR2(45 CHAR) :=:NEW.localName;
        newCalderaFormatted   VARCHAR2(45 CHAR) := LOWER(REGEXP_REPLACE(newCaldera,'\s') );
        volcanoIdentifier     VARCHAR2(45 CHAR) :=:NEW.volcanoIdentifier;
        operationIdentifier   VARCHAR2(95 CHAR) := timestampFormatted
        || ' added '
        || newCalderaFormatted;
    BEGIN
        INSERT INTO historyCaldera (
            operationIdentifier,
            operationTime,
            operationType,
            localName,
            volcanoIdentifier
        ) VALUES (
            operationIdentifier,
            timestampFormatted,
            'INSERTION',
            newCaldera,
            volcanoIdentifier
        );

    END;
END;
/

CREATE OR REPLACE TRIGGER calderaEdited AFTER
    UPDATE ON volcanoCaldera
    FOR EACH ROW
BEGIN
    DECLARE
        timestampSystem            TIMESTAMP := SYSTIMESTAMP;
        timestampFormatting        VARCHAR2(30 CHAR) := 'DD-MM-YYYY HH24:MI:SS';
        timestampFormatted         VARCHAR2(30 CHAR) := TO_CHAR(timestampSystem,timestampFormatting);
        existingCaldera            VARCHAR2(45 CHAR) :=:OLD.localName;
        existingCalderaFormatted   VARCHAR2(45 CHAR) := LOWER(REGEXP_REPLACE(existingCaldera,'\s') );
        volcanoIdentifier          VARCHAR2(45 CHAR) :=:NEW.volcanoIdentifier;
        operationIdentifier        VARCHAR2(95 CHAR) := timestampFormatted
        || ' edited '
        || existingCalderaFormatted;
    BEGIN
        INSERT INTO historyCaldera (
            operationIdentifier,
            operationTime,
            operationType,
            localName,
            volcanoIdentifier
        ) VALUES (
            operationIdentifier,
            timestampFormatted,
            'EDITION',
            existingCaldera,
            volcanoIdentifier
        );

    END;
END;
/

CREATE OR REPLACE TRIGGER activeAdded AFTER
    INSERT ON volcanoActive
    FOR EACH ROW
BEGIN
    DECLARE
        timestampSystem       TIMESTAMP := SYSTIMESTAMP;
        timestampFormatting   VARCHAR2(30 CHAR) := 'DD-MM-YYYY HH24:MI:SS';
        timestampFormatted    VARCHAR2(30 CHAR) := TO_CHAR(timestampSystem,timestampFormatting);
        newActive             VARCHAR2(45 CHAR) :=:NEW.localName;
        newActiveFormatted    VARCHAR2(45 CHAR) := LOWER(REGEXP_REPLACE(newActive,'\s') );
        volcanoIdentifier     VARCHAR2(45 CHAR) :=:NEW.volcanoIdentifier;
        operationIdentifier   VARCHAR2(95 CHAR) := timestampFormatted
        || ' added '
        || newActiveFormatted;
    BEGIN
        INSERT INTO historyActive (
            operationIdentifier,
            operationTime,
            operationType,
            localName,
            volcanoIdentifier
        ) VALUES (
            operationIdentifier,
            timestampFormatted,
            'INSERTION',
            newActive,
            volcanoIdentifier
        );

    END;
END;
/

CREATE OR REPLACE TRIGGER activeEdited AFTER
    UPDATE ON volcanoActive
    FOR EACH ROW
BEGIN
    DECLARE
        timestampSystem           TIMESTAMP := SYSTIMESTAMP;
        timestampFormatting       VARCHAR2(30 CHAR) := 'DD-MM-YYYY HH24:MI:SS';
        timestampFormatted        VARCHAR2(30 CHAR) := TO_CHAR(timestampSystem,timestampFormatting);
        existingActive            VARCHAR2(45 CHAR) :=:OLD.localName;
        existingActiveFormatted   VARCHAR2(45 CHAR) := LOWER(REGEXP_REPLACE(existingActive,'\s') );
        volcanoIdentifier         VARCHAR2(45 CHAR) :=:NEW.volcanoIdentifier;
        operationIdentifier       VARCHAR2(95 CHAR) := timestampFormatted
        || ' edited '
        || existingActiveFormatted;
    BEGIN
        INSERT INTO historyActive (
            operationIdentifier,
            operationTime,
            operationType,
            localName,
            volcanoIdentifier
        ) VALUES (
            operationIdentifier,
            timestampFormatted,
            'EDITION',
            existingActive,
            volcanoIdentifier
        );

    END;
END;
/

CREATE OR REPLACE TRIGGER inactiveAdded AFTER
    INSERT ON volcanoInactive
    FOR EACH ROW
BEGIN
    DECLARE
        timestampSystem        TIMESTAMP := SYSTIMESTAMP;
        timestampFormatting    VARCHAR2(30 CHAR) := 'DD-MM-YYYY HH24:MI:SS';
        timestampFormatted     VARCHAR2(30 CHAR) := TO_CHAR(timestampSystem,timestampFormatting);
        newInactive            VARCHAR2(45 CHAR) :=:NEW.localName;
        newInactiveFormatted   VARCHAR2(45 CHAR) := LOWER(REGEXP_REPLACE(newInactive,'\s') );
        volcanoIdentifier      VARCHAR2(45 CHAR) :=:NEW.volcanoIdentifier;
        operationIdentifier    VARCHAR2(95 CHAR) := timestampFormatted
        || ' added '
        || newInactiveFormatted;
    BEGIN
        INSERT INTO historyInactive (
            operationIdentifier,
            operationTime,
            operationType,
            localName,
            volcanoIdentifier
        ) VALUES (
            operationIdentifier,
            timestampFormatted,
            'INSERTION',
            newInactive,
            volcanoIdentifier
        );

    END;
END;
/

CREATE OR REPLACE TRIGGER inactiveEdited AFTER
    UPDATE ON volcanoInactive
    FOR EACH ROW
BEGIN
    DECLARE
        timestampSystem             TIMESTAMP := SYSTIMESTAMP;
        timestampFormatting         VARCHAR2(30 CHAR) := 'DD-MM-YYYY HH24:MI:SS';
        timestampFormatted          VARCHAR2(30 CHAR) := TO_CHAR(timestampSystem,timestampFormatting);
        existingInactive            VARCHAR2(45 CHAR) :=:OLD.localName;
        existingInactiveFormatted   VARCHAR2(45 CHAR) := LOWER(REGEXP_REPLACE(existingInactive,'\s') );
        volcanoIdentifier           VARCHAR2(45 CHAR) :=:NEW.volcanoIdentifier;
        operationIdentifier         VARCHAR2(95 CHAR) := timestampFormatted
        || ' edited '
        || existingInactiveFormatted;
    BEGIN
        INSERT INTO historyInactive (
            operationIdentifier,
            operationTime,
            operationType,
            localName,
            volcanoIdentifier
        ) VALUES (
            operationIdentifier,
            timestampFormatted,
            'EDITION',
            existingInactive,
            volcanoIdentifier
        );

    END;
END;
/
