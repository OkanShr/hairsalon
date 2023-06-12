import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:drift/native.dart';
import 'package:hairsalon/entity/customer_entity.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'customer.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Customer])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  // Get Customer List
  Future<List<CustomerData>> getCustomers() async {
    return await select(customer).get();
  }

  Future<CustomerData> getCustomer(int id) async {
    return await (select(customer)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateCustomer(CustomerCompanion entity) async {
    return await update(customer).replace(entity);
  }

  Future<int> insertCustomer(CustomerCompanion entity) async {
    return await into(customer).insert(entity);
  }

  Future<int> deleteCustomer(int id) async {
    return await (delete(customer)..where((tbl) => tbl.id.equals(id))).go();
  }
}
