import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  String appbartitle;
  Customappbar({super.key, required this.appbartitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const Border(
          bottom: BorderSide(color: Colors.black, width: 5),
          top: BorderSide(color: Colors.black, width: 5)),
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        appbartitle,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
