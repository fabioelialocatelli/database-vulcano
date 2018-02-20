DROP TABLE material CASCADE CONSTRAINTS PURGE;
CREATE TABLE material (
    materialIdentifier         VARCHAR2(3 CHAR) NOT NULL,
    scientificName             VARCHAR2(15 CHAR),
    alkalicontentpercentage    NUMBER(3,1),
    silicacontentpercentage    NUMBER(3,1),
    crystalcontentpercentage   NUMBER(3,1),
    isMafic                    CHAR(1),
    isSilicic                  CHAR(1)
);
ALTER TABLE material ADD CONSTRAINT material_PK PRIMARY KEY ( materialIdentifier );

DROP TABLE compositionActive CASCADE CONSTRAINTS PURGE;
CREATE TABLE compositionActive (
    materialIdentifier   VARCHAR2(3 CHAR) NOT NULL,
    volcanoIdentifier    VARCHAR2(3 CHAR) NOT NULL,
    materialOccurrence   INTEGER
);
ALTER TABLE compositionActive ADD CONSTRAINT compositionActive_PK PRIMARY KEY ( materialIdentifier,
volcanoIdentifier );

DROP TABLE compositionCaldera CASCADE CONSTRAINTS PURGE;
CREATE TABLE compositionCaldera (
    materialIdentifier   VARCHAR2(3 CHAR) NOT NULL,
    volcanoIdentifier    VARCHAR2(3 CHAR) NOT NULL,
    materialOccurrence   INTEGER
);
ALTER TABLE compositionCaldera ADD CONSTRAINT compositionCaldera_PK PRIMARY KEY ( materialIdentifier,
volcanoIdentifier );

DROP TABLE compositionInactive CASCADE CONSTRAINTS PURGE;
CREATE TABLE compositionInactive (
    materialIdentifier   VARCHAR2(3 CHAR) NOT NULL,
    volcanoIdentifier    VARCHAR2(3 CHAR) NOT NULL,
    materialOccurrence   INTEGER
);
ALTER TABLE compositionInactive ADD CONSTRAINT compositionInactive_PK PRIMARY KEY ( materialIdentifier,
volcanoIdentifier );

DROP TABLE eruptionCategory CASCADE CONSTRAINTS PURGE;
CREATE TABLE eruptionCategory (
    categoryIdentifier   VARCHAR2(4 CHAR) NOT NULL,
    scientificName       VARCHAR2(15 CHAR),
    descriptor           VARCHAR2(15 CHAR),
    maximumVEI           INTEGER
);
ALTER TABLE eruptionCategory ADD CONSTRAINT eruptionCategory_PK PRIMARY KEY ( categoryIdentifier );

DROP TABLE eruptionHistoric CASCADE CONSTRAINTS PURGE;
CREATE TABLE eruptionHistoric (
    eruptionIdentifier   VARCHAR2(3 CHAR) NOT NULL,
    volcanoIdentifier    VARCHAR2(3 CHAR) NOT NULL,
    categoryIdentifier   VARCHAR2(4 CHAR) NOT NULL,
    startdate            DATE,
    finishdate           DATE,
    certainty            NVARCHAR2(15),
    evidence             NVARCHAR2(15),
    activityarea         NVARCHAR2(15)
);
ALTER TABLE eruptionHistoric
    ADD CONSTRAINT eruptionHistoric_PK PRIMARY KEY ( eruptionIdentifier,
    volcanoIdentifier,
    categoryIdentifier );

DROP TABLE eruptionPrehistoric CASCADE CONSTRAINTS PURGE;
CREATE TABLE eruptionPrehistoric (
    eruptionIdentifier   VARCHAR2(3 CHAR) NOT NULL,
    volcanoIdentifier    VARCHAR2(3 CHAR) NOT NULL,
    yearsbeforepresent   INTEGER,
    evidence             NVARCHAR2(15)
);
ALTER TABLE eruptionPrehistoric ADD CONSTRAINT eruptionPrehistoric_PK PRIMARY KEY ( eruptionIdentifier,
volcanoIdentifier );

DROP TABLE volcanoActive CASCADE CONSTRAINTS PURGE;
CREATE TABLE volcanoActive (
    volcanoIdentifier       VARCHAR2(3 CHAR) NOT NULL,
    smithsonianIdentifier   INTEGER,
    localName               NVARCHAR2(45),
    latitude                FLOAT(5),
    longitude               FLOAT(5),
    maximumVEI              INTEGER,
    summitElevationMetres   INTEGER,
    areaSquareKilometres    FLOAT(5),
    isDecade                CHAR(1)
);
ALTER TABLE volcanoActive ADD CONSTRAINT volcanoActive_PK PRIMARY KEY ( volcanoIdentifier );

DROP TABLE volcanoCaldera CASCADE CONSTRAINTS PURGE;
CREATE TABLE volcanoCaldera (
    volcanoIdentifier           VARCHAR2(3 CHAR) NOT NULL,
    smithsonianIdentifier       INTEGER,
    localName                   NVARCHAR2(45),
    latitude                    FLOAT(5),
    longitude                   FLOAT(5),
    maximumVEI                  INTEGER,
    maximumElevationMetres      INTEGER,
    maximumDiameterKilometres   INTEGER,
    depositsCubicKilometers     FLOAT(5),
    isDecade                    CHAR(1)
);
ALTER TABLE volcanoCaldera ADD CONSTRAINT volcanoCaldera_PK PRIMARY KEY ( volcanoIdentifier );

