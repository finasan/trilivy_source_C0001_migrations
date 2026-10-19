# /home/trlv_migrations — schema changes for installed boxes

A new box gets its database from the release dumps. A box that is **already
installed** only gets a schema change if there is a migration file for it here.

**Since 2026-10-13 the release engine writes them itself.** Change a table on
c0001 and Check shows the migration it generated (new table, new column, wider
type), tested on a rebuilt copy of the previous release; the build writes it
here as `<version>_<nnn>_auto_<slug>.sql`. A new table ships as an empty table
(structure only). A removal or a narrower type is never automatic: Check lists
it under "Changes that can lose data" and it waits for the operator to approve
it (TRLV_SCHEMA_APPROVED); a PTF refuses it even then. inst_template_schema.sql
is updated from inst_basic by the build. Hand-written files below still work
and run first; the engine only generates what they do not already cover.

## One file per change

    <M.NN.PPPP>_<nnn>_<slug>.sql        e.g. 1.01.0008_001_add_faq_lang.sql

- `<M.NN.PPPP>` is the release that will ship it: the **next** version you build.
- `<nnn>` orders the files within that release (001, 002, ...).
- `<slug>` is lowercase letters, digits and `_`.

Each file starts with this header:

    -- engine: mysql            mysql | pg
    -- target: ai_data          ai_data | ai_doc3 | instances   (mysql)
                                postgres                       (pg)
    -- kind: additive           additive | destructive
    -- description: Answer Bank gets a language column

    ALTER TABLE ai_answer_bank ADD COLUMN lang VARCHAR(10) NULL;

- Do not name the schema in the SQL. The runner picks it from `target`.
- `instances` runs against inst_basic **and every assistant schema** on the box.
- Make **one change per file**. An assistant created after the migration was
  written already has the change; the runner records that as "present". It can
  only do that cleanly when the file holds a single statement.
- **additive** means new tables, columns or indexes. It is the only kind
  allowed in a PTF (same M.NN as the release before).
  DROP, RENAME, TRUNCATE, DELETE FROM and CHANGE COLUMN are refused in it.
- **destructive** means anything that removes or renames. Release only. Do it in
  two steps: add the new thing in one release, remove the old one in the next.

## Before building

    ops.py release-check --version <next>       (full preflight)

The upgrade-path check loads the previous release's dumps into throwaway
`trlvchk_*` schemas and a `trlvchk` database. It runs the pending migrations
there and compares the result with c0001's live schema. The throwaway copies
are dropped before it returns, and nothing real is touched.

Never edit or rename a file after a release has shipped it. Boxes record each
file's checksum, and an edited one is reported.
