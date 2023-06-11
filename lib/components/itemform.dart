import 'package:flutter/material.dart';
import 'package:hairsalon/widget/customtextinput.dart';

final _formKey = GlobalKey<FormState>();

class ItemForm extends StatelessWidget {
  const ItemForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CustomTextInput(
          //   inputtitle: "Isim Soyisim",
          //   inputhint: 'Isim Soyisim',
          //   inputlines: 1,
          // ),
          // CustomTextInput(
          //   inputtitle: "Saç Rengi",
          //   inputhint: 'Renk',
          //   inputlines: 1,
          // ),
          // CustomTextInput(
          //   inputtitle: "Tel Numara",
          //   inputhint: '69...',
          //   inputlines: 1,
          // ),
          // CustomTextInput(
          //   inputtitle: "Not",
          //   inputhint: 'Not',
          //   inputlines: 4,
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Divider(
                height: 40,
                thickness: 5,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    backgroundColor: Colors.black,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.only(
                        left: 35, right: 35, top: 15, bottom: 15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Ürün Eklendi"),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Ürün Ekle",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
