import 'dart:async';

/// Interface
abstract class Manager {
  /// Add new ticket
  Future<int> xcAjoute([Map<dynamic, dynamic> json]);
}
