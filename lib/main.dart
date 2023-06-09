import 'package:flutter/material.dart';
import 'package:hairsalon/pages/additem.dart';
import 'package:hairsalon/pages/customers.dart';
import 'package:hairsalon/pages/home.dart';
import 'package:hairsalon/pages/addcustomer.dart';
import 'package:hairsalon/pages/items.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/addcustomer': (context) => AddCustomer(),
        '/customers': (context) => Customers(),
        '/items': (context) => Items(),
        '/additem': (context) => Additem()
      },
    ));
