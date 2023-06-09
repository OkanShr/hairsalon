import 'package:flutter/material.dart';

import 'package:hairsalon/widget/custompageroute.dart';

import 'package:hairsalon/pages/addcustomer.dart';
import 'package:hairsalon/pages/customers.dart';
import 'package:hairsalon/pages/items.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/Logo.png'),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                CustomPageRoute(child: const AddCustomer()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              backgroundColor: Colors.black,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.only(
                  left: 35, right: 35, top: 15, bottom: 15),
            ),
            child: const Text(
              'Müşteri Ekle',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                CustomPageRoute(child: const Customers()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              backgroundColor: Colors.black,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.only(
                  left: 35, right: 35, top: 15, bottom: 15),
            ),
            child: const Text('Müşteriler', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                CustomPageRoute(child: const Items()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              backgroundColor: Colors.black,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.only(
                  left: 35, right: 35, top: 15, bottom: 15),
            ),
            child: const Text(
              'Ürünler',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      )),
    );
  }
}