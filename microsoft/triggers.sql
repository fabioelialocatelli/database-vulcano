USE vulcano
GO

DROP TRIGGER IF EXISTS calderaAdded
GO

CREATE TRIGGER calderaAdded 
	ON volcanoCaldera
		AFTER INSERT AS
			BEGIN
				DECLARE @timestampSystem		AS DATETIME = GETDATE()
				DECLARE @timestampFormatting	AS INT = 21
				DECLARE @timestampFormatted		AS VARCHAR(23) = CONVERT(VARCHAR(23), @timestampSystem, @timestampFormatting)
				DECLARE @newCaldera				AS VARCHAR(45) = (SELECT localName FROM inserted)
				DECLARE @newCalderaFormatted	AS VARCHAR(45) = LOWER(REPLACE(@newCaldera, ' ', ''))
				DECLARE @volcanoIdentifier		AS VARCHAR(45) = (SELECT volcanoIdentifier FROM inserted)
				DECLARE @operationIdentifier	AS VARCHAR(95) = @timestampFormatted
					+ ' added '
					+ @newCalderaFormatted
				BEGIN
					INSERT INTO historyCaldera (
						operationIdentifier,
						operationTime,
						operationType,
						localName,
						volcanoIdentifier
					) VALUES (
						@operationIdentifier,
						@timestampFormatted,
						'INSERTION',
						@newCaldera,
						@volcanoIdentifier
					)

				END
			END
GO

DROP TRIGGER IF EXISTS calderaEdited
GO

CREATE TRIGGER calderaEdited 
	ON volcanoCaldera
		FOR UPDATE AS
			BEGIN
				DECLARE @timestampSystem			AS DATETIME = GETDATE()
				DECLARE @timestampFormatting		AS INT = 21
				DECLARE @timestampFormatted			AS VARCHAR(23) = CONVERT(VARCHAR(23), @timestampSystem, @timestampFormatting)
				DECLARE @existingCaldera			AS VARCHAR(45) = (SELECT localName FROM inserted)
				DECLARE @existingCalderaFormatted	AS VARCHAR(45) = LOWER(REPLACE(@existingCaldera, ' ', ''))
				DECLARE @volcanoIdentifier			AS VARCHAR(45) = (SELECT volcanoIdentifier FROM inserted)
				DECLARE @operationIdentifier		AS VARCHAR(95) = @timestampFormatted
					+ ' edited '
					+ @existingCalderaFormatted
				BEGIN
					INSERT INTO historyCaldera (
						operationIdentifier,
						operationTime,
						operationType,
						localName,
						volcanoIdentifier
					) VALUES (
						@operationIdentifier,
						@timestampFormatted,
						'EDITION',
						@existingCaldera,
						@volcanoIdentifier
					)

				END
			END
GO

DROP TRIGGER IF EXISTS activeAdded
GO

CREATE TRIGGER activeAdded 
	ON volcanoActive
		AFTER INSERT AS
			BEGIN
				DECLARE @timestampSystem		AS DATETIME = GETDATE()
				DECLARE @timestampFormatting	AS INT = 21
				DECLARE @timestampFormatted		AS VARCHAR(23) = CONVERT(VARCHAR(23), @timestampSystem, @timestampFormatting)
				DECLARE @newActive				AS VARCHAR(45) = (SELECT localName FROM inserted)
				DECLARE @newActiveFormatted		AS VARCHAR(45) = LOWER(REPLACE(@newActive, ' ', ''))
				DECLARE @volcanoIdentifier		AS VARCHAR(45) = (SELECT volcanoIdentifier FROM inserted)
				DECLARE @operationIdentifier	AS VARCHAR(95) = @timestampFormatted
					+ ' added '
					+ @newActiveFormatted
				BEGIN
					INSERT INTO historyActive(
						operationIdentifier,
						operationTime,
						operationType,
						localName,
						volcanoIdentifier
					) VALUES (
						@operationIdentifier,
						@timestampFormatted,
						'INSERTION',
						@newActive,
						@volcanoIdentifier
					)

				END
			END
