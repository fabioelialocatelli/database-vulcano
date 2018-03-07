USE vulcano;

DELIMITER $$

DROP TRIGGER IF EXISTS calderaAdded$$
CREATE TRIGGER vulcano.calderaAdded 
	AFTER INSERT ON volcanoCaldera 
		FOR EACH ROW 
			BEGIN				
                
                DECLARE timestampSystem			TIMESTAMP;
				DECLARE timestampFormatting		VARCHAR(15);                
				DECLARE timestampFormatted		VARCHAR(23);
                DECLARE unixMilliseconds		VARCHAR(25);
				DECLARE newCaldera				VARCHAR(45); 
				DECLARE newCalderaFormatted		VARCHAR(45); 
				DECLARE volcanoIdentifier		VARCHAR(45); 
				DECLARE operationIdentifier		VARCHAR(95);
				DECLARE operationTime			VARCHAR(45);
				
                SET timestampSystem := CURRENT_TIMESTAMP();
                SET timestampFormatting := '%y%m%d%u';
                SET timestampFormatted := DATE_FORMAT(timestampSystem, timestampFormatting);
                SET unixMilliseconds := CAST((ROUND(UNIX_TIMESTAMP(CURRENT_TIME(5)) * 1000)) AS CHAR);
                SET newCaldera := NEW.localName;
                SET newCalderaFormatted := LOWER(REPLACE(newCaldera, ' ', ''));
                SET volcanoIdentifier := NEW.volcanoIdentifier;
                SET operationTime := CONCAT(timestampFormatted
					, ' @ '
                    , unixMilliseconds);
                SET operationIdentifier := CONCAT(newCalderaFormatted
					, ' added the '
					, operationTime);				
                
					INSERT INTO historyCaldera (
						operationIdentifier,
						operationTime,
						operationType,
						localName,
						volcanoIdentifier
					) VALUES (
						operationIdentifier,
						operationTime,
						'INSERTION',
						newCaldera,
						volcanoIdentifier
					);
				
			END$$

DROP TRIGGER IF EXISTS calderaEdited$$
CREATE TRIGGER vulcano.calderaEdited 
	AFTER UPDATE ON volcanoCaldera 
		FOR EACH ROW 
			BEGIN				
                
                DECLARE timestampSystem				TIMESTAMP;
				DECLARE timestampFormatting			VARCHAR(15);                
				DECLARE timestampFormatted			VARCHAR(23);
                DECLARE unixMilliseconds			VARCHAR(25);
				DECLARE existingCaldera				VARCHAR(45); 
				DECLARE existingCalderaFormatted	VARCHAR(45); 
				DECLARE volcanoIdentifier			VARCHAR(45); 
				DECLARE operationIdentifier			VARCHAR(95); 
                DECLARE operationTime				VARCHAR(45);
				
                SET timestampSystem := CURRENT_TIMESTAMP();
                SET timestampFormatting := '%y%m%d%u';
                SET timestampFormatted := DATE_FORMAT(timestampSystem, timestampFormatting);
                SET unixMilliseconds := CAST((ROUND(UNIX_TIMESTAMP(CURRENT_TIME(5)) * 1000)) AS CHAR);
                SET existingCaldera	:= OLD.localName;
                SET existingCalderaFormatted := LOWER(REPLACE(existingCaldera, ' ', ''));
                SET volcanoIdentifier := OLD.volcanoIdentifier;
                SET operationTime := CONCAT(timestampFormatted
					, ' @ '
                    , unixMilliseconds);
                SET operationIdentifier := CONCAT(existingCalderaFormatted
					, ' edited the '
					, operationTime);
				                
					INSERT INTO historyCaldera (
						operationIdentifier,
						operationTime,
						operationType,
						localName,
						volcanoIdentifier
					) VALUES (
						operationIdentifier,
						operationTime,
						'EDITION',
						existingCaldera,
						volcanoIdentifier
					);
				
			END$$

