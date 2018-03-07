USE vulcano;

TRUNCATE TABLE historyCaldera;
DELETE FROM volcanoCaldera WHERE volcanoIdentifier = 'CMP';

INSERT INTO volcanocaldera(volcanoIdentifier, localName) VALUES('CMP', 'Campi Flegrei');
UPDATE volcanoCaldera SET localName = 'CampiFlegrei' WHERE volcanoIdentifier = 'CMP';
UPDATE volcanoCaldera SET localName = 'Campi Flegrei' WHERE volcanoIdentifier = 'CMP';

TRUNCATE TABLE historyActive;
DELETE FROM volcanoActive WHERE volcanoIdentifier = 'SFR';

INSERT INTO volcanoActive(volcanoIdentifier, localName) VALUES('SFR', 'Soufrière Hills');
UPDATE volcanoActive SET localName = 'SoufrièreHills' WHERE volcanoIdentifier = 'SFR';
UPDATE volcanoActive SET localName = 'Soufrière Hills' WHERE volcanoIdentifier = 'SFR';

TRUNCATE TABLE historyInactive;
DELETE FROM volcanoInactive WHERE volcanoIdentifier = 'MKS';

INSERT INTO volcanoInactive(volcanoIdentifier, localName) VALUES('MKS', 'Emi Koussi');
UPDATE volcanoInactive SET localName = 'EmiKoussi' WHERE volcanoIdentifier = 'MKS';
UPDATE volcanoInactive SET localName = 'Emi Koussi' WHERE volcanoIdentifier = 'MKS';
