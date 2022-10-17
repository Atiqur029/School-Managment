import 'package:flutter/material.dart';
import 'package:school_managment/CartDesign/overAllCart.dart';

class OverAllAttendence extends StatelessWidget {
  const OverAllAttendence({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: const [
        OverAllAttendenceCard(
            date: "3-10-2022",
            day: "Monday",
            isfirstHalf: true,
            issecondHalf: false),
        OverAllAttendenceCard(
            date: "4-10-2022",
            day: "Twesday",
            isfirstHalf: false,
            issecondHalf: true),
        OverAllAttendenceCard(
            date: "4-10-2022",
            day: "Twesday",
            isfirstHalf: true,
            issecondHalf: false),
        OverAllAttendenceCard(
            date: "5-10-2022",
            day: "Wednesdayday",
            isfirstHalf: true,
            issecondHalf: false),
        OverAllAttendenceCard(
            date: "5-10-2022",
            day: "Twesday",
            isfirstHalf: false,
            issecondHalf: true),
        OverAllAttendenceCard(
            date: "6-10-2022",
            day: "Wednesday",
            isfirstHalf: false,
            issecondHalf: true),
      ]),
    );
  }
}
