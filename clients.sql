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

-- 4. Création de la table clients