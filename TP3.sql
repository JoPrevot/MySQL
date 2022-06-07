-- Création des tables

CREATE TABLE user(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR (50) NOT NULL UNIQUE,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    avatar VARCHAR(100) NOT NULL
    );

CREATE TABLE photos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    url_image VARCHAR (100) NOT NULL,
    id_user INT,
    FOREIGN KEY(id_user) REFERENCES user(id) ON DELETE CASCADE 
    );

CREATE TABLE likes(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    id_photo INT, 
    FOREIGN KEY(id_user) REFERENCES user(id) ON DELETE SET NULL,
    FOREIGN KEY(id_photo) REFERENCES photos(id) ON DELETE CASCADE
    );

CREATE TABLE commentaire(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    contenu VARCHAR(100),
    id_user INT,
    id_photo INT, 
    FOREIGN KEY(id_user) REFERENCES user(id) ON DELETE SET NULL,
    FOREIGN KEY(id_photo) REFERENCES photos(id) ON DELETE CASCADE
    );