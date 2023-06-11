import 'package:flutter/material.dart';
import 'package:hairsalon/components/customappbar.dart';
import 'package:hairsalon/components/customersearchbar.dart';
import 'package:hairsalon/components/customercard.dart';
import 'package:hairsalon/db/sql_helper.dart';
import 'package:hairsalon/pages/addcustomer.dart';

import '../widget/custompageroute.dart';

class Customers extends StatefulWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  List<Map<String, dynamic>> _customers = [];

  bool _isLoading = true;

  void _refreshCustomers() async {
    final data = await SQLHelper.getCustomers();
    setState(() {
      _customers = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    SQLHelper.db();
    _refreshCustomers();
    print("number of customers ${_customers.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbartitle: "Müşteriler"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: CustomSearchDelegate());
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
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
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            height: 0,
            thickness: 5,
          ),
          // Usercard()
        ],
      ),
    );
  }
}
