-- POSTGRES
---- SCHEMA: game
CREATE SCHEMA IF NOT EXISTS game;
SET search_path TO game, public;
---- keys for all tables
CREATE TABLE IF NOT EXISTS keys (
    id                  SERIAL PRIMARY KEY,
    key                 CHAR(8) UNIQUE NOT NULL
);
---- key helper function `kid`: get key id from fixed character size
CREATE OR REPLACE FUNCTION kid( k CHAR(8) )
RETURNS INTEGER AS $$
SELECT id FROM keys WHERE key = k;
$$ LANGUAGE sql STABLE;
---- text fields for all other tables
CREATE TABLE IF NOT EXISTS texts (
    id                  INTEGER PRIMARY KEY REFERENCES keys(id) ON DELETE CASCADE,
    text                TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS titles (
    id                  INTEGER PRIMARY KEY REFERENCES keys(id) ON DELETE CASCADE,
    title               VARCHAR(63) NOT NULL
);
CREATE TABLE IF NOT EXISTS pages (
    id                  INTEGER PRIMARY KEY REFERENCES keys(id) ON DELETE CASCADE,
    page                VARCHAR(127) NOT NULL
);
---- HTML main element pages contents
CREATE TABLE IF NOT EXISTS main_pages (
    id                  SERIAL PRIMARY KEY,
    page_id             INTEGER UNIQUE NOT NULL REFERENCES pages(id) ON DELETE CASCADE,
    text_id             INTEGER UNIQUE NOT NULL REFERENCES texts(id) ON DELETE CASCADE
);
---- SCHEMA: users? TODO: for specific community activities like comments, rates, etc
---- SCHEMA: views
CREATE SCHEMA IF NOT EXISTS views;
SET search_path TO views, public;
---- main_pages
CREATE OR REPLACE VIEW contents AS
SELECT
    m.id    AS id,
    p.page  AS page,
    t.text  AS text
FROM game.main_pages m
JOIN game.pages p ON p.id = m.page_id
JOIN game.texts t ON t.id = m.text_id

-- GNU Affero General Public License v3.0 or later
-- NO WARRANTY OF ANY KIND more details at <https://www.gnu.org/licenses/>
-- SPDX-License-Identifier: AGPL-3.0-or-later
-- app: `ds2_wiki` Dark Souls 2 (Scholar of the First Sin) Wiki Site
-- Ⓒ Copyright (C) 2026 Oleg'Ease'Kharchuk ᦒ
