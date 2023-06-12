import 'package:flutter/material.dart';

class Usercard extends StatelessWidget {
  const Usercard(
      {Key? key,
      required this.id,
      required this.customername,
      required this.haircolor})
      : super(key: key);
  final int id;
  final String customername;
  final String haircolor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 10,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 240,
                        height: 50,
                        child: Text(
                          customername,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 240,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 50),
                            backgroundColor: Colors.black,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.only(
                                left: 35, right: 35, top: 15, bottom: 15),
                          ),
                          child: const Text(
                            'Müşteriyi Sil',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 240,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/editcustomer',
                                arguments: id);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 50),
                            backgroundColor: Colors.black,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.only(
                                left: 35, right: 35, top: 15, bottom: 15),
                          ),
                          child: const Text(
                            'Müşteri Edit',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 240,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 50),
                            backgroundColor: Colors.black,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.only(
                                left: 35, right: 35, top: 15, bottom: 15),
                          ),
                          child: const Text(
                            'Müşteri Geçmişi',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
