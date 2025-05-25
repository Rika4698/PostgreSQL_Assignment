-- Active: 1748096455628@@127.0.0.1@5432@conservation_db

--1. Crating database
CREATE DATABASE conservation_db;

-- 2. Table Creation:
--Rangers Table
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);


-- Species Table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(100) NOT NULL
)


-- Sightings Table
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    location VARCHAR(100) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT
)