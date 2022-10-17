import 'package:flutter/material.dart';

class DashBoardCard extends StatelessWidget {
  final String name;
  final String imagePath;
  const DashBoardCard({super.key, required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(10),
      height: height * 0.18,
      width: width * 0.38,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              blurRadius: 7,
              offset: Offset(0, 2),
            )
          ]),
      child: Column(
        children: [
          Image.asset(
            "image/$imagePath",
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
