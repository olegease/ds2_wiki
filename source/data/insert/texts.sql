-- POSTGRES: psql -d ds2 < insert/texts.sql
INSERT INTO game.texts (key,value)
VALUES
( 'TEST', ($$test2
test3
$$)),
( 'MAIN', ($$<p>Dark Souls 2 (Scholar of the First Sin) Wiki Site</p>
<p>TODO</p>$$))
RETURNING *; -- print
