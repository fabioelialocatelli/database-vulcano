USE vulcano
GO

TRUNCATE TABLE historyCaldera
GO

DELETE FROM volcanoCaldera WHERE volcanoIdentifier = 'CMP'
GO

INSERT INTO volcanocaldera(volcanoIdentifier, localName) VALUES('CMP', 'Campi Flegrei')
GO

UPDATE volcanoCaldera SET localName = 'CampiFlegrei' WHERE volcanoIdentifier = 'CMP'
GO

UPDATE volcanoCaldera SET localName = 'Campi Flegrei' WHERE volcanoIdentifier = 'CMP'
GO

TRUNCATE TABLE historyActive
GO

DELETE FROM volcanoActive WHERE volcanoIdentifier = 'SFR'
GO

INSERT INTO volcanoActive(volcanoIdentifier, localName) VALUES('SFR', 'Soufrière Hills')
GO

UPDATE volcanoActive SET localName = 'SoufrièreHills' WHERE volcanoIdentifier = 'SFR'
GO

UPDATE volcanoActive SET localName = 'Soufrière Hills' WHERE volcanoIdentifier = 'SFR'
GO

TRUNCATE TABLE historyInactive
GO

DELETE FROM volcanoInactive WHERE volcanoIdentifier = 'MKS'
GO

INSERT INTO volcanoInactive(volcanoIdentifier, localName) VALUES('MKS', 'Emi Koussi')
GO

UPDATE volcanoInactive SET localName = 'EmiKoussi' WHERE volcanoIdentifier = 'MKS'
GO

UPDATE volcanoInactive SET localName = 'Emi Koussi' WHERE volcanoIdentifier = 'MKS'
GO
