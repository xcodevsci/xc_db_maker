import 'tables_helper.dart';
import 'global_db_provider.dart';

class Make {
  static get db => globalDbProvider.db;

  // Creation des tables xcCreateTable
  static xcCreationTables({String dbname, List<Tables> listTables}) async {
    globalDbProvider.createTables(dbname, listTables);
  }

  static xcDbClose() {
    globalDbProvider.closedb();
  }

  //Ajouter des donner
  static xcAjoute() {}
}
