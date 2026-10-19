-- engine: mysql
-- target: instances
-- kind: additive
-- description: Agent Factory V2 published versions (ai_af_agent_versions)
CREATE TABLE IF NOT EXISTS `ai_af_agent_versions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agent_id` varchar(40) NOT NULL,
  `version` int NOT NULL,
  `spec` json NOT NULL,
  `pass_rate` decimal(5,1) DEFAULT NULL,
  `published_by` varchar(190) DEFAULT NULL,
  `published_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_af_ver` (`agent_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
