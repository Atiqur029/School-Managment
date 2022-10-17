import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school_managment/appbar/commonapbar.dart';
import 'package:school_managment/attendence/attendence.dart';
import 'package:school_managment/button/bouncing.dart';
import 'package:school_managment/CartDesign/DashBoardCard/deshboard.dart';
import 'package:school_managment/leaveapply/leaveapply.dart';
import 'package:school_managment/widget/maindrower.dart';

import '../widget/studentdetails/studentdetailscard.dart';
import 'exam/examresult.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayedAnimation, leftCurve;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    leftCurve = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut)));
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          final GlobalKey<ScaffoldState> scafold = GlobalKey();

          return Scaffold(
            key: scafold,
            drawer: const Drawer(
              width: 250,
              backgroundColor: Colors.amber,
              elevation: 0,
              child: MainDrawer(),
            ),
            appBar: CommonAppBar(
              isMenuenabled: true,
              isNotificaton: true,
              ontap: () {
                scafold.currentState!.openDrawer();
              },
              title: "Drawer",
            ),
            body: ListView(
              children: [
                const UserDetailsCard(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                    alignment: const Alignment(1, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform(
                              transform: Matrix4.translationValues(
                                  muchDelayedAnimation.value * width, 0, 0),
                              child: Bouncing(
                                  child: const DashBoardCard(
                                    name: "Attendence",
                                    imagePath: "attendence.png",
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const Attendance()));
                                  })),
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0, 0),
                            child: Bouncing(
                              onPressed: (() {}),
                              child: const DashBoardCard(
                                name: "Profile",
                                imagePath: "profile.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                    alignment: const Alignment(1.0, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0, 0),
                            child: Bouncing(
                                onPressed: (() => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => const ExamResult()))),
                                child: const DashBoardCard(
                                    name: "Exam", imagePath: "exam.png")),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0, 0),
                            child: Bouncing(
                                onPressed: (() {}),
                                child: const DashBoardCard(
                                    name: "Time Table",
                                    imagePath: "calender.png")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                    alignment: const Alignment(1, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0, 0),
                            child: Bouncing(
                                onPressed: (() {}),
                                child: const DashBoardCard(
                                    name: "Library", imagePath: "library.jpg")),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0, 0),
                            child: const DashBoardCard(
                              name: "Track Bus",
                              imagePath: "bus.png",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                    alignment: const Alignment(1, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0, 0),
                            child: Bouncing(
                              onPressed: (() {}),
                              child: const DashBoardCard(
                                  name: "Activity", imagePath: "activity.png"),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0, 0),
                            child: Bouncing(
                                onPressed: (() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const LeaveApply()));
                                }),
                                child: const DashBoardCard(
                                    name: "Leave Apply",
                                    imagePath: "leaveapply.png")),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
