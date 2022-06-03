-- 1.1 Créer une base de données appelée sales

CREATE DATABASE Sales;

USE Sales;

 -- 1.2 Créer une table appelée telephones avec les colonnes suivantes (cf exo)

CREATE TABLE telephones(
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
manufacturer VARCHAR(30) NOT NULL,
price FLOAT(4,2) NOT NULL,
units_sold INTEGER(10) NOT NULL
);

-- 1.3 Insérer les données suivantes (cf exo)

INSERT INTO telephones(name,manufacturer,price,units_sold) values
("N1280","Nokia",199,1925),
("IPhone 4","Apple",399,9436),
("Galaxy S5","Samsung",299,2359),
("S5620 Monte","Samsung",250,2385),
("N8","Nokia",150,7543),
("Droid","Motorola",150,8395),
("IPhone 13 Pro Max","Apple",1300,12849),
("Galaxy Note 20","Samsung",1100,10353)
;

-- 2.1 Ecrire une requête pour liste tous les modèles de téléphones

SELECT * FROM telephones;

-- 2.2 Ecrire une requête pour lister tous les telephone(name, manufacturer) de tous lestéléphone dont le prix est supérieur à 200€

SELECT name,manufacturer FROM telephones WHERE price>200;

-- 2.3 Ecrire une requête pour lister tous les telephones (name,manufacturer) de tous les téléphones dont le prix est varie entre 150 et 200€

SELECT name,manufacturer FROM telephones WHERE price>=150 AND price<=200;

-- On peut aussi écrire un intervalle avec la fonction <BETWEEN> qui évite les erreurs de syntaxe sur les conditions:

SELECT name,manufacturer FROM telephones WHERE price BETWEEN 150 AND 200;

-- 2.4 Lister tous les téléphones de marque samsung et Apple

SELECT * FROM telephones WHERE manufacturer="Apple" OR manufacturer="Samsung";

-- On peut regrouper toutes les conditions ici avec <IN> plutôt que d'utiliser des OR :

SELECT * FROM `telephones` WHERE manufacturer IN("Apple","Samsung");

-- 3.1 On peut vouloir afficher la liste sous un certain ordre (prix)

-- Pour cela, on utilise <ORDER BY> puis la condition d'ordre <prix> et on termine par l'ordre ascendant <ASC> ou descendant <DESC>

SELECT id,name,manufacturer,price FROM telephones ORDER BY price ASC;

-- On peut aussi ajouter un deuxième niveau de critère pour l'ordre (exemple, on veut trier par prix, puis ensuite par fabriquant)

SELECT id,name,manufacturer,price FROM telephones ORDER BY price ASC, manufacturer ASC;

