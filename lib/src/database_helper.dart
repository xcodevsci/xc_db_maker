import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'pdo_factory.dart';
import 'tables_helper.dart';

/// Inialize DB options
class DatabaseHelper {
  // make this a singleton class

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //static final createTables = PdoFactory(tables: listTables);

  Future<Database> createTables(String dbname, List<Tables> tables) async {
    return await PdoFactory(dbname: dbname, tables: tables).database;
  }
}
