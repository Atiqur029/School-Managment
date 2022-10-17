import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:school_managment/appbar/commonapbar.dart';

import 'package:school_managment/button/bouncing.dart';
import 'package:school_managment/leaveapply/leavelhistory/leavelstoryCard.dart';
import 'package:school_managment/widget/maindrower.dart';

import 'customdatepicker/customDatePicker.dart';

class LeaveApply extends StatefulWidget {
  const LeaveApply({super.key});

  @override
  State<LeaveApply> createState() => _LeaveApplyState();
}

class _LeaveApplyState extends State<LeaveApply> with TickerProviderStateMixin {
  late AnimationController controller;

  late Animation animation, delayAnimation, muchDeleyAnimation, leftcurve;
  final serchFieldIconControlar = TextEditingController();
  String applyleavevalueChanged = '';
  String applyleavevalueToValidate = '';
  String applyleavevalueSaved = '';
  TextEditingController? applyLeaveControlar;

  TextEditingController? fromcontroller;
  String fromvalueChanged = '';
  String fromvalueToValidate = '';
  String fromvalueSaved = '';

  TextEditingController? tocontroller;
  String tovalueChanged = '';
  final String tovalueToValidate = '';
  final String tovalueSaved = '';

  @override
  void initState() {
    super.initState();

    applyLeaveControlar =
        TextEditingController(text: DateTime.now().toString());
    fromcontroller = TextEditingController(text: DateTime.now().toString());
    tocontroller = TextEditingController(text: DateTime.now().toString());
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));

    delayAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 0.5, curve: Curves.fastOutSlowIn)));

    muchDeleyAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.5, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.forward();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> scafoldkey = GlobalKey();
    return AnimatedBuilder(
        animation: controller,
        builder: ((context, child) => Scaffold(
            key: scafoldkey,
            appBar: CommonAppBar(
                title: "Apply Leave",
                ontap: (() {
                  scafoldkey.currentState!.openDrawer();
                })),
            drawer: const Drawer(
              elevation: 0,
              child: MainDrawer(),
            ),
            body: Form(
                key: _formkey,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                color: Colors.black.withOpacity(0.5),
                                height: 1,
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    muchDeleyAnimation.value * width, 0, 0),
                                child: const Text(
                                  "Apply Leave",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 13,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    children: [
                                      Transform(
                                        transform: Matrix4.translationValues(
                                            muchDeleyAnimation.value * width,
                                            0,
                                            0),
                                        child: SizedBox(
                                          width: width * .75,
                                          child: DateTimePicker(
                                            type: DateTimePickerType.date,
                                            dateMask: 'dd/MM/yyyy',
                                            style: const TextStyle(
                                                color: Colors.white),
                                            controller: applyLeaveControlar,
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2200),
                                            calendarTitle: "Leave Date",
                                            onChanged: ((value) {
                                              setState(
                                                () => applyleavevalueChanged =
                                                    value,
                                              );
                                            }),
                                            onSaved: (value) => setState(() {
                                              applyleavevalueSaved = value!;
                                            }),
                                            validator: (value) {
                                              setState(() {
                                                applyleavevalueToValidate =
                                                    value!;
                                              });
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      Transform(
                                        transform: Matrix4.translationValues(
                                          delayAnimation.value * width,
                                          0,
                                          0,
                                        ),
                                        child: const Icon(
                                          Icons.calendar_today,
                                          color: Colors.yellow,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    muchDeleyAnimation.value * width, 0, 0),
                                child: const Text(
                                  "Choose Leave Type",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                  muchDeleyAnimation.value * width,
                                  0,
                                  0,
                                ),
                                child: DropdownSearch<String>(
                                  selectedItem: "Medical",
                                  onChanged: print,
                                  items: const [
                                    "Medical",
                                    "Family",
                                    "Sick",
                                    "Function",
                                    "Others",
                                    "Null"
                                  ],
                                  popupProps: PopupProps.menu(
                                      showSelectedItems: true,
                                      disabledItemFn: (String s) =>
                                          s.startsWith('N')),
                                  dropdownDecoratorProps:
                                      const DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                    hintText: "Please Select Leave type",
                                    hintStyle: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  validator: (v) =>
                                      v == null ? "required fill" : null,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    muchDeleyAnimation.value * width, 0, 0),
                                child: const Text(
                                  "Leave Date",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 13,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 5, bottom: 5),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(0, 1),
                                            color: Colors.blue)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Transform(
                                        transform: Matrix4.translationValues(
                                            muchDeleyAnimation.value * width,
                                            0,
                                            0),
                                        child: const Icon(
                                          Icons.calendar_today,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      Transform(
                                          transform: Matrix4.translationValues(
                                              muchDeleyAnimation.value * width,
                                              0,
                                              0),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 4.0),
                                                width: width * 0.22,
                                                decoration: const BoxDecoration(
                                                  color: Colors.grey,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(0, 1),
                                                      blurRadius: 2,
                                                      color: Colors.black,
                                                    ),
                                                  ],
                                                ),
                                                child: CustomDatePicker(
                                                  onValidator: (val) {
                                                    setState(() {
                                                      fromvalueToValidate =
                                                          val!;
                                                    });
                                                    return null;
                                                  },
                                                  title: "form",
                                                  onSaved: (val) {
                                                    setState(() {
                                                      fromvalueSaved != val;
                                                    });
                                                  },
                                                  controller: fromcontroller,
                                                  onChange: (onChange) {
                                                    setState(() {
                                                      fromvalueChanged =
                                                          onChange;
                                                    });
                                                  },
                                                ),
                                              ))),
                                      Transform(
                                        transform: Matrix4.translationValues(
                                            muchDeleyAnimation.value * width,
                                            0,
                                            0),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Transform(
                                          transform: Matrix4.translationValues(
                                            muchDeleyAnimation.value * width,
                                            0,
                                            0,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0),
                                              width: width * 0.28,
                                              decoration: const BoxDecoration(
                                                color: Colors.red,
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 1),
                                                    blurRadius: 2,
                                                    color: Colors.black26,
                                                  )
                                                ],
                                              ),
                                              child: CustomDatePicker(
                                                  onChange: (val) {
                                                    setState(() {
                                                      fromvalueChanged = val;
                                                    });
                                                  },
                                                  onValidator: (val) {
                                                    setState(() {
                                                      fromvalueToValidate =
                                                          val!;
                                                    });
                                                    return null;
                                                  },
                                                  onSaved: ((val) {
                                                    tovalueChanged = val!;
                                                  }),
                                                  title: "To"),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    muchDeleyAnimation.value * width, 0, 0),
                                child: const Text(
                                  "Apply Leave Only",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Transform(
                                  transform: Matrix4.translationValues(
                                      muchDeleyAnimation.value * width, 0, 0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 13),
                                    child: Container(
                                      height: height * 0.25,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: TextFormField(
                                        minLines: 1,
                                        maxLength: 10,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                const EdgeInsets.all(7),
                                            suffixIcon: serchFieldIconControlar
                                                    .text.isNotEmpty
                                                ? IconButton(
                                                    onPressed: (() =>
                                                        WidgetsBinding.instance
                                                            .addPostFrameCallback(
                                                                (timeStamp) {
                                                          serchFieldIconControlar
                                                              .clear();
                                                        })),
                                                    icon: (const Icon(
                                                      Icons.clear,
                                                      color: Colors.red,
                                                    )),
                                                  )
                                                : null),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    muchDeleyAnimation.value * width, 0, 0),
                                child: const Text(
                                  "Attach Document",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    delayAnimation.value * width, 0, 0),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 5),
                                  child: InkWell(
                                    onTap: () async {},
                                    child: const Text(
                                      "Click Here",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Container(
                                height: height * 0.07,
                                margin:
                                    const EdgeInsets.only(top: 3, bottom: 10),
                                child: Transform(
                                  transform: Matrix4.translationValues(
                                      delayAnimation.value * width, 0, 0),
                                  child: Bouncing(
                                    onPressed: () {},
                                    child: Container(
                                      //height: 20,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blue,
                                      ),
                                      child: const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Request Leave",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    muchDeleyAnimation.value * width, 0, 0),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: Row(
                                    children: [
                                      Transform(
                                        transform: Matrix4.translationValues(
                                            muchDeleyAnimation.value * width,
                                            0,
                                            0),
                                        child: const Text(
                                          "Leave History",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Transform(
                                          transform: Matrix4.translationValues(
                                              delayAnimation.value * width,
                                              0,
                                              0),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: InkWell(
                                                  onTap: () async {},
                                                  child: const Text("See All",
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                      )))))
                                    ],
                                  ),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    muchDeleyAnimation.value * width, 0, 0),
                                child: Bouncing(
                                    child: const LevelHistoryCard(
                                        status: "using reason",
                                        adate: "1.10.2022",
                                        startDate: "16.10.2022",
                                        endDate: "17.10.22",
                                        reason: "Reason Is Very Simple"),
                                    onPressed: () {}),
                              )
                            ])))))));
  }
}
