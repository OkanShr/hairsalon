import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Inputname extends StatelessWidget {
  String inputtitle;
  Inputname({super.key, required this.inputtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, bottom: 10),
          child: SizedBox(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 10, color: Colors.black87),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: inputtitle),
            ),
          ),
        ),
      ],
    );
  }
}
