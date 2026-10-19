-- engine: mysql
-- target: ai_data
-- kind: additive
-- description: new table ai_data.aa_test
-- written by the release engine from c0001's schema, 2026-10-13 19:49 UTC (approved: not needed)

CREATE TABLE IF NOT EXISTS `aa_test` (
  `idnew_table` int NOT NULL,
  `test` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idnew_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
