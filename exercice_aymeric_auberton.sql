-- I. PREMIERE PARTIE

-- Q1 : Quelle requête utiliser pour afficher l'ensemble des enregistrements de la table lpecom_livres ?

SELECT * 
FROM lpecom_livres;

-- Q2 : Quelle requête utiliser pour sélectionner uniquement les livres qui ont un prix strictement supérieur à 20 de la table lpecom_livres ?

SELECT * 
FROM lpecom_livres 
WHERE prix>20;

-- Q3 : Quelle requête utiliser pour trier les enregistrements de la table lpecom_livres du prix le plus élevé aux prix le plus bas ?

SELECT *
FROM lpecom_livres
ORDER BY prix DESC;

-- Q4 : Quelle requête utiliser pour récupérer le prix du livre le plus élevé de la table lpecom_livres ?

SELECT MAX(prix)
FROM lpecom_livres;

-- Q5 : Quelle requête utiliser pour récupérer les livres de la table lpecom_livres qui ont un prix compris entre 20 et 22 ?

SELECT *
FROM lpecom_livres
WHERE prix
BETWEEN 20 AND 22;

-- Q6 : Quelle requête utiliser pour récupérer tous les livres de la table lpecom_livres 
-- à l'exception de celui portant la valeur pour la colonne isbn_10 : 2092589547 ?

SELECT *
FROM lpecom_livres
WHERE isbn_10 != 2092589547;

-- Q7 : Quelle requête utiliser pour récupérer le prix du livre le moins élevé 
-- de la table lpecom_livres en renommant la colonne dans les résultats par minus ?

SELECT min(prix) 
AS minus 
FROM lpecom_livres;

-- Q8 : Quelle requête utiliser pour sélectionner uniquement les 3 premiers résultats sans le tout premier de la table lpecom_livres ?

SELECT *
FROM lpecom_livres
LIMIT 3 OFFSET 1;

-- II. DEUXIEME PARTIE

-- Q1 : Quelle requête utiliser pour afficher l'id des étudiants qui ont participés à au moins un examen ?

SELECT DISTINCT id_etudiant
FROM lpecom_examens;

-- Q2 : Quelle requête utiliser pour compter le nombre d'étudiants qui ont participés à au moins un examen ?

SELECT COUNT(DISTINCT id_etudiant)
FROM lpecom_examens;

-- Q3 : Quelle requête utiliser pour calculer la moyenne de l'examen portant l'id : 45 ?

SELECT AVG(note)
FROM lpecom_examens
WHERE id_examen = 45;

-- Q4: Quelle requête utiliser pour récupérer la meilleure note de l'examen portant l'id : 87 ?

SELECT MAX(note)
FROM lpecom_examens
WHERE id_examen = 87;

-- Q5 : Quelle requête utiliser pour afficher l'id des étudiants qui ont eu plus de 11 à l'examen 45 ou plus de 12 à l'examen 87 ?

SELECT DISTINCT id_etudiant
FROM lpecom_examens
WHERE (note > 11 AND id_examen = 45)
OR (note > 12 AND id_examen = 87);

-- Q6 : Quelle requête utiliser pour afficher tous les enregistrement de la table 
-- lpecom_examens avec en plus, si c'est possible, le prenom et le nom de l'étudiant ?

SELECT lpecom_examens.*, lpecom_etudiants.nom, lpecom_etudiants.prenom 
FROM lpecom_examens
JOIN lpecom_etudiants
ON lpecom_etudiants.id_etudiant=lpecom_examens.id_etudiant;

-- Q8 : Quelle requête utiliser pour afficher uniquement le nom et 
-- le prenom de l'étudiant avec l'id : 30 avec la moyenne de ses deux examens dans une colonne moyenne ?

SELECT lpecom_etudiants.nom, lpecom_etudiants.prenom, AVG(note) AS moyenne
FROM lpecom_examens
JOIN lpecom_etudiants
ON lpecom_etudiants.id_etudiant=lpecom_examens.id_etudiant
WHERE lpecom_examens.id_etudiant = 30;

-- Q9 : Quelle requête utiliser pour afficher les 3 meilleures examens,
-- du meilleur au moins bon, avec le prenom et le nom de l'étudiant associé ?

SELECT lpecom_etudiants.nom, lpecom_etudiants.prenom, lpecom_examens.note, lpecom_examens.matiere
FROM lpecom_examens
JOIN lpecom_etudiants
ON lpecom_etudiants.id_etudiant=lpecom_examens.id_etudiant
ORDER BY note DESC
LIMIT 3 OFFSET 0
;

-- IV. QUATRIEME PARTIE

-- Q1 : Quelle requête utiliser pour retrouver la ville qui possède les coordonnées GPS suivantes : 48.66913724637683, 1.87586057971015 ?

SELECT lpecom_cities.name
FROM lpecom_cities
WHERE gps_lat = "48.66913724637683" AND gps_lng = "1.87586057971015"
;

-- Q2 : Sans jointure, quelle requête utiliser pour calculer le nombre de villes que compte le département de l'Essonne ?

SELECT count(*)
FROM lpecom_cities
WHERE department_code = 71
;

-- Q3 : Sans jointure, quelle requête utiliser pour calculer le nombre de villes en Île-de-France se terminant par "-le-Roi" ?

SELECT count(*)
FROM lpecom_cities
WHERE name LIKE "%-le-Roi"
;

-- Q4 : Combien de villes possèdent le code postal (zip_code) 77320 ? Renommez la colonne de résultat n_cities.

SELECT count(*) AS n_cities
FROM lpecom_cities
WHERE zip_code = 77320
;

-- Q5 : Sans jointure, quelle requête utiliser pour calculer le nombre de villes commençant par "Saint-" en Seine-et-Marne ?

SELECT count(*)
FROM lpecom_cities
WHERE name LIKE "Saint-%"
AND department_code = 77
;

-- Q6 : Quelles villes possèdent un code postal (zip_code) compris entre 77210 et 77810 ?

SELECT name
FROM lpecom_cities
WHERE zip_code BETWEEN 77210 AND 77810
;

-- Q7 : Sans jointure, quelles sont les deux villes de Seine-et-Marne à avoir le code postal (zip_code) le plus grand ?

SELECT name
FROM lpecom_cities
WHERE department_code = 77
ORDER BY zip_code DESC
LIMIT 2
;

-- Q8 : Quel est le code postal (zip_code) le plus grand de la table lpecom_cities ?

SELECT MAX(zip_code)
FROM lpecom_cities
;

-- Q9 : Avec un seul WHERE et aucun OR, quelle est la requête permettant d'afficher les départements des régions ayant le code suivant : 
-- 75, 27, 53, 84 et 93 ? Le résultat doit afficher le nom du département ainsi que le nom et le slug de la région associée.

SELECT lpecom_departments.name, lpecom_regions.name, lpecom_regions.slug
FROM lpecom_departments
JOIN lpecom_regions
ON  lpecom_departments.code = lpecom_regions.code
WHERE lpecom_regions.code IN (75,27,53,84,93)
;

-- Q10 : Quelle requête utiliser pour obtenir en résultat, les noms de la région, 
-- du département et de chaque ville du département ayant pour code 77 ?

SELECT r.name AS Region,d.name AS Departement, c.name As Ville
FROM lpecom_cities c 
JOIN lpecom_departments d ON c.department_code = d.code
JOIN lpecom_regions r ON d.region_code = r.code
WHERE d.code = 77
;