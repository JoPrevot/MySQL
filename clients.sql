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

