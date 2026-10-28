import 'package:sqflite/sqflite.dart';
import '../models/categorie.dart';
import 'database_helper.dart';

class CategorieDao {
  static const String table = 'categories';

  Future<int> insererCategorie(Categorie categorie) async {
    // 1. On récupère la connexion à la base de données
    final Database db = await DatabaseHelper().database;
    // 2. On insère l'objet dans la table en le transformant en Map (via toMap)
    final int id = await db.insert(table, categorie.toMap());
    // 3. On retourne cet ID à l'écran qui a appelé la méthode
    return id;
  }
}