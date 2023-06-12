import 'package:flutter/material.dart';
import 'package:hairsalon/components/customappbar.dart';

class CustomerDetail extends StatefulWidget {
  const CustomerDetail({Key? key}) : super(key: key);

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbartitle: "Müşteri Adi"),
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
        ],
      ),
    );
  }
}
