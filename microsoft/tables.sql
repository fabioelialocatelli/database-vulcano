DROP DATABASE IF EXISTS vulcano
GO

CREATE DATABASE vulcano
GO

USE vulcano
GO

CREATE TABLE material (
    materialIdentifier         VARCHAR(3) NOT NULL,
    scientificName             VARCHAR(15),
    alkalicontentpercentage    FLOAT,
    silicacontentpercentage    FLOAT,
    crystalcontentpercentage   FLOAT,
    isMafic                    CHAR(1),
    isSilicic                  CHAR(1)
)
ALTER TABLE material ADD CONSTRAINT material_PK PRIMARY KEY ( materialIdentifier )
GO

CREATE TABLE compositionActive (
    materialIdentifier   VARCHAR(3) NOT NULL,
    volcanoIdentifier    VARCHAR(3) NOT NULL,
    materialOccurrence   INTEGER
)
ALTER TABLE compositionActive ADD CONSTRAINT compositionActive_PK PRIMARY KEY ( materialIdentifier,
volcanoIdentifier )
GO

CREATE TABLE compositionCaldera (
    materialIdentifier   VARCHAR(3) NOT NULL,
    volcanoIdentifier    VARCHAR(3) NOT NULL,
    materialOccurrence   INTEGER
)
ALTER TABLE compositionCaldera ADD CONSTRAINT compositionCaldera_PK PRIMARY KEY ( materialIdentifier,
volcanoIdentifier )
GO

CREATE TABLE compositionInactive (
    materialIdentifier   VARCHAR(3) NOT NULL,
    volcanoIdentifier    VARCHAR(3) NOT NULL,
    materialOccurrence   INTEGER
)
ALTER TABLE compositionInactive ADD CONSTRAINT compositionInactive_PK PRIMARY KEY ( materialIdentifier,
volcanoIdentifier )
GO

CREATE TABLE eruptionCategory (
    categoryIdentifier   VARCHAR(4) NOT NULL,
    scientificName       VARCHAR(15),
    descriptor           VARCHAR(15),
    maximumVEI           INTEGER
)
ALTER TABLE eruptionCategory ADD CONSTRAINT eruptionCategory_PK PRIMARY KEY ( categoryIdentifier )
GO

CREATE TABLE eruptionHistoric (
    eruptionIdentifier   VARCHAR(3) NOT NULL,
    volcanoIdentifier    VARCHAR(3) NOT NULL,
    categoryIdentifier   VARCHAR(4) NOT NULL,
    startdate            DATE,
    finishdate           DATE,
    certainty            NVARCHAR(15),
    evidence             NVARCHAR(15),
    activityarea         NVARCHAR(15)
)
ALTER TABLE eruptionHistoric
    ADD CONSTRAINT eruptionHistoric_PK PRIMARY KEY ( eruptionIdentifier,
    volcanoIdentifier,
    categoryIdentifier )
GO

CREATE TABLE eruptionPrehistoric (
    eruptionIdentifier   VARCHAR(3) NOT NULL,
    volcanoIdentifier    VARCHAR(3) NOT NULL,
    yearsbeforepresent   INTEGER,
    evidence             NVARCHAR(15)
)
ALTER TABLE eruptionPrehistoric ADD CONSTRAINT eruptionPrehistoric_PK PRIMARY KEY ( eruptionIdentifier,
volcanoIdentifier )
GO

CREATE TABLE volcanoActive (
    volcanoIdentifier       VARCHAR(3) NOT NULL,
    smithsonianIdentifier   INTEGER,
    localName               NVARCHAR(45) NOT NULL,
    latitude                FLOAT(5),
    longitude               FLOAT(5),
    maximumVEI              INTEGER,
    summitElevationMetres   INTEGER,
    areaSquareKilometres    FLOAT(5),
    isDecade                CHAR(1)
)
ALTER TABLE volcanoActive ADD CONSTRAINT volcanoActive_PK PRIMARY KEY ( volcanoIdentifier )
GO

CREATE TABLE volcanoCaldera (
    volcanoIdentifier           VARCHAR(3) NOT NULL,
    smithsonianIdentifier       INTEGER,
    localName                   NVARCHAR(45) NOT NULL,
    latitude                    FLOAT(5),
    longitude                   FLOAT(5),
    maximumVEI                  INTEGER,
    maximumElevationMetres      INTEGER,
    maximumDiameterKilometres   INTEGER,
    depositsCubicKilometers     FLOAT(5),
    isDecade                    CHAR(1)
)
ALTER TABLE volcanoCaldera ADD CONSTRAINT volcanoCaldera_PK PRIMARY KEY ( volcanoIdentifier )
GO

CREATE TABLE volcanoInactive (
    volcanoIdentifier       VARCHAR(3) NOT NULL,
    smithsonianIdentifier   INTEGER,
    localName               NVARCHAR(45) NOT NULL,
    latitude                FLOAT(5),
    longitude               FLOAT(5),
    summitElevationMetres   INTEGER,
    areaSquareKilometres    FLOAT(5)
)
ALTER TABLE volcanoInactive ADD CONSTRAINT volcanoInactive_PK PRIMARY KEY ( volcanoIdentifier )
GO

CREATE TABLE historyActive (
    operationIdentifier   VARCHAR(95) NOT NULL,
    operationTime         VARCHAR(30),
    operationType         VARCHAR(15),
    localName             NVARCHAR(45),
    volcanoIdentifier     VARCHAR(3) NOT NULL
)
ALTER TABLE historyActive ADD CONSTRAINT historyActive_PK PRIMARY KEY ( operationIdentifier )
GO

CREATE TABLE historyCaldera (
    operationIdentifier   VARCHAR(95) NOT NULL,
    operationTime         VARCHAR(30),
    operationType         VARCHAR(15),
    localName             NVARCHAR(45),
    volcanoIdentifier     VARCHAR(3) NOT NULL
)
ALTER TABLE historyCaldera ADD CONSTRAINT historyCaldera_PK PRIMARY KEY ( operationIdentifier )
GO

CREATE TABLE historyInactive (
    operationIdentifier   VARCHAR(95) NOT NULL,
    operationTime         VARCHAR(30),
    operationType         VARCHAR(15),
    localName             NVARCHAR(45),
    volcanoIdentifier     VARCHAR(3) NOT NULL
)
ALTER TABLE historyInactive ADD CONSTRAINT historyInactive_PK PRIMARY KEY ( operationIdentifier )
GO

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
GO
        