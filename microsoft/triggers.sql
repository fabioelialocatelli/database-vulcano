USE vulcano
GO

DROP TRIGGER IF EXISTS calderaAdded
GO

CREATE TRIGGER calderaAdded 
	ON volcanoCaldera
		AFTER INSERT AS
			BEGIN
				DECLARE @timestampSystem       AS DATETIME = GETDATE()
				DECLARE @timestampFormatting   AS INT = 100
				DECLARE @timestampFormatted    AS VARCHAR(30) = CONVERT(VARCHAR(20), @timestampSystem, @timestampFormatting)
				DECLARE @newCaldera            AS VARCHAR(45) = (SELECT localName FROM inserted)
				DECLARE @newCalderaFormatted   AS VARCHAR(45) = LOWER(REPLACE(@newCaldera, ' ', ''))
				DECLARE @volcanoIdentifier     AS VARCHAR(45) = (SELECT volcanoIdentifier FROM inserted)
				DECLARE @operationIdentifier   AS VARCHAR(95) = @timestampFormatted
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
