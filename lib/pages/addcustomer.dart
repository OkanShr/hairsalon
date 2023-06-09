import 'package:flutter/material.dart';
import 'package:hairsalon/components/customappbar.dart';
import 'package:hairsalon/widget/customtextinput.dart';
import 'package:hairsalon/widget/datepicker.dart';
import 'package:hairsalon/widget/genderselect.dart';
import '../db/app_db.dart';
import 'package:drift/drift.dart' as drift;

import '../widget/custompageroute.dart';
import 'customers.dart';

final _formKey = GlobalKey<FormState>();

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);
  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  late AppDb _db;
  // ignore: non_constant_identifier_names
  final TextEditingController _Namecontroller = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _HairColorcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _db = AppDb();
  }

  @override
  void dispose() {
    _db.close();
    _Namecontroller.dispose();
    _HairColorcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbartitle: "Müşteri Ekle"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 40, top: 20, bottom: 10),
            child: Text(
              'Müşteri Bilgileri',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomTextInput(
                      controller: _Namecontroller,
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
                      controller: _HairColorcontroller,
                      inputtitle: "Saç Rengi",
                      inputhint: 'Renk',
                      inputlines: 1,
                    ),
                  ],
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     CustomTextInput(
                //       inputtitle: "Tel Numara",
                //       inputhint: '69...',
                //       inputlines: 1,
                //     ),
                //     CustomTextInput(
                //       inputtitle: "Not",
                //       inputhint: 'Not',
                //       inputlines: 4,
                //     ),
                //   ],
                // ),
                // const Divider(
                //   height: 40,
                //   thickness: 5,
                //   color: Colors.black,
                // ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                //   child: Text(
                //     'Alerji Bilgileri',
                //     style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // const Multiselectdropdown(),
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
                            final entity = CustomerCompanion(
                              customerName: drift.Value(_Namecontroller.text),
                              hairColor: drift.Value(_Namecontroller.text),
                            );
                            _db.insertCustomer(entity).then((value) =>
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Müşteri Eklendi"),
                                  ),
                                ));
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              CustomPageRoute(child: const Customers()),
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
          )
        ],
      ),
    );
  }
}