GO

DROP TRIGGER IF EXISTS activeEdited
GO

CREATE TRIGGER activeEdited 
	ON volcanoActive
		FOR UPDATE AS
			BEGIN
				DECLARE @timestampSystem			AS DATETIME = GETDATE()
				DECLARE @timestampFormatting		AS INT = 21
				DECLARE @timestampFormatted			AS VARCHAR(23) = CONVERT(VARCHAR(23), @timestampSystem, @timestampFormatting)
				DECLARE @existingActive				AS VARCHAR(45) = (SELECT localName FROM inserted)
				DECLARE @existingActiveFormatted	AS VARCHAR(45) = LOWER(REPLACE(@existingActive, ' ', ''))
				DECLARE @volcanoIdentifier			AS VARCHAR(45) = (SELECT volcanoIdentifier FROM inserted)
				DECLARE @operationIdentifier		AS VARCHAR(95) = @timestampFormatted
					+ ' edited '
					+ @existingActiveFormatted
				BEGIN
					INSERT INTO historyActive (
						operationIdentifier,
						operationTime,
						operationType,
						localName,
						volcanoIdentifier
					) VALUES (
						@operationIdentifier,
						@timestampFormatted,
						'EDITION',
						@existingActive,
						@volcanoIdentifier
					)

				END
			END
GO

DROP TRIGGER IF EXISTS inactiveAdded
GO

CREATE TRIGGER inactiveAdded 
	ON volcanoInactive
		AFTER INSERT AS
			BEGIN
				DECLARE @timestampSystem		AS DATETIME = GETDATE()
				DECLARE @timestampFormatting	AS INT = 21
				DECLARE @timestampFormatted		AS VARCHAR(23) = CONVERT(VARCHAR(23), @timestampSystem, @timestampFormatting)
				DECLARE @newInactive			AS VARCHAR(45) = (SELECT localName FROM inserted)
				DECLARE @newInactiveFormatted	AS VARCHAR(45) = LOWER(REPLACE(@newInactive, ' ', ''))
				DECLARE @volcanoIdentifier		AS VARCHAR(45) = (SELECT volcanoIdentifier FROM inserted)
				DECLARE @operationIdentifier	AS VARCHAR(95) = @timestampFormatted
					+ ' added '
					+ @newInactiveFormatted
				BEGIN
					INSERT INTO historyInactive(
						operationIdentifier,
						operationTime,
						operationType,
						localName,
						volcanoIdentifier
					) VALUES (
						@operationIdentifier,
						@timestampFormatted,
						'INSERTION',
						@newInactive,
						@volcanoIdentifier
					)

				END
			END
GO

DROP TRIGGER IF EXISTS inactiveEdited
GO

CREATE TRIGGER inactiveEdited 
	ON volcanoInactive
		FOR UPDATE AS
			BEGIN
				DECLARE @timestampSystem			AS DATETIME = GETDATE()
				DECLARE @timestampFormatting		AS INT = 21
				DECLARE @timestampFormatted			AS VARCHAR(23) = CONVERT(VARCHAR(23), @timestampSystem, @timestampFormatting)
				DECLARE @existingInactive			AS VARCHAR(45) = (SELECT localName FROM inserted)
				DECLARE @existingInactiveFormatted	AS VARCHAR(45) = LOWER(REPLACE(@existingInactive, ' ', ''))
				DECLARE @volcanoIdentifier			AS VARCHAR(45) = (SELECT volcanoIdentifier FROM inserted)
				DECLARE @operationIdentifier		AS VARCHAR(95) = @timestampFormatted
					+ ' edited '
					+ @existingInactiveFormatted
				BEGIN
					INSERT INTO historyInactive (
						operationIdentifier,
						operationTime,
						operationType,
						localName,
						volcanoIdentifier
					) VALUES (
						@operationIdentifier,
						@timestampFormatted,
						'EDITION',
						@existingInactive,
						@volcanoIdentifier
					)

				END
			END
GO
