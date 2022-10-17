import 'package:flutter/material.dart';
import 'package:school_managment/appbar/commonapbar.dart';


import 'package:school_managment/widget/maindrower.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../cartdesign/subjectcards/subjectcards.dart';

class ExamResult extends StatefulWidget {
  const ExamResult({super.key});

  @override
  State<ExamResult> createState() => _ExamResultState();
}

class _ExamResultState extends State<ExamResult> with TickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayedAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 0.5, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.3, 0.5, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scafoldkey = GlobalKey();

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Scaffold(
        key: scafoldkey,
        appBar: CommonAppBar(
            isMenuenabled: true,
            isNotificaton: false,
            title: "Exam",
            ontap: () {
              scafoldkey.currentState!.openDrawer();
            }),
        drawer: const Drawer(
          elevation: 0,
          child: MainDrawer(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform(
                        transform: Matrix4.translationValues(
                            muchDelayedAnimation.value * width, 0, 0),
                        child: const Text(
                          "Exam Name",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Transform(
                          transform: Matrix4.translationValues(
                              delayedAnimation.value * width, 0, 0),
                          child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "date-10/6/2022",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ))),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: DropdownSearch<String>(
                    validator: (val) => val == null ? "Please Select" : null,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Menu mode",
                        hintText: "PleaSe Select ",
                      ),
                    ),
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: const [
                      'Quarterly',
                      'half yearly',
                      'First Revision',
                      'Second Revision',
                      'Third Revision',
                      'Annual Exam'
                    ],
                    selectedItem: "Quarterly",
                    onChanged: (val) {},
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SubjectCard(
                        subjectName: "MathMathics",
                        chapter: "1-5",
                        date: "6-10-2022",
                        time: "10Am-11Am",
                        mark: "90",
                        grade: "A+"),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SubjectCard(
                        subjectName: "English",
                        chapter: "2-9",
                        date: "8-6-2022",
                        time: "10Am-11Am",
                        mark: "90",
                        grade: "A+"),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SubjectCard(
                        subjectName: "Bangla",
                        chapter: "5-15",
                        date: "9-6-2022",
                        time: "10Am-11Am",
                        mark: "90",
                        grade: "A+"),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SubjectCard(
                        subjectName: "Bangla",
                        chapter: "5-15",
                        date: "10-6-2022",
                        time: "11Am-12Am",
                        mark: "90",
                        grade: "A+"),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SubjectCard(
                        subjectName: "Physics",
                        chapter: "5-15",
                        date: "10-6-2022",
                        time: "1PM-2PM",
                        mark: "90",
                        grade: "A+"),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SubjectCard(
                        subjectName: "Chemestry",
                        chapter: "2-7",
                        date: "10-6-2022",
                        time: "2PM-3PM",
                        mark: "90",
                        grade: "A+"),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0, 0),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SubjectCard(
                        subjectName: "Higer Math",
                        chapter: "10-15",
                        date: "14-6-2022",
                        time: "11Am-12Am",
                        mark: "90",
                        grade: "A+"),
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
