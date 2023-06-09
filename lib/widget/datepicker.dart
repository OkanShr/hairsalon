import 'package:flutter/material.dart';

class Datepicker extends StatefulWidget {
  const Datepicker({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DatepickerState createState() => _DatepickerState();
}

class _DatepickerState extends State<Datepicker> {
  DateTime? _dateTime;
  String? year;
  String? month;
  String? day;
  String? formatted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Dogum Tarihi",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    formatted ?? '0000-00-00',
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(0, 42),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2050))
                        .then((date) => {
                              setState(() {
                                _dateTime = date;
                                year = _dateTime?.year.toString();
                                month = _dateTime?.month.toString();
                                day = _dateTime?.day.toString();
                                formatted = "$year-$month-$day";
                              })
                            });
                  },
                  child: const Icon(
                    Icons.date_range,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
