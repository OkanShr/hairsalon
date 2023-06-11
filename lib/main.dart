import 'package:flutter/material.dart';
import 'package:hairsalon/pages/additem.dart';
import 'package:hairsalon/pages/customers.dart';
import 'package:hairsalon/pages/home.dart';
import 'package:hairsalon/pages/addcustomer.dart';
import 'package:hairsalon/pages/items.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  databaseFactory = databaseFactoryFfi;

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/addcustomer': (context) => AddCustomer(),
      '/customers': (context) => Customers(),
      '/items': (context) => Items(),
      '/additem': (context) => Additem()
    },
  ));
}
