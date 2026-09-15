-- POSTGRES: psql -d ds2 < create.sql
CREATE SCHEMA IF NOT EXISTS game;
---- SCHEMA: game
SET search_path TO game, public;
---- keys for all tables
CREATE TABLE IF NOT EXISTS keys (
    id                  SERIAL PRIMARY KEY,
    key                 CHAR(8) UNIQUE NOT NULL
);
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
