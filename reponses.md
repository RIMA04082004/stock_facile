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

q2.1:
sqflite : permet d'utiliser SQLite dans Flutter (ouvrir la base, faire des requêtes).

path : sert à construire le chemin du fichier de la base (avec join).

sqflite_common_ffi : permet à sqflite de fonctionner sur Windows/Linux (sur Android/iOS, pas besoin).

q2.3:
Pourquoi id est int? (nullable) ?
Parce qu'avant l'insertion, la catégorie n'a pas encore d'id : c'est SQLite qui le crée automatiquement. Donc id vaut null tant que la catégorie n'est pas en base.

Pourquoi toMap() n'ajoute id que s'il n'est pas null ?
Pour ne pas envoyer 'id': null à SQLite. On laisse SQLite générer l'id tout seul à l'insertion. Si id existe (pour un update), on l'inclut.

q2.4:
1. Pourquoi un constructeur factory ?
Parce qu'il permet de faire des calculs ou des conversions avant de créer l'objet (comme transformer la Map de SQLite en vrai objet Dart). Un constructeur classique ne sait pas faire ça.

2. Pourquoi (map['prix'] as num).toDouble() ?
Parce que SQLite peut renvoyer un prix sous forme de nombre entier (ex: 5) ou décimal (ex: 5.5). Si on force en double, l'entier fait planter l'application. En passant par num, on accepte les deux, puis on force en décimal.