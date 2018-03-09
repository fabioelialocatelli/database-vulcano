USE vulcano;

TRUNCATE TABLE historyCaldera;
DELETE FROM volcanoCaldera WHERE volcanoIdentifier = 'CMP';
DELETE FROM volcanoCaldera WHERE volcanoIdentifier = 'TBA';
DELETE FROM volcanoCaldera WHERE volcanoIdentifier = 'TPO';
DELETE FROM volcanoCaldera WHERE volcanoIdentifier = 'LGR';

INSERT INTO volcanoCaldera (volcanoIdentifier, localName) VALUES ('CMP', 'Campi Flegrei');
INSERT INTO volcanoCaldera (volcanoIdentifier, localName) VALUES ('TBA', 'Toba');
INSERT INTO volcanoCaldera (volcanoIdentifier, localName) VALUES ('TPO', 'Taupo');
INSERT INTO volcanoCaldera (volcanoIdentifier, localName) VALUES ('LGR', 'La Garita');

TRUNCATE TABLE historyActive;
DELETE FROM volcanoActive WHERE volcanoIdentifier = 'TNA';
DELETE FROM volcanoActive WHERE volcanoIdentifier = 'RPH';
DELETE FROM volcanoActive WHERE volcanoIdentifier = 'TRW';
DELETE FROM volcanoActive WHERE volcanoIdentifier = 'SFR';

INSERT INTO volcanoActive (volcanoIdentifier, localName) VALUES ('TNA', 'Etna');
INSERT INTO volcanoActive (volcanoIdentifier, localName) VALUES ('RPH', 'Ruapehu');
INSERT INTO volcanoActive (volcanoIdentifier, localName) VALUES ('TRW', 'Tarawera');
INSERT INTO volcanoActive (volcanoIdentifier, localName) VALUES ('SFR', 'Soufrière Hills');

TRUNCATE TABLE historyInactive;
DELETE FROM volcanoInactive WHERE volcanoIdentifier = 'MKS';
DELETE FROM volcanoInactive WHERE volcanoIdentifier = 'VLT';
DELETE FROM volcanoInactive WHERE volcanoIdentifier = 'MTA';
DELETE FROM volcanoInactive WHERE volcanoIdentifier = 'RCC';

INSERT INTO volcanoInactive (volcanoIdentifier, localName) VALUES ('MKS', 'Emi Koussi');
INSERT INTO volcanoInactive (volcanoIdentifier, localName) VALUES ('VLT', 'Vulture');
INSERT INTO volcanoInactive (volcanoIdentifier, localName) VALUES ('MTA', 'Amiata');
INSERT INTO volcanoInactive (volcanoIdentifier, localName) VALUES ('RCC', 'Roccamonfina');

UPDATE volcanoCaldera SET isDecade = '0' WHERE volcanoIdentifier = 'CMP';
UPDATE volcanoCaldera SET isDecade = '0' WHERE volcanoIdentifier = 'TBA';
UPDATE volcanoCaldera SET isDecade = '0' WHERE volcanoIdentifier = 'TPO';
UPDATE volcanoCaldera SET isDecade = '0' WHERE volcanoIdentifier = 'LGR';

UPDATE volcanoActive SET isDecade = '0' WHERE volcanoIdentifier = 'TNA';
UPDATE volcanoActive SET isDecade = '0' WHERE volcanoIdentifier = 'SFR';

UPDATE volcanoActive SET isDecade = NULL WHERE volcanoIdentifier = 'RPH';
UPDATE volcanoActive SET isDecade = NULL WHERE volcanoIdentifier = 'TRW';

UPDATE volcanoInactive SET smithsonianIdentifier = '12345' WHERE volcanoIdentifier = 'MKS';
UPDATE volcanoInactive SET smithsonianIdentifier = '12345' WHERE volcanoIdentifier = 'VLT';
UPDATE volcanoInactive SET smithsonianIdentifier = '12345' WHERE volcanoIdentifier = 'MTA';
UPDATE volcanoInactive SET smithsonianIdentifier = '12345' WHERE volcanoIdentifier = 'RCC';
