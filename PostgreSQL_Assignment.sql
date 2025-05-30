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

-- Insert data into the rangers table
INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');


-- Insert data into the species table
INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES 
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


-- Insert data into the sightings table
INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

-- SELECT * FROM rangers;
-- SELECT * FROM species;
-- SELECT * FROM sightings;

-- Run SQL queries to complete the following tasks:

-- Problem 1: Register a new ranger
INSERT INTO rangers (name, region) VALUES ('Derek Fox', 'Coastal Plains');



-- Problem 2: Count unique species ever sighted
SELECT COUNT (DISTINCT species_id) AS unique_species_count FROM sightings;





-- Problem 3: Sightings where location includes 'Pass'
SELECT * FROM sightings 
   WHERE location ILIKE '%Pass%';




   -- Problem 4: Each ranger total sightings
SELECT ra.name, COUNT(si.sighting_id) AS total_sightings
FROM rangers ra
LEFT JOIN sightings si ON ra.ranger_id = si.ranger_id
GROUP BY ra.name
ORDER BY ra.name;




-- Problem 5: Species never sighted
SELECT sp.common_name
FROM species sp
LEFT JOIN sightings si ON sp.species_id = si.species_id
WHERE si.species_id IS NULL;




---Problem 6: Most recent 2 sightings
SELECT sp.common_name, si.sighting_time, ra.name
FROM sightings si
JOIN rangers ra ON si.ranger_id = ra.ranger_id
JOIN species sp ON si.species_id = sp.species_id
ORDER BY si.sighting_time DESC
LIMIT 2;




----Problem 7: Update species discovered before 1800 to status 'Historic'
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';





--- Problem 8: Label each sighting as Morning, Afternoon, or Evening 
SELECT sighting_id,
   CASE 
      WHEN EXTRACT (HOUR FROM sighting_time) < 12 THEN 'Morning'
      WHEN EXTRACT (HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
      ELSE 'Evening'
    END AS time_of_day  
FROM sightings;




---Problem 9: Delete rangers who have never sighted any species
DELETE FROM rangers 
 WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
 );
