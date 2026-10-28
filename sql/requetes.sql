Q1.5.1 tous les produits
SELECT * FROM produits;

Q1.5.2 les produits en rupture de stock (quantite = 0)
SELECT * FROM produits WHERE quantite = 0;

Q1.5.3 les produits triés du plus cher au moins cher
SELECT * FROM produits ORDER BY prix DESC;

Q1.5.4 le nom de chaque produit avec le nom de sa catégorie (INNER JOIN)
SELECT p.nom AS produit, c.nom AS categorie
FROM produits p
INNER JOIN categories c ON c.id = p.categorie_id;

Q1.5.5 le nombre de produits par catégorie (COUNT + GROUP BY)
SELECT c.nom AS categorie, COUNT(p.id) AS nombre_produits
FROM categories c
LEFT JOIN produits p ON p.categorie_id = c.id
GROUP BY c.id, c.nom;

Q1.5.6 la valeur totale du stock (SUM(prix * quantite))
SELECT SUM(prix * quantite) AS valeur_totale FROM produits;

q1.6.1:
 L'exécution s'est terminée avec des erreurs.
Résultat : CHECK constraint failed: prix >= 0
À la ligne 1 :
-- a) prix négatif
INSERT INTO produits (nom, prix, quantite, date_ajout, categorie_id)
VALUES ('Test prix', -5, 1, '2026-10-05T08:00:00', 1);

q1.6.2:
L'exécution s'est terminée avec des erreurs.
Résultat : FOREIGN KEY constraint failed
À la ligne 1 :
-- b) catégorie qui n'existe pas
INSERT INTO produits (nom, prix, quantite, date_ajout, categorie_id)
VALUES ('Test catégorie', 1, 1, '2026-10-05T08:00:00', 99);

q1.6.3:
L'exécution s'est terminée avec des erreurs.
Résultat : FOREIGN KEY constraint failed
À la ligne 1 :
-- c) supprimer une catégorie qui contient des produits
DELETE FROM categories WHERE id = 1;