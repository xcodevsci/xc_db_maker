import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'tables_helper.dart';

/// Class initilize db and create database
class PdoFactory {
  final List<Tables> tables;
  final String dbname;
  final columnId = 'id';
  final _databaseVersion = 1;

  PdoFactory({this.dbname, this.tables});

  Directory documentsDirectory;
  String path;
  Database _database;

  /// Create Database
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    //print("hey : ${_database}");
    return _database;
  }

  /// Let's use FOREIGN KEY constraints
  Future onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  /// this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    final _databaseName = dbname;
    documentsDirectory = await getApplicationDocumentsDirectory();
    path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion,
        onConfigure: onConfigure,
        onCreate: _onCreate);
  }

  /// SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    if (tables.isNotEmpty) {
      tables.forEach((table) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS ${table.name} 
          ($columnId INTEGER PRIMARY KEY, ${table.columns})
        ''');
      });
    }
  }
}
