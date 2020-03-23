import 'dart:async';

import 'package:xc_db_maker_example/app_db.dart';
import 'package:xc_db_maker_example/entities/client.dart';
import 'package:xc_db_maker_example/models/manager.dart';

class EntityPdoManager extends EntityManager{

  // make this a singleton class
  EntityPdoManager._privateConstructor();

  static final EntityPdoManager instance = EntityPdoManager._privateConstructor();

  @override
  Future<int> addClient(Client client) async{
    print(client.toMap());
    var res = await appDb.db.insert("client", client.toMap());
    return res;
  }


  Future<int> deleteAllClient() async{
    var res = await appDb.db.delete("client");
    return res;
  }
}