import 'package:flutter/material.dart';
import 'package:school_managment/attendence/attendence.dart';
import 'package:school_managment/page/homepage.dart';
import 'package:school_managment/util/drawerlisttile.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerlistTile(
            name: "Home",
            ontap: (() {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const HomePage())));
            }),
            imagePath: "home.jpg"),
        DrawerlistTile(
            name: "Attendence",
            ontap: (() {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const Attendance())));
            }),
            imagePath: "attendence.png"),
      ],
    );
  }
}
