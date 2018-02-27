USE vulcano
GO

TRUNCATE TABLE historyCaldera
GO

DELETE FROM volcanoCaldera WHERE volcanoIdentifier = 'CMP'
GO

INSERT INTO volcanocaldera(volcanoIdentifier, localName) VALUES('CMP', 'Campi Flegrei')
GO
