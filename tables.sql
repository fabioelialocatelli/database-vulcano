DROP TABLE compositionactive CASCADE CONSTRAINTS PURGE;

CREATE TABLE compositionactive (
    materialidentifier   VARCHAR2(3 CHAR) NOT NULL,
    volcanoidentifier    VARCHAR2(3 CHAR) NOT NULL
);

ALTER TABLE compositionactive ADD CONSTRAINT compositionactive_pk PRIMARY KEY ( materialidentifier,
volcanoidentifier );

DROP TABLE compositioncaldera CASCADE CONSTRAINTS PURGE;

CREATE TABLE compositioncaldera (
    materialidentifier   VARCHAR2(3 CHAR) NOT NULL,
    volcanoidentifier    VARCHAR2(3 CHAR) NOT NULL
);

ALTER TABLE compositioncaldera ADD CONSTRAINT compositioncaldera_pk PRIMARY KEY ( materialidentifier,
volcanoidentifier );

DROP TABLE compositioninactive CASCADE CONSTRAINTS PURGE;

CREATE TABLE compositioninactive (
    materialidentifier   VARCHAR2(3 CHAR) NOT NULL,
    volcanoidentifier    VARCHAR2(3 CHAR) NOT NULL,
    occurrence           INTEGER
);

ALTER TABLE compositioninactive ADD CONSTRAINT compositioninactive_pk PRIMARY KEY ( materialidentifier,
volcanoidentifier );

DROP TABLE eruptionCategory CASCADE CONSTRAINTS PURGE;

CREATE TABLE eruptioncategory (
    categoryidentifier   VARCHAR2(4 CHAR) NOT NULL,
    commonname           VARCHAR2(15 CHAR),
    descriptor           VARCHAR2(15 CHAR),
    maximumvei           INTEGER
);

ALTER TABLE eruptioncategory ADD CONSTRAINT eruptioncategory_pk PRIMARY KEY ( categoryidentifier );

DROP TABLE eruptionhistoric CASCADE CONSTRAINTS PURGE;

CREATE TABLE eruptionhistoric (
    eruptionidentifier   VARCHAR2(3 CHAR) NOT NULL,
    volcanoidentifier    VARCHAR2(3 CHAR) NOT NULL,
    categoryidentifier   VARCHAR2(4 CHAR) NOT NULL,
    startdate            DATE,
    finishdate           DATE,
    certainty            NVARCHAR2(15),
    evidence             NVARCHAR2(15),
    activityarea         NVARCHAR2(15)
);

ALTER TABLE eruptionhistoric
    ADD CONSTRAINT eruptionhistoric_pk PRIMARY KEY ( eruptionidentifier,
    volcanoidentifier,
    categoryidentifier );
    
DROP TABLE eruptionprehistoric CASCADE CONSTRAINTS PURGE;    

CREATE TABLE eruptionprehistoric (
    eruptionidentifier   VARCHAR2(3 CHAR) NOT NULL,
    volcanoidentifier    VARCHAR2(3 CHAR) NOT NULL,
    yearsbeforepresent   INTEGER,
    evidence             NVARCHAR2(15)
);

ALTER TABLE eruptionprehistoric ADD CONSTRAINT eruptionprehistoric_pk PRIMARY KEY ( eruptionidentifier,
volcanoidentifier );

DROP TABLE material CASCADE CONSTRAINTS PURGE;  

CREATE TABLE material (
    materialidentifier         VARCHAR2(3 CHAR) NOT NULL,
    commonname                 VARCHAR2(15 CHAR),
    alkalicontentpercentage    NUMBER(3,1),
    silicacontentpercentage    NUMBER(3,1),
    crystalcontentpercentage   NUMBER(3,1),
    ismafic                    CHAR(1)
);

ALTER TABLE material ADD CONSTRAINT material_pk PRIMARY KEY ( materialidentifier );

DROP TABLE volcanoactive CASCADE CONSTRAINTS PURGE;  

CREATE TABLE volcanoactive (
    volcanoidentifier       VARCHAR2(3 CHAR) NOT NULL,
    smithsonianidentifier   INTEGER,
    localname               NVARCHAR2(45),
    latitude                FLOAT(5),
    longitude               FLOAT(5),
    maximumvei              INTEGER,
    summitelevationmetres   INTEGER,
    areasquarekilometres    FLOAT(5),
    isdecade                CHAR(1)
);

