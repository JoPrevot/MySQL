-- Créer une DB

CREATE DATABASE <nom_DB> ;

-- Création d'une table

CREATE TABLE <nom_table>
(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    <colonne1> VARCHAR(50) NOT NULL,
    <colonne2> VARCHAR(50) NOT NULL,
    <colonne3> VARCHAR(70) UNIQUE,
    <colonne4> FLOAT(20) NOT NULL
);

-- Modifier une table en ajoutant une nouvelle colonne / après une autre

ALTER TABLE <nom_table> 
ADD COLUMN <colonne5> VARCHAR(50)
;

ALTER TABLE <nom_table> 
ADD COLUMN <colonne5> VARCHAR(50) AFTER <colonne3>
;

-- Modifier une colonne existante

ALTER TABLE <nom_table> 
MODIFY COLUMN <colonne2> VARCHAR(50) AFTER <colonne4>
;

-- Insertion de données dans la DB

INSERT INTO <nom_table>(<colonne1>,<colonne2>,<colonne3>,<colonne4>,<colonne5>) 
values
("AAA","ZZZ","EEE","RRR","TTT"),
("QQQ","SSS","DDD","FFF","GGG")
;

-- Mettre à jour une donnée / plusieurs données

UPDATE <nom_table>  
SET <colonne2> = <ABC> 
WHERE id = <N>
;

UPDATE <nom_table>  
SET <colonne2> = "<ABC>", <colonne3> = "<XYZ>"
WHERE id = <N>
;

-- Suppression d'un enregistrement <DELETE FROM> d'une table <nom_table> <WHERE> la condition <id=3>

DELETE FROM <nom_table> 
WHERE id = <n>
;

-- Requête WHERE classique (avec AND ou OR)

SELECT * FROM <nom_table> 
WHERE <colonne2> = "<ABC>" AND <colonne4> = 50
;

-- Requête BETWEEN : permet de simplifier l'écriture

SELECT <colonne2> 
FROM <nom_table> 
WHERE <colonne4> BETWEEN 150 AND 200
;

-- Requête IN : permet d'éviter un abus de OR si plusieurs conditions :

SELECT * 
FROM <nom_table> 
WHERE <colonne1> IN("ABC","DEF","GHI")
;

-- Requête ORDER BY : permet de liste les résultats selon un certain ordre

SELECT * 
FROM <nom_table> 
ORDER BY <colonne2> ASC
;

-- On peut filtrer sous plusieurs niveau de critères

SELECT * 
FROM <nom_table> 
ORDER BY 
<colonne2> ASC,
<colonne3> DESC
;

-- Requête d'alias AS : permet de renommer des colonnes après les avoir sélectionner

SELECT <colonne1> AS <nom1>, <colonne2> as <nom2> 
FROM <nom_table>
;

-- Requête CONCAT : regroupe les colonnes sous un seul nom

SELECT concat(<colonne1>, " ",<colonne2>) AS <nom>
FROM <nom_table>
;

-- Création d'une vue : permet de créer une requête à partir du résultat d'une requête déjà faite (évite de réécrire des requêtes longues)

CREATE VIEW <nom_vue> AS SELECT 
CONCAT(<colonne1>, " ",<colonne2>) AS <XXX>, 
CONCAT(<colonne3>, " ",<colonne4>) AS <YYY> 
FROM <nom_table>
;