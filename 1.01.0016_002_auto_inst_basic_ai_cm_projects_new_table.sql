-- engine: mysql
-- target: instances
-- kind: additive
-- description: new table inst_basic.ai_cm_projects
-- written by the release engine from c0001's schema, 2026-10-15 08:40 UTC (approved: not needed)

CREATE TABLE IF NOT EXISTS `ai_cm_projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `course_id` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `brief` json DEFAULT NULL,
  `template` varchar(20) NOT NULL DEFAULT 'executive',
  `status` varchar(16) NOT NULL DEFAULT 'draft',
  `syllabus_version` int NOT NULL DEFAULT '0',
  `approved_version` int DEFAULT NULL,
  `folder_name` varchar(190) DEFAULT NULL,
  `last_error` text,
  `created_by` varchar(190) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `published_by` varchar(190) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `model` varchar(80) DEFAULT NULL,
  `module_models` json DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `uk_cm_course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