ALTER TABLE volcanoactive ADD CONSTRAINT volcanoactive_pk PRIMARY KEY ( volcanoidentifier );

DROP TABLE volcanocaldera CASCADE CONSTRAINTS PURGE;  

CREATE TABLE volcanocaldera (
    volcanoidentifier           VARCHAR2(3 CHAR) NOT NULL,
    smithsonianreference        INTEGER,
    localname                   NVARCHAR2(45),
    latitude                    FLOAT(5),
    longitude                   FLOAT(5),
    maximumvei                  INTEGER,
    maximumelevationmetres      INTEGER,
    maximumdistancekilometres   INTEGER,
    depositscubickilometers     FLOAT(5),
    isdecade                    CHAR(1)
);

ALTER TABLE volcanocaldera ADD CONSTRAINT volcanocaldera_pk PRIMARY KEY ( volcanoidentifier );

DROP TABLE volcanoinactive CASCADE CONSTRAINTS PURGE; 

CREATE TABLE volcanoinactive (
    volcanoidentifier       VARCHAR2(3 CHAR) NOT NULL,
    smithsonianreference    INTEGER,
    localname               NVARCHAR2(45),
    latitude                FLOAT(5),
    longitude               FLOAT(5),
    summitelevationmetres   INTEGER,
    areasquarekilometres    FLOAT(5)
);

ALTER TABLE volcanoinactive ADD CONSTRAINT volcanoinactive_pk PRIMARY KEY ( volcanoidentifier );

ALTER TABLE compositionactive
    ADD CONSTRAINT cactive_material_fk FOREIGN KEY ( materialidentifier )
        REFERENCES material ( materialidentifier );

ALTER TABLE compositionactive
    ADD CONSTRAINT cactive_vactive_fk FOREIGN KEY ( volcanoidentifier )
        REFERENCES volcanoactive ( volcanoidentifier );

ALTER TABLE compositioncaldera
    ADD CONSTRAINT ccaldera_material_fk FOREIGN KEY ( materialidentifier )
        REFERENCES material ( materialidentifier );

ALTER TABLE compositioncaldera
    ADD CONSTRAINT ccaldera_vcaldera_fk FOREIGN KEY ( volcanoidentifier )
        REFERENCES volcanocaldera ( volcanoidentifier );

ALTER TABLE compositioninactive
    ADD CONSTRAINT cinactive_material_fk FOREIGN KEY ( materialidentifier )
        REFERENCES material ( materialidentifier );

ALTER TABLE compositioninactive
    ADD CONSTRAINT cinactive_vinactive_fk FOREIGN KEY ( volcanoidentifier )
        REFERENCES volcanoinactive ( volcanoidentifier );

ALTER TABLE eruptionhistoric
    ADD CONSTRAINT ehistoric_ecategory_fk FOREIGN KEY ( categoryidentifier )
        REFERENCES eruptioncategory ( categoryidentifier )
            ON DELETE CASCADE;

ALTER TABLE eruptionhistoric
    ADD CONSTRAINT ehistoric_vactive_fk FOREIGN KEY ( volcanoidentifier )
        REFERENCES volcanoactive ( volcanoidentifier )
            ON DELETE CASCADE;

ALTER TABLE eruptionhistoric
    ADD CONSTRAINT ehistoric_vcaldera_fk FOREIGN KEY ( volcanoidentifier )
        REFERENCES volcanocaldera ( volcanoidentifier )
            ON DELETE CASCADE;

ALTER TABLE eruptionprehistoric
    ADD CONSTRAINT eprehistoric_vactive_fk FOREIGN KEY ( volcanoidentifier )
        REFERENCES volcanoactive ( volcanoidentifier )
            ON DELETE CASCADE;

ALTER TABLE eruptionprehistoric
    ADD CONSTRAINT eprehistoric_vcaldera_fk FOREIGN KEY ( volcanoidentifier )
        REFERENCES volcanocaldera ( volcanoidentifier )
            ON DELETE CASCADE;

ALTER TABLE eruptionprehistoric
    ADD CONSTRAINT eprehistoric_vinactive_fk FOREIGN KEY ( volcanoidentifier )
        REFERENCES volcanoinactive ( volcanoidentifier )
            ON DELETE CASCADE;
