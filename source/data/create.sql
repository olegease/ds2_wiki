-- POSTGRES: psql -d ds2 < create.sql
CREATE SCHEMA IF NOT EXISTS game;
---- SCHEMA: game
---- text fields for all other tables
CREATE TABLE IF NOT EXISTS game.texts (
    id      SERIAL PRIMARY KEY,
    key     CHAR(8) UNIQUE NOT NULL,
    value   TEXT NOT NULL
);
---- SCHEMA: users? TODO: for specific community activities like comments, rates, etc
