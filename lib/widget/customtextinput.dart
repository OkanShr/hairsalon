import 'package:flutter/material.dart';

typedef StringCallback = void Function(String val);

// ignore: must_be_immutable
class CustomTextInput extends StatelessWidget {
  String inputtitle;
  String inputhint;
  int inputlines;
  final TextEditingController controller;

  CustomTextInput(
      {super.key,
      required this.inputtitle,
      required this.inputlines,
      required this.inputhint,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputtitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: controller,
              maxLines: inputlines,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black54),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.black54),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: inputhint),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Bir $inputtitle Girin";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
