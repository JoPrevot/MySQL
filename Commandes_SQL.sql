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

-- Requête pour compter <COUNT> / sommer <SUM> / moyenner <AVG> :

SELECT COUNT(*) 
FROM <nom_table> 
WHERE <colonne4>="XXX"
;

-- Relation entre 2 tables : il faut définir une clé étrangère (référence)

CREATE TABLE clients(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(70) UNIQUE,
    telephone VARCHAR(20) NOT NULL
);

-- On veut maintenant faire une table secondaire pour les téléphones

-- Il faut préciser la clé étrangère <FOREIGN KEY(son_nouveau_nom)> et son lieu initial <REFERENCES la_table(nom_colonne)>

CREATE TABLE telephone(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(20) NOT NULL,
    id_client INTEGER,
    FOREIGN KEY(id_client) REFERENCES clients(id) ON DELETE CASCADE
);

-- Requête de jointure (entre 2 tables: clients et téléphone)

-- Pour faire la jonction entre les tables, on utilise <FROM> la DB mère <JOIN> la DB secondaire <ON> 

-- Et on précise où est faite la jointure: la colonne de la DB principale = la colonne de la DB secondaire

SELECT clients.prenom, clients.nom, telephone.numero 
FROM clients 
JOIN telephone 
ON clients.id=telephone.id_client
;

-- Autre exemple avec ajout d'un CONCAT et d'un alias:

SELECT CONCAT(clients.prenom, " ",clients.nom) AS nom, telephone.numero 
FROM clients 
JOIN telephone 
ON clients.id=telephone.id_client
;

-- Il est possible de définir les requêtes mathèmatiques comme calcul automatique via <GENERATED ALWAYS> <AS> <le_calcul> <STORED>

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `typePresta` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `nbDays` int(11) NOT NULL,
  `unitPrice` float NOT NULL,
  `state` tinyint(1) NOT NULL,
  `totalExcludeTaxe` float GENERATED ALWAYS AS (`nbDays` * `unitPrice`) STORED,
  `totalWithTaxe` float GENERATED ALWAYS AS (`nbDays` * `unitPrice` * 1.2) STORED
);

-- Utilisation de filtres de recherche avec <LIKE> et <%>

SELECT * 
FROM clients 
WHERE companyName LIKE "M2%"
;

SELECT * 
FROM clients 
WHERE companyName LIKE "%formation"
;

SELECT * 
FROM clients 
WHERE  companyName LIKE "%sopra%"
;

-- Requête HAVING : utilisé à la place de WHERE lorsque l'on groupe des résultats

-- Toutes les ventes des marques qui ont réalisé un CA de plus de 20000000

SELECT manufacturer,SUM(price*units_sold) as chiffre_affaire 
FROM telephones 
GROUP BY manufacturer HAVING chiffre_affaire>20000000
;

-- Requête SELECT dans une contrainte WHERE:

SELECT name, price 
FROM telephones 
WHERE price<(SELECT AVG(price) FROM telephones) 
ORDER BY price DESC
;

-- Possibilité de joindre plusieurs tables entre elles :

SELECT CONCAT(clients.nom, " ",clients.prenom) AS client, produits.designation
FROM produits
JOIN achats
ON achats.id_produit=produits.id
JOIN clients
ON achats.id_client=clients.id
;