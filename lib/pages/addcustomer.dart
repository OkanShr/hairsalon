import 'package:flutter/material.dart';
import 'package:hairsalon/components/customappbar.dart';
import 'package:hairsalon/components/customerform.dart';

import '../db/sql_helper.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key, this.id}) : super(key: key);
  final int? id;
  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbartitle: "Müşteri Ekle"),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40, top: 20, bottom: 10),
            child: Text(
              'Müşteri Bilgileri',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          FormWidget()
        ],
      ),
    );
  }
}
