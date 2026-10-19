-- engine: mysql
-- target: instances
-- kind: additive
-- description: new table inst_basic.ai_cm_syllabus
-- written by the release engine from c0001's schema, 2026-10-15 08:40 UTC (approved: not needed)

CREATE TABLE IF NOT EXISTS `ai_cm_syllabus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `version` int NOT NULL,
  `syllabus` json NOT NULL,
  `source` varchar(12) NOT NULL DEFAULT 'ai',
  `note` varchar(500) DEFAULT NULL,
  `created_by` varchar(190) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `approved_by` varchar(190) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_cm_syl` (`project_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
