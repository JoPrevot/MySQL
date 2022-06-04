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

