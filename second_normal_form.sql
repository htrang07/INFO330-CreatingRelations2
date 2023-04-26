CREATE TABLE pokemon (
pokedex_number INTEGER PRIMARY KEY, 
against_bug REAL, 
against_dark REAL, 
against_dragon REAL, 
against_electric REAL, 
against_fairy REAL, 
against_fight REAL, 
against_fire REAL, 
against_flying REAL, 
against_ghost REAL, 
against_grass REAL, 
against_ground REAL, 
against_ice REAL, 
against_normal REAL, 
against_poison REAL, 
against_psychic REAL, 
against_rock REAL, 
against_steel REAL, 
against_water REAL, 
attack INTEGER, 
base_egg_steps INTEGER, 
base_happiness INTEGER, 
base_total INTEGER, 
capture_rate INTEGER, 
classfication TEXT, 
defense INTEGER, 
experience_growth INTEGER, 
height_m REAL, 
hp INTEGER, 
name TEXT, 
percentage_male REAL, 
sp_attack INTEGER, 
sp_defense INTEGER, 
speed INTEGER, 
type1 TEXT, 
type2 TEXT, 
weight_kg REAL, 
generation INTEGER, 
is_legendary INTEGER 
); 

CREATE TABLE abilities (
    ability_id INTEGER PRIMARY KEY,
    ability_name TEXT 
);

-- create the pokemon_abilities table
CREATE TABLE pokemon_abilities (
    pokedex_number INTEGER,
    ability_id INTEGER,
    PRIMARY KEY (pokedex_number, ability_id),
    FOREIGN KEY (pokedex_number) REFERENCES pokemon (pokedex_number),
    FOREIGN KEY (ability_id) REFERENCES abilities (ability_id)
);

-- inser abilities from 1nf chart
INSERT INTO abilities (ability_id, ability_name)
SELECT DISTINCT NULL, abilities FROM poke_1f
WHERE abilities != '';


CREATE TABLE types (
    types_id INTEGER PRIMARY KEY,
    types_name TEXT 
);

CREATE TABLE pokemon_types 
AS SELECT 
pokedex_number INTEGER, 
type1 TEXT, 
type2 TEXT
FROM pokemonOG; 

CREATE TABLE pokemon_base 
AS SELECT 
pokedex_number, 
base_egg_steps,
base_happiness,
base_total
FROM pokemonOG; 

CREATE TABLE pokemon_info 
AS SELECT 
weight_kg,
percentage_male,
height_m,
experience_growth,
capture_rate
FROM pokemonOG; 

CREATE TABLE pokemon_internal 
AS SELECT 
generation,
is_legendary
FROM pokemonOG; 

CREATE TABLE pokemon_stats 
AS SELECT 
pokedex_number, 
attack, 
defense, 
sp_attack, 
sp_defense, 
speed 
FROM pokemonOG; 
 
CREATE TABLE pokemon_abilities_num 
AS SELECT 
pokedex_number, 
abilities
FROM pokemonOG; 


-- ignore the poke_1f and pokemonOG databases

