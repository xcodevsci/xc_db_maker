library xc_db_maker;

import 'tables_helper.dart';
import 'xc_global_db_provider.dart';

class Make{

  static get db => xcGlobalDbProvider.db;

    // Creation des tables xcCreateTable
   static xcCreationTables({String dbname,List<Tables> listTables}) async {
     xcGlobalDbProvider.createTables(dbname, listTables);
   }

   static xcDbClose(){
     xcGlobalDbProvider.closedb();
   }

   //Ajouter des donner
    static xcAjoute(){

    }
}
