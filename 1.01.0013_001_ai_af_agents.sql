-- engine: mysql
-- target: instances
-- kind: additive
-- description: Agent Factory V2 agents (ai_af_agents, AgentFactory_V2/af2_db.py)
CREATE TABLE IF NOT EXISTS `ai_af_agents` (
  `agent_id` varchar(40) NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text,
  `template_id` varchar(40) DEFAULT NULL,
  `status` varchar(12) NOT NULL DEFAULT 'draft',
  `draft_spec` json NOT NULL,
  `draft_version` int NOT NULL DEFAULT '1',
  `live_spec` json DEFAULT NULL,
  `live_version` int DEFAULT NULL,
  `tool_name` varchar(100) DEFAULT NULL,
  `created_by` varchar(190) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(190) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `published_by` varchar(190) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
