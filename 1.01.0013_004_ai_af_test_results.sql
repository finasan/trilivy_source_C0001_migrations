-- engine: mysql
-- target: instances
-- kind: additive
-- description: Agent Factory V2 test results (ai_af_test_results)
CREATE TABLE IF NOT EXISTS `ai_af_test_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(32) NOT NULL,
  `agent_id` varchar(40) NOT NULL,
  `version` int NOT NULL,
  `test_id` int NOT NULL,
  `run_id` int DEFAULT NULL,
  `status` varchar(12) NOT NULL DEFAULT 'pending',
  `passed` tinyint DEFAULT NULL,
  `grounded` tinyint DEFAULT NULL,
  `relevant` tinyint DEFAULT NULL,
  `answer_class` varchar(20) DEFAULT NULL,
  `summary` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ix_af_tr_agent` (`agent_id`,`version`),
  KEY `ix_af_tr_batch` (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
