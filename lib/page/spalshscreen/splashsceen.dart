import 'dart:async';

import "package:flutter/material.dart";
import 'package:school_managment/page/loggin/loginpage.dart';

class WellComeScreen extends StatefulWidget {
  const WellComeScreen({super.key});

  @override
  State<WellComeScreen> createState() => _WellComeScreenState();
}

class _WellComeScreenState extends State<WellComeScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), start);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 2.0, offset: Offset(1, 0))],
          image: DecorationImage(
              fit: BoxFit.cover,
              opacity: 2.0,
              image: AssetImage(
                "image/welcomeschool.jpg",
              )),
        ),
        child: const Center(
          child: Text(
            "WelCome Our School",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
        ),
      ),
    );
  }

  void start() {
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const LogginPage(
                title: "Logg in",
              )));
    });
  }
}
