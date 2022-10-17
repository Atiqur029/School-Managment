import 'package:flutter/material.dart';

import 'package:school_managment/CartDesign/attendenceCard.dart';

class TodayAttenDance extends StatelessWidget {
  const TodayAttenDance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AttentdenceCard(
            isAttendence: true,
            startTime: "9:00 AM",
            endtime: "10:00 AM",
            subject: "English",
            staf: "Atiqur",
          ),
          AttentdenceCard(
            isAttendence: true,
            startTime: "10:00 AM",
            endtime: "11:00 AM",
            subject: "Mathmatics",
            staf: "Atiqur",
          ),
        ],
      ),
    );
  }
}