DROP TRIGGER IF EXISTS activeAdded$$
CREATE TRIGGER vulcano.activeAdded 
	AFTER INSERT ON volcanoActive 
		FOR EACH ROW 
			BEGIN				
                
                DECLARE timestampSystem			TIMESTAMP;
				DECLARE timestampFormatting		VARCHAR(15);                
				DECLARE timestampFormatted		VARCHAR(23);
                DECLARE unixMilliseconds		VARCHAR(25);
				DECLARE newActive				VARCHAR(45); 
				DECLARE newActiveFormatted		VARCHAR(45); 
				DECLARE volcanoIdentifier		VARCHAR(45); 
				DECLARE operationIdentifier		VARCHAR(95);
                DECLARE operationTime			VARCHAR(45);
				
                SET timestampSystem := CURRENT_TIMESTAMP();
                SET timestampFormatting := '%y%m%d%u';
                SET timestampFormatted := DATE_FORMAT(timestampSystem, timestampFormatting);
                SET unixMilliseconds := CAST((ROUND(UNIX_TIMESTAMP(CURRENT_TIME(5)) * 1000)) AS CHAR);
                SET newActive := NEW.localName;
                SET newActiveFormatted := LOWER(REPLACE(newActive, ' ', ''));
                SET volcanoIdentifier := NEW.volcanoIdentifier;
                SET operationIdentifier := CONCAT(newActiveFormatted
					, ' added the '
					, timestampFormatted
                    , ' @ '
                    , unixMilliseconds);
				SET operationTime := CONCAT(timestampFormatted
					, ' @ '
                    , unixMilliseconds);
                
					INSERT INTO historyActive (
						operationIdentifier,
						operationTime,
						operationType,
						localName,
						volcanoIdentifier
					) VALUES (
						operationIdentifier,
						operationTime,
						'INSERTION',
						newActive,
						volcanoIdentifier
					);
				
			END$$

DROP TRIGGER IF EXISTS activeEdited$$
CREATE TRIGGER vulcano.activeEdited 
	AFTER UPDATE ON volcanoActive 
		FOR EACH ROW 
			BEGIN				
                
                DECLARE timestampSystem				TIMESTAMP;
				DECLARE timestampFormatting			VARCHAR(15);                
				DECLARE timestampFormatted			VARCHAR(23);
                DECLARE unixMilliseconds			VARCHAR(25);
				DECLARE existingActive				VARCHAR(45); 
				DECLARE existingActiveFormatted		VARCHAR(45); 
				DECLARE volcanoIdentifier			VARCHAR(45); 
				DECLARE operationIdentifier			VARCHAR(95);
                DECLARE operationTime				VARCHAR(45);
				
                SET timestampSystem := CURRENT_TIMESTAMP();
                SET timestampFormatting := '%y%m%d%u';
                SET timestampFormatted := DATE_FORMAT(timestampSystem, timestampFormatting);
                SET unixMilliseconds := CAST((ROUND(UNIX_TIMESTAMP(CURRENT_TIME(5)) * 1000)) AS CHAR);
                SET existingActive := OLD.localName;
                SET existingActiveFormatted := LOWER(REPLACE(existingActive, ' ', ''));
                SET volcanoIdentifier := OLD.volcanoIdentifier;
                SET operationIdentifier := CONCAT(existingActiveFormatted
					, ' edited the '
					, timestampFormatted
                    , ' @ '
                    , unixMilliseconds);
				SET operationTime := CONCAT(timestampFormatted
					, ' @ '
                    , unixMilliseconds);
                
					INSERT INTO historyActive (
						operationIdentifier,
						operationTime,
						operationType,
						localName,
						volcanoIdentifier
					) VALUES (
						operationIdentifier,
						operationTime,
						'EDITION',
						existingActive,
						volcanoIdentifier
					);
				
			END$$

