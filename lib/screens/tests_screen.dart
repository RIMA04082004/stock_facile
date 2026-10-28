  import 'package:flutter/material.dart';
  import '../database/database_helper.dart';
  import '../models/categorie.dart';
  import '../database/categorie_dao.dart';
  import 'package:sqflite/sqflite.dart';

  class TestsScreen extends StatelessWidget {
    const TestsScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ElevatedButton(
              onPressed: () async {
                final db = await DatabaseHelper().database;
                final resultat = await db.rawQuery('SELECT COUNT(*) AS nb FROM categories');
                debugPrint('Nombre de catégories : ${resultat.first['nb']}');
              },
              child: const Text('Ouvrir la base'),
            ),
            ElevatedButton(
  onPressed: () async {
    final nouvelle = Categorie(nom: 'Électroménager', description: 'Petits appareils');
    
    try {
      // On essaie d'insérer
      final id = await CategorieDao().insererCategorie(nouvelle);
      debugPrint('Catégorie insérée avec l\'id $id');
    } on DatabaseException catch (e) {
      // Si c'est une erreur de doublon (contrainte UNIQUE)
      if (e.isUniqueConstraintError()) {
        // On affiche un SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cette catégorie existe déjà')),
        );
      } else {
        // Autre erreur SQLite
        debugPrint('Erreur SQLite : $e');
      }
    }
  },
  child: const Text('Test : ajouter une catégorie'),
),
          ],
        ),
      );
    }
  }