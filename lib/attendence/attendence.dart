import 'package:flutter/material.dart';
import 'package:school_managment/attendence/overall.dart';
import 'package:school_managment/attendence/todayatendence.dart';
import 'package:school_managment/CartDesign/cartDesign.dart';
import 'package:school_managment/util/commondrawer.dart';
import 'package:school_managment/widget/maindrower.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendaneState();
}

class _AttendaneState extends State<Attendance>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scafoldkey = GlobalKey();
    return Scaffold(
      key: scafoldkey,
      appBar: CommonDrower(
        title: "Attendance",
        isMenuEnabled: true,
        isNatificationEnabled: true,
        ontap: (() {
          scafoldkey.currentState!.openDrawer();
        }),
      ),
      drawer: const Drawer(
        elevation: 0.0,
        child: MainDrawer(),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const UserDetailsCard(),
          DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      child: TabBar(
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black26,
                          tabs: [
                            Tab(
                              text: "Today",
                            ),
                            Tab(
                              text: "OverAll",
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.68,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const TabBarView(
                        children: [TodayAttenDance(), OverAllAttendence()]),
                  ),
                ],
              ))
        ],
      )),
    );
  }
}
