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
( ( SELECT id FROM keys WHERE key = 'PSLASH__' ), '/' )
RETURNING *;
---- texts
INSERT INTO texts (id,text)
VALUES
( ( SELECT id FROM keys WHERE key = 'MTEST___' ), ($$test2
test3
$$)),
( ( SELECT id FROM keys WHERE key = 'MSLASH__' ), ($$<p>Dark Souls 2 (Scholar of the First Sin) Wiki Site</p>
<p>TODO</p>$$))
RETURNING *; -- print
-- test
INSERT INTO main_pages (page_id,text_id)
VALUES
( ( SELECT id FROM keys WHERE key = 'PSLASH__' ), ( SELECT id FROM keys WHERE key = 'MSLASH__') )
RETURNING *; -- print