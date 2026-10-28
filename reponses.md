q1.3:
disponible : en INTEGER avec 1 = vrai et 0 = faux
date_ajout : en TEXT au format ISO 8601 
AUTOINCREMENT: l'id augmente automatiquement à chaque insertion et n'est jamais réutilisé
UNIQUE: Il interdit les doublons ca veut dire deux categories ne peuvent avoir le meme nom
CHECK (prix >= 0):Il refuse toute insertion ou modification avec un prix négatif
ON DELETE RESTRICT: On ne peut pas supprimer une catégorie tant qu'elle contient encore des produits

q1.4:
Pour mettre une apostrophe à l'intérieur d'une chaîne il faut la doubler (''). Si on écrivait 'Huile d'olive', SQLite va croire que la chaîne se termine après le d et provoquerait une erreur de syntaxe. 

q1.7 : Le fichier sql/schema.sql contient seulement les CREATE TABLE des deux tables : la structure (colonnes, types, clés primaires, clés étrangères, contraintes NOT NULL, UNIQUE, CHECK, DEFAULT). Il ne contient pas les données (pas de INSERT), parce qu'on a coché « schéma uniquement ».

q1.8:Fermer la base libère le verrou et garantit que le fichier est à jour avant qu'un autre programme l'ouvre.