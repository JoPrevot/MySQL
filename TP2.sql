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
("Coaching","ReactTeachead",3,50,1000,1),
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

SELECT * FROM orders WHERE clientId=2;

-- 4. Afficher les noms et contacts de tous les contacts des clients qui ont sollicité un coaching

SELECT DISTINCT CONCAT(clients.firstName," ",clients.lastname," ",clients.phone) AS contact
FROM clients 
JOIN orders 
ON clients.id=orders.clientID 
WHERE orders.typePresta="Coaching";