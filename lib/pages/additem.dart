import 'package:flutter/material.dart';
import 'package:hairsalon/components/customappbar.dart';
import 'package:hairsalon/components/itemform.dart';

class Additem extends StatefulWidget {
  const Additem({Key? key}) : super(key: key);

  @override
  _AdditemState createState() => _AdditemState();
}

class _AdditemState extends State<Additem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbartitle: "Ürün Ekle"),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40, top: 20, bottom: 10),
            child: Text(
              'Ürün Bilgileri',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          ItemForm()
        ],
      ),
    );
  }
}
