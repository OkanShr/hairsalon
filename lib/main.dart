import 'package:flutter/material.dart';
import 'package:hairsalon/pages/additem.dart';
import 'package:hairsalon/pages/customers.dart';
import 'package:hairsalon/pages/editcustomer.dart';
import 'package:hairsalon/pages/home.dart';
import 'package:hairsalon/pages/addcustomer.dart';
import 'package:hairsalon/pages/items.dart';
import 'package:hairsalon/route/routegenerator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Hair Salon',
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}
