import 'package:flutter/material.dart';
import 'package:hairsalon/widget/customtextinput.dart';
import 'package:hairsalon/widget/datepicker.dart';
import 'package:hairsalon/widget/genderselect.dart';
import 'package:hairsalon/widget/multiselectdropdown.dart';

final _formKey = GlobalKey<FormState>();

class FormWidget extends StatelessWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomTextInput(
                inputtitle: "Isim Soyisim",
                inputhint: 'Isim Soyisim',
                inputlines: 1,
              ),
              const Datepicker(),
            ],
          ),
          Row(
            children: [
              const Genderselect(),
              CustomTextInput(
                inputtitle: "Saç Rengi",
                inputhint: 'Renk',
                inputlines: 1,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextInput(
                inputtitle: "Tel Numara",
                inputhint: '69...',
                inputlines: 1,
              ),
              CustomTextInput(
                inputtitle: "Not",
                inputhint: 'Not',
                inputlines: 4,
              ),
            ],
          ),
          const Divider(
            height: 40,
            thickness: 5,
            color: Colors.black,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
            child: Text(
              'Alerji Bilgileri',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          const Multiselectdropdown(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Divider(
                height: 0,
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
                          content: Text("Müşteri Eklendi"),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Müşteri Ekle",
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
