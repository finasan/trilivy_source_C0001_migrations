-- engine: mysql
-- target: instances
-- kind: additive
-- description: Agent Factory V2 answer log (ai_af_runs)
CREATE TABLE IF NOT EXISTS `ai_af_runs` (
  `run_id` int NOT NULL AUTO_INCREMENT,
  `agent_id` varchar(40) NOT NULL,
  `version` int NOT NULL,
  `mode` varchar(10) NOT NULL,
  `question` text NOT NULL,
  `answer` mediumtext,
  `detail` json DEFAULT NULL,
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
  KEY `ix_af_runs_agent` (`agent_id`,`created_at`),
  KEY `ix_af_runs_month` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
