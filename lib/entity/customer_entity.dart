import 'package:drift/drift.dart';

class Customer extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get customerName => text().named('customer_name')();
  TextColumn get hairColor => text().named('hair_color')();
}
