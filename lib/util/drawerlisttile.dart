import 'package:flutter/material.dart';

class DrawerlistTile extends StatelessWidget {
  final String name;
  final Function() ontap;
  final String imagePath;
  const DrawerlistTile({
    Key? key,
    required this.name,
    required this.ontap,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Image.asset(
        "image/$imagePath",
        height: 40,
      ),
      contentPadding: const EdgeInsets.only(left: 40, top: 10, bottom: 5),
      title: Text(
        name,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green),
      ),
    );
  }
}
