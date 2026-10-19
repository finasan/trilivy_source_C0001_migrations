-- engine: mysql
-- target: ai_data
-- kind: additive
-- description: AppConnect "Connect an app" one-time key hand-off links (ai_appc_handoff)
CREATE TABLE IF NOT EXISTS `ai_appc_handoff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token_hash` char(64) NOT NULL,
  `connection_id` int NOT NULL,
  `key_enc` text COMMENT 'Fernet ciphertext; NULL once revealed',
  `note` varchar(500) NOT NULL DEFAULT '',
  `created_by` varchar(190) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` datetime NOT NULL,
  `opened_at` datetime DEFAULT NULL,
  `opened_ip` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_hash` (`token_hash`),
  KEY `ix_appc_handoff_conn` (`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
