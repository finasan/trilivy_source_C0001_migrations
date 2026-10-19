-- engine: mysql
-- target: ai_data
-- kind: additive
-- description: Agent Factory af_agents.slug widened 64 -> 255 (as on c0001 since 2026-10-13)
ALTER TABLE af_agents MODIFY `slug` varchar(255) NOT NULL;
