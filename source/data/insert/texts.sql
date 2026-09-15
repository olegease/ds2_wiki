-- POSTGRES: psql -d ds2 < insert/texts.sql
SET search_path TO game, public;
---- keys
INSERT INTO keys (key)
VALUES
( 'MTEST___' ),
( 'MSLASH__' ),
( 'PSLASH__' )
RETURNING *;
---- pages
INSERT INTO pages (id,page)
VALUES
( kid( 'PSLASH__' ), '/' )
RETURNING *;
---- texts
INSERT INTO texts (id,text)
VALUES
( kid( 'MTEST___' ), ($$test2
test3
$$)),
( kid( 'MSLASH__' ), ($$<p>Dark Souls 2 (Scholar of the First Sin) Wiki Site</p>
<p>TODO</p>$$))
RETURNING *;
-- test
INSERT INTO main_pages (page_id,text_id)
VALUES
( kid( 'PSLASH__' ), kid( 'MSLASH__') )
RETURNING *;

-- GNU Affero General Public License v3.0 or later
-- NO WARRANTY OF ANY KIND more details at <https://www.gnu.org/licenses/>
-- SPDX-License-Identifier: AGPL-3.0-or-later
-- app: `ds2_wiki` Dark Souls 2 (Scholar of the First Sin) Wiki Site
-- Ⓒ Copyright (C) 2026 Oleg'Ease'Kharchuk ᦒ
