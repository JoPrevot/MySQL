-- Authentification/connexion
>mysql -u root -- Si l'utilisateur n'a pas de MDP
>mysql -u root -p -- Si l'utilisateur a un MDP

-- 1. Lister toutes les base de données

SHOW DATABASES;

-- 2. Création de la base de données

CREATE DATABASE Ventes;

-- 3. Utiliser/sélectionner la base de données

USE ventes;

-- 4. Lister les tables de la DB

SHOW TABLES;

-- 5. Création de la table clients
-- INTEGER :  correspond au type ENTIER de la donnée
-- NOT NULL : cette colonne doit toujours contenir une information
-- AUTO_INCREMENT : demande à MySQL de fournir des valeurs en incrémentant automatiquement les clés primaires
-- PRIMARY KEY : défini la colonne comme étant la clé primaire
-- (X) : permet de réduire le nom de caractère à X
-- UNIQUE : Appliquer une contrainte d'unicité

CREATE TABLE clients(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(70) UNIQUE,
    telephone VARCHAR(20) NOT NULL
);

-- 6. Voir la description de la table
-- DESC <nom_table> ou DESCRIBE <nom_table>

DESC clients;

-- 7. Modifier une table en ajoutant une nouvelle colonne

ALTER TABLE clients ADD COLUMN postnom VARCHAR(50);

-- 8. Modifier une table en ajoutant une nouvelle colonne après une autre

ALTER TABLE clients ADD COLUMN postnom VARCHAR(50) AFTER prenom;

-- Il est possible de modifier une colonne déjà existante en rajoutant une contrainte (par exemple ici j'ai oublié de la mettre après le prénom)

ALTER TABLE clients MODIFY COLUMN postnom VARCHAR(50) AFTER prenom;

-- On commence le LMD (manipulation des données)

-- Lister les informations <SELECT> de toutes les colonnes <*> de la table clients <FROM nom_table>

SELECT * FROM clients;

-- Ici, il n'y a pas encore de données, donc le résultat est vide. Il faut donc insérer des données:

INSERT INTO clients(nom,prenom,postnom,email,telephone) values("Prevot","Jordan","Jo","jordan.prevot59@gmail.com","0123456789");

-- On peut ajouter plusieurs données d'un coup (mais il faut tout remplir et dans l'ordre, ici postnom n'a pas été pris en compte) :

INSERT INTO clients(nom,prenom,email,telephone) 
values("Prevot","Jordan","jordan.prevot59@gmail.com","0123456789")
("DUMORTIER","Steven","stevendumortier59@gmail.com","07474747474"),
("RAULIN","Ludovic","lraulin843@gmail.com","0621461941"),
("Perez","Marion","marion.oceane.perez@gmail.com","0786842676")
;

-- Ajout d'une colonne âge (ici ce sont des chiffres, donc on utilise INTEGER et (2) car on peut avoir 99 ans max)

ALTER TABLE clients ADD COLUMN age INTEGER(2);

-- 9. Mise à jour des données <UPDATE> de la table client <nom_table> 
-- <SET> la colonne à mettre à jour et sa nouvelle valeur <age=29> suivi d'une condition <WHERE> ici l'identifiant de la ligne 1 <id=1>

UPDATE clients SET age=29 WHERE id=1;

-- On peut modifier plusieurs colonnes d'un même ID :

UPDATE clients SET nom="Prevot",prenom="Oceane",postnom="Oce",age=27 WHERE id=2;
