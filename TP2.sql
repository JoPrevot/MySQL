-- 1. Création de la DB et des table

CREATE DATABASE TP2;

USE TP2;

CREATE TABLE orders(
id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
typePresta VARCHAR(30) NOT NULL,
designation VARCHAR(30) NOT NULL,
clientId INTEGER NOT NULL,
FOREIGN KEY(clientId) REFERENCES clients(id) ON DELETE RESTRICT,
nbDays INTEGER NOT NULL,
unitPrice FLOAT(10,2) NOT NULL,
state INTEGER(1) NOT NULL
);

CREATE TABLE clients(
id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
companyName VARCHAR(30) NOT NULL,
firstName VARCHAR(30) NOT NULL,
lastName VARCHAR(30) NOT NULL,
email VARCHAR(30) NOT NULL,
phone VARCHAR(20) NOT NULL,
address VARCHAR(30) NOT NULL,
zipCode VARCHAR(10) NOT NULL,
city VARCHAR(30) NOT NULL,
country VARCHAR(30) NOT NULL,
state INTEGER(1) NOT NULL
);

-- 2. Remplissage de la DB

INSERT INTO orders(typePresta,designation,clientId,nbDays,unitPrice,state) values
("Formation","Angular init",2,3,1200,0),
("Formation","React avancé",2,3,1000,2),
("Coaching","ReactTechlead",1,20,900,2),
("Coaching","Nest.jsTechlead",1,50,800,1),
("Coaching","ReactTechlead",3,50,1000,1),
("Coaching","Jakarta EE",3,100,900,2),
("Coaching","AngularTechlead",4,5,500,0),
("Coaching","AngularTechlead",3,5,500,0),
("Formation","Angular init",4,3,1200,0),
("Formation","React avancé",1,3,1000,1)
;

INSERT INTO clients(companyName,firstName,lastName,email,phone,adress,zipCode,city,country,state) values
("Capgemini","Fabrice","Martin","martin@mail.com","0611111111","abc","xyz","Nantes","France",0),
("M2I Formation","Julien","Lamard","lamard@mail.com","0611223344","abc","xyz","Paris","France",1),
("ATOS","Jacques","Lean","lean@mail.com","0611223355","abc","xyz","Lille","France",0),
("SOPRA STERIA","Pierre","Dupont","dupont@mail.com","0611223388","abc","xyz","Marseille","France",1)
;

-- 3. Afficher toutes les formations sollicités parle client M2i formation

SELECT orders.typePresta,orders.designation FROM orders WHERE clientId=2;

-- 4. Afficher les noms et contacts de tous les contacts des clients qui ont sollicité un coaching

SELECT DISTINCT CONCAT(clients.firstName," ",clients.lastname," ",clients.phone) AS contact
FROM clients 
JOIN orders 
ON clients.id=orders.clientID 
WHERE orders.typePresta="Coaching";

-- 5. Afficher les noms et contacts de tous les contacts des clients qui ont sollicité un coaching pour les accompagnements React.js

SELECT DISTINCT CONCAT(clients.firstName," ",clients.lastname," ",clients.phone) AS contact
FROM clients 
JOIN orders 
ON clients.id=orders.clientID 
WHERE orders.typePresta="Coaching" AND orders.designation="ReactTechlead";

-- 6. Pour chacune des demandes de formation, afficher le prix UHT et prix TTC en se basant sur le unité Price (TJM)
-- et le nombre de jours de prestation tout en sachant que la TVA est de 20%.


-- On crée la view (je ne sais pas quelles sont les infos attendues, donc on met juste le type de presta):

CREATE VIEW priceTotal AS SELECT 
CONCAT(typePresta," ",designation) AS prestation,
CONCAT(unitPrice*nbDays," €") AS totalExcludeTaxe,
CONCAT(unitPrice*nbDays*1.2," €") AS totalWithTaxe,
state
FROM orders;

-- Puis on affiche la view :

SELECT * FROM priceTotal;

-- 7. Lister toutes les prestations qui sont confirmées et qui vont rapporter plus 30.000€

SELECT prestation FROM priceTotal WHERE totalWithTaxe>=30000 AND state=2;

-- CORRECTION et AJOUT :

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

-- Chaine qui commencent par M2

SELECT * FROM clients 
WHERE companyName LIKE "M2%";

-- Chaine qui se terminent par formation

SELECT * FROM clients 
WHERE companyName LIKE "%formation";

-- Rechercher au milieu d'une chaine
-- chris@sopra.com => ok
-- jean@m2i.com
-- sarah@sopra.fr => ok
-- luc@sopra.edu => ok

SELECT * FROM clients 
WHERE  companyName LIKE "%sopra%";

-- Requête HAVING : utilisé à la place de WHERE lorsque l'on groupe des résultats

-- Toutes les ventes des marques qui ont réalisé un CA de plus de 20000000

SELECT manufacturer,SUM(price*units_sold) as chiffre_affaire 
FROM telephones 
GROUP BY manufacturer HAVING chiffre_affaire>20000000
;

-- On peut utiliser une requête SELECT dans une contrainte WHERE:

SELECT name, price 
FROM telephones 
WHERE price<(SELECT AVG(price) FROM telephones) 
ORDER BY price DESC
;