-- engine: mysql
-- target: instances
-- kind: additive
-- description: Agent Factory V2 test questions (ai_af_tests)
CREATE TABLE IF NOT EXISTS `ai_af_tests` (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `agent_id` varchar(40) NOT NULL,
  `question` text NOT NULL,
  `expect_note` text,
  `source` varchar(12) NOT NULL DEFAULT 'auto',
  `enabled` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`test_id`),
  KEY `ix_af_tests_agent` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
