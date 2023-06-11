import 'package:flutter/material.dart';
import 'package:hairsalon/components/customappbar.dart';
import 'package:hairsalon/components/itemcard.dart';
import 'package:hairsalon/components/itemsearchbar.dart';
import 'package:hairsalon/pages/additem.dart';
import 'package:hairsalon/widget/custompageroute.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbartitle: "Ürünler"),
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
                    'Ürün Ara',
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
                        CustomPageRoute(child: const Additem()),
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
                      'Urun Ekle',
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
          const ItemCard()
        ],
      ),
    );
  }
}
