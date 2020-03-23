import 'package:flutter/material.dart';
import 'package:xc_db_maker/tools/tables_helper.dart';
import 'package:xc_db_maker/db_maker.dart';

List<Tables> listTables = <Tables>[
  Tables(
      name: "client",

      columns: '''
          fullname TEXT NULL,
          city TEXT NULL,
          country TEXT NULL,
          address TEXT NULL
          '''
  ),
  Tables(
      name: "user",
      columns: '''
          login TEXT NULL,
          pwd TEXT NULL
          '''
  ),
  //....
];

class AppDb{
  VoidCallback _onDbCloseCallback;
  get db => Make.db;


  Future<Null> xcDBInit([String dbpath]) async{
    await setDb(dbpath);
    return null;
  }

  Future<Null> setDb([String dbpath]) async{
    String _dbpath = dbpath;

    if(_dbpath == null){
      await Make.xcCreationTables(dbname: "xcdbexample", listTables:listTables );
    }

    return null;
  }

  set onDbCloseCallback(VoidCallback callback){
    _onDbCloseCallback = callback;
  }


  closeDb(){
    if(db != null)
      Make.xcDbClose();
    if (_onDbCloseCallback != null){
      _onDbCloseCallback();
    }
  }
  ///
  /// Singleton Factory
  ///
  static final AppDb _appDb = new AppDb._internal();
  factory AppDb() {
    return _appDb;
  }
  AppDb._internal();
}

AppDb appDb = new AppDb();