DROP TRIGGER IF EXISTS inactiveAdded$$
CREATE TRIGGER vulcano.inactiveAdded 
	AFTER INSERT ON volcanoInactive 
		FOR EACH ROW 
			BEGIN				
                
                DECLARE timestampSystem			TIMESTAMP;
				DECLARE timestampFormatting		VARCHAR(15);                
				DECLARE timestampFormatted		VARCHAR(23);
                DECLARE unixMilliseconds		VARCHAR(25);
				DECLARE newInactive				VARCHAR(45); 
				DECLARE newInactiveFormatted	VARCHAR(45); 
				DECLARE volcanoIdentifier		VARCHAR(45); 
				DECLARE operationIdentifier		VARCHAR(95);
                DECLARE operationTime			VARCHAR(45);
				
                SET timestampSystem := CURRENT_TIMESTAMP();
                SET timestampFormatting := '%y%m%d%u';
                SET timestampFormatted := DATE_FORMAT(timestampSystem, timestampFormatting);
                SET unixMilliseconds := CAST((ROUND(UNIX_TIMESTAMP(CURRENT_TIME(5)) * 1000)) AS CHAR);
                SET newInactive := NEW.localName;
                SET newInactiveFormatted := LOWER(REPLACE(newInactive, ' ', ''));
                SET volcanoIdentifier := NEW.volcanoIdentifier;
                SET operationIdentifier := CONCAT(newInactiveFormatted
					, ' added the '
					, timestampFormatted
                    , ' @ '
                    , unixMilliseconds);
				SET operationTime := CONCAT(timestampFormatted
					, ' @ '
                    , unixMilliseconds);
                
					INSERT INTO historyInactive (
						operationIdentifier,
						operationTime,
						operationType,
						localName,
						volcanoIdentifier
					) VALUES (
						operationIdentifier,
						operationTime,
						'INSERTION',
						newInactive,
						volcanoIdentifier
					);
				
			END$$

DROP TRIGGER IF EXISTS inactiveEdited$$
CREATE TRIGGER vulcano.inactiveEdited 
	AFTER UPDATE ON volcanoInactive 
		FOR EACH ROW 
			BEGIN				
                
                DECLARE timestampSystem				TIMESTAMP;
				DECLARE timestampFormatting			VARCHAR(15);                
				DECLARE timestampFormatted			VARCHAR(23);
                DECLARE unixMilliseconds			VARCHAR(25);
				DECLARE existingInactive			VARCHAR(45); 
				DECLARE existingInactiveFormatted	VARCHAR(45); 
				DECLARE volcanoIdentifier			VARCHAR(45); 
				DECLARE operationIdentifier			VARCHAR(95);
                DECLARE operationTime				VARCHAR(45);
				
                SET timestampSystem := CURRENT_TIMESTAMP();
                SET timestampFormatting := '%y%m%d%u';
                SET timestampFormatted := DATE_FORMAT(timestampSystem, timestampFormatting);
                SET unixMilliseconds := CAST((ROUND(UNIX_TIMESTAMP(CURRENT_TIME(5)) * 1000)) AS CHAR);
                SET existingInactive := OLD.localName;
                SET existingInactiveFormatted := LOWER(REPLACE(existingInactive, ' ', ''));
                SET volcanoIdentifier := OLD.volcanoIdentifier;
                SET operationIdentifier := CONCAT(existingInactiveFormatted
					, ' edited the '
					, timestampFormatted
                    , ' @ '
                    , unixMilliseconds);
				SET operationTime := CONCAT(timestampFormatted
					, ' @ '
                    , unixMilliseconds);
                
					INSERT INTO historyInactive (
						operationIdentifier,
						operationTime,
						operationType,
						localName,
						volcanoIdentifier
					) VALUES (
						operationIdentifier,
						operationTime,
						'EDITION',
						existingInactive,
						volcanoIdentifier
					);
				
			END$$
DELIMITER ;
