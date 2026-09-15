-- POSTGRES: psql -d ds2 < drop.sql
SET search_path TO game, public;
DROP TABLE IF EXISTS main_pages;
DROP TABLE IF EXISTS texts;
DROP TABLE IF EXISTS pages;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS keys;
DROP SCHEMA IF EXISTS game;
