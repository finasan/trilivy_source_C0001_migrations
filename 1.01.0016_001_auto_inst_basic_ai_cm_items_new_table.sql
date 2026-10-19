-- engine: mysql
-- target: instances
-- kind: additive
-- description: new table inst_basic.ai_cm_items
-- written by the release engine from c0001's schema, 2026-10-15 08:40 UTC (approved: not needed)

CREATE TABLE IF NOT EXISTS `ai_cm_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `kind` varchar(12) NOT NULL,
  `module_no` int NOT NULL DEFAULT '0',
  `item_no` int NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `file_name` varchar(190) DEFAULT NULL,
  `folder` varchar(190) DEFAULT NULL,
  `spec_hash` varchar(40) DEFAULT NULL,
  `status` varchar(12) NOT NULL DEFAULT 'PLANNED',
  `attempts` int NOT NULL DEFAULT '0',
  `instruction` text,
  `words` int DEFAULT NULL,
  `cost_usd` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `model` varchar(80) DEFAULT NULL,
  `model_req` varchar(80) DEFAULT NULL,
  `error` text,
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `uk_cm_item` (`project_id`,`kind`,`module_no`,`item_no`),
  KEY `ix_cm_items_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
