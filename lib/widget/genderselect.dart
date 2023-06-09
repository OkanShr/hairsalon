import 'package:flutter/material.dart';

class Genderselect extends StatefulWidget {
  const Genderselect({Key? key}) : super(key: key);

  @override
  _GenderselectState createState() => _GenderselectState();
}

class _GenderselectState extends State<Genderselect> {
  String? valueChoose;
  List listItem = ["Female", "Male"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Cinsiyet",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black54),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
              hint: const Text("Cinsiyet"),
              value: valueChoose,
              onChanged: (newValue) {
                setState(() {
                  valueChoose = newValue as String;
                });
              },
              items: listItem.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
