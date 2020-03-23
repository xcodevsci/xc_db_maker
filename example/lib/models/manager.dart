import 'dart:async';

import 'package:xc_db_maker_example/entities/client.dart';


abstract class EntityManager{
  /// Add new ticket
  Future<int> addClient( Client client);
  Future<int> deleteAllClient();

}