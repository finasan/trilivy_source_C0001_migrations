-- engine: mysql
-- target: instances
-- kind: additive
-- description: new table inst_basic.ai_cm_runs
-- written by the release engine from c0001's schema, 2026-10-15 08:40 UTC (approved: not needed)

CREATE TABLE IF NOT EXISTS `ai_cm_runs` (
  `run_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `step` varchar(30) NOT NULL,
  `model` varchar(80) DEFAULT NULL,
  `tokens_in` int NOT NULL DEFAULT '0',
  `tokens_out` int NOT NULL DEFAULT '0',
  `cost_usd` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `ms` int NOT NULL DEFAULT '0',
  `ok` tinyint NOT NULL DEFAULT '1',
  `error` text,
  `user_name` varchar(190) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`run_id`),
  KEY `ix_cm_runs_month` (`created_at`),
  KEY `ix_cm_runs_project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
