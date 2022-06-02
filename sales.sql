CREATE DATABASE Sales;

USE Sales;

CREATE TABLE telephones(
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
manufacturer VARCHAR(30) NOT NULL,
price FLOAT(10) NOT NULL,
units_sold INTEGER(10) NOT NULL
);

INSERT INTO telephones(name,manufacturer,price,units_sold) values
("N1280","Nokia",199,1925)
("IPhone 4","Apple",399,9436)
("Galaxy S5","Samsung",299,2359)
("S5620 Monte","Samsung",250,2385)
("N8","Nokia",150,7543)
("Droid","Motorola",150,8395)
("IPhone 13 Pro Max","Apple",1300,12849)
("Galaxy Note 20","Samsung",1100,10353)
;

SELECT * FROM telephones;

SELECT * FROM telephones WHERE price>200;

SELECT * FROM telephones WHERE price>150 AND price<200;

SELECT * FROM telephones WHERE manufacturer="Apple" OR manufacturer="Samsung";