DROP TABLE volcanoInactive CASCADE CONSTRAINTS PURGE;
CREATE TABLE volcanoInactive (
    volcanoIdentifier       VARCHAR2(3 CHAR) NOT NULL,
    smithsonianIdentifier   INTEGER,
    localName               NVARCHAR2(45),
    latitude                FLOAT(5),
    longitude               FLOAT(5),
    summitElevationMetres   INTEGER,
    areaSquareKilometres    FLOAT(5)
);
ALTER TABLE volcanoInactive ADD CONSTRAINT volcanoInactive_PK PRIMARY KEY ( volcanoIdentifier );

DROP TABLE historyActive CASCADE CONSTRAINTS PURGE;
CREATE TABLE historyActive (
    operationIdentifier   VARCHAR2(25 CHAR) NOT NULL,
    operationTime         TIMESTAMP,
    operationType         VARCHAR2(15 CHAR),
    localName             NVARCHAR2(45),
    volcanoIdentifier     VARCHAR2(3 CHAR) NOT NULL
);
ALTER TABLE historyActive ADD CONSTRAINT historyActive_PK PRIMARY KEY ( operationIdentifier );

DROP TABLE historyCaldera CASCADE CONSTRAINTS PURGE;
CREATE TABLE historyCaldera (
    operationIdentifier   VARCHAR2(25 CHAR) NOT NULL,
    operationTime         TIMESTAMP,
    operationType         VARCHAR2(15 CHAR),
    localName             NVARCHAR2(45),
    volcanoIdentifier     VARCHAR2(3 CHAR) NOT NULL
);
ALTER TABLE historyCaldera ADD CONSTRAINT historyCaldera_PK PRIMARY KEY ( operationIdentifier );

DROP TABLE historyInactive CASCADE CONSTRAINTS PURGE;
CREATE TABLE historyInactive (
    operationIdentifier   VARCHAR2(25 CHAR) NOT NULL,
    operationTime         TIMESTAMP,
    operationType         VARCHAR2(15 CHAR),
    localName             NVARCHAR2(45),
    volcanoIdentifier     VARCHAR2(3 CHAR) NOT NULL
);
ALTER TABLE historyInactive ADD CONSTRAINT historyInactive_PK PRIMARY KEY ( operationIdentifier );

ALTER TABLE compositionActive
    ADD CONSTRAINT cActive_material_FK FOREIGN KEY ( materialIdentifier )
        REFERENCES material ( materialIdentifier );

ALTER TABLE compositionActive
    ADD CONSTRAINT cActive_vActive_FK FOREIGN KEY ( volcanoIdentifier )
        REFERENCES volcanoActive ( volcanoIdentifier );

ALTER TABLE compositionCaldera
    ADD CONSTRAINT cCaldera_material_FK FOREIGN KEY ( materialIdentifier )
        REFERENCES material ( materialIdentifier );

ALTER TABLE compositionCaldera
    ADD CONSTRAINT cCaldera_vCaldera_FK FOREIGN KEY ( volcanoIdentifier )
        REFERENCES volcanoCaldera ( volcanoIdentifier );

ALTER TABLE compositionInactive
    ADD CONSTRAINT cInactive_material_FK FOREIGN KEY ( materialIdentifier )
        REFERENCES material ( materialIdentifier );

ALTER TABLE compositionInactive
    ADD CONSTRAINT cInactive_vInactive_FK FOREIGN KEY ( volcanoIdentifier )
        REFERENCES volcanoInactive ( volcanoIdentifier );

ALTER TABLE eruptionHistoric
    ADD CONSTRAINT eHistoric_eCategory_FK FOREIGN KEY ( categoryIdentifier )
        REFERENCES eruptionCategory ( categoryIdentifier );

ALTER TABLE eruptionHistoric
    ADD CONSTRAINT eHistoric_vActive_FK FOREIGN KEY ( volcanoIdentifier )
        REFERENCES volcanoActive ( volcanoIdentifier );

ALTER TABLE eruptionHistoric
    ADD CONSTRAINT eHistoric_vCaldera_FK FOREIGN KEY ( volcanoIdentifier )
        REFERENCES volcanoCaldera ( volcanoIdentifier );

ALTER TABLE eruptionPrehistoric
    ADD CONSTRAINT ePrehistoric_vActive_FK FOREIGN KEY ( volcanoIdentifier )
        REFERENCES volcanoActive ( volcanoIdentifier );

ALTER TABLE eruptionPrehistoric
    ADD CONSTRAINT ePrehistoric_vCaldera_FK FOREIGN KEY ( volcanoIdentifier )
        REFERENCES volcanoCaldera ( volcanoIdentifier );

ALTER TABLE eruptionPrehistoric
    ADD CONSTRAINT ePrehistoric_vInactive_FK FOREIGN KEY ( volcanoIdentifier )
        REFERENCES volcanoInactive ( volcanoIdentifier );

ALTER TABLE historyActive
    ADD CONSTRAINT hActive_vActive_FK FOREIGN KEY ( volcanoIdentifier )
        REFERENCES volcanoActive ( volcanoIdentifier );

ALTER TABLE historyInactive
    ADD CONSTRAINT hActive_vInactive_FK FOREIGN KEY ( volcanoIdentifier )
        REFERENCES volcanoInactive ( volcanoIdentifier );

ALTER TABLE historyCaldera
    ADD CONSTRAINT hActive_vCaldera_FK FOREIGN KEY ( volcanoIdentifier )
        REFERENCES volcanoCaldera ( volcanoIdentifier );
