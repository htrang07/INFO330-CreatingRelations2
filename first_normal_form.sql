-- Using code from section BA. 
CREATE TABLE poke_temp AS 
WITH split(pokedex_number, abilities , nextAbility) AS 
	(SELECT pokedex_number, '' AS abilities, abilities|| ',' AS nextability 
	FROM pokemonOG
	UNION ALL 
		SELECT pokedex_number, 
			substr(nextability, 0, instr(nextability, ',')) AS abilities, 
			substr(nextAbility, instr(nextAbility, ',')+1) AS nextAbility 
		FROM split 
		WHERE nextAbility !='' 
) 
SELECT pokedex_number, abilities 
FROM split 
WHERE abilities != ''; 


-- rename abilities to abi

ALTER TABLE poke_temp 
RENAME COLUMN abilities TO abi; 

-- trim the unwanted characters
UPDATE poke_temp SET abi = REPLACE(abi, '[', ''); 
UPDATE poke_temp SET abi = REPLACE(abi, ']', ''); 
UPDATE poke_temp SET abi = REPLACE(abi, '''', ''); 


-- good so far!

-- now joining the seperate table to the og table

CREATE TABLE poke_1f AS  
SELECT * FROM poke_temp  
JOIN pokemonOG on poke_temp.pokedex_number = pokemonOG.pokedex_number; 

-- remove the ability columnn from og table to make it fully 1nf 

ALTER TABLE poke_1f DROP COLUMN abilities; 


-- recorrect the  columns to corrrect names  

ALTER TABLE poke_1f 
RENAME COLUMN abi TO abilities;
ALTER TABLE poke_1f 
DROP COLUMN pokedex_number;  
DROP TABLE poke_temp; 

 

 