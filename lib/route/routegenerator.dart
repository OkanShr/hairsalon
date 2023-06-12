import 'package:flutter/material.dart';
import 'package:hairsalon/pages/addcustomer.dart';
import 'package:hairsalon/pages/additem.dart';
import 'package:hairsalon/pages/customers.dart';
import 'package:hairsalon/pages/editcustomer.dart';
import 'package:hairsalon/pages/home.dart';
import 'package:hairsalon/pages/items.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/customers':
        return MaterialPageRoute(builder: (_) => const Customers());
      case '/addcustomer':
        return MaterialPageRoute(builder: (_) => const AddCustomer());
      case '/editcustomer':
        if (args is int) {
          return MaterialPageRoute(builder: (_) => EditCustomer(id: args));
        }
        return _errorRoute();

      case '/items':
        return MaterialPageRoute(builder: (_) => const Items());
      case '/additem':
        return MaterialPageRoute(builder: (_) => const Additem());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error Page'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("No route found."),
        ),
      );
    });
  }
}
