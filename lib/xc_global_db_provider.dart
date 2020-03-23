import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';
import 'tables_helper.dart';

/// BASE DE DONNEE PROVIDER
final dbHelper = DatabaseHelper.instance;

class XCGlobalDbProvider{

  Database _db;
  VoidCallback _onDbCloseCallback;

  get db =>_db;

  createTables(String dbname,List<Tables> listTables) async{
    _db = await dbHelper.createTables(dbname,listTables);

    if(_db.isOpen)
      print("DATABASE IS OPEN SIMPLY");
  }

  Future closedb() async{
    if(_db != null)
      await _db.close();

    if (_onDbCloseCallback != null){
      _onDbCloseCallback();
    }
  }

  set onDbCloseCallback(VoidCallback callback){
    _onDbCloseCallback = callback;
  }

  ///
  /// Singleton Factory
  ///
  static final XCGlobalDbProvider _xcGlobalDbProvider = new XCGlobalDbProvider._internal();
  factory XCGlobalDbProvider() {
    return _xcGlobalDbProvider;
  }
  XCGlobalDbProvider._internal();
}

XCGlobalDbProvider xcGlobalDbProvider = new XCGlobalDbProvider();