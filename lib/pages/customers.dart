import 'package:flutter/material.dart';
import 'package:hairsalon/components/customappbar.dart';
import 'package:hairsalon/components/customersearchbar.dart';
import 'package:hairsalon/components/customercard.dart';

class Customers extends StatelessWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbartitle: "Müşteriler"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  side: const BorderSide(width: 3.0),
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 25, right: 25)),
              child: const Text(
                'Müşteri Ara',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 0,
            thickness: 5,
          ),
          Usercard()
        ],
      ),
    );
  }
}
