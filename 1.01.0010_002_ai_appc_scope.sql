-- engine: mysql
-- target: ai_data
-- kind: additive
-- description: AppConnect per-connection knowledge scope (ai_appc_scope)
CREATE TABLE IF NOT EXISTS `ai_appc_scope` (
  `connection_id` int NOT NULL,
  `kb_tables` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Comma list; empty = all of the assistant''s bases',
  `kb_groups` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Comma list; empty = all groups the assistant reaches',
  `updated_by` varchar(190) NOT NULL DEFAULT '',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
