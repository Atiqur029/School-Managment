import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school_managment/main.dart';
import 'package:school_managment/navigation/navigationtonextscreen.dart';
import 'package:school_managment/page/SignUp/signup.dart';
import 'package:school_managment/page/homepage.dart';

import '../../validation.dart';
import '../../widget/customShowsnackbarmessege.dart';

class LogginPage extends StatefulWidget {
  final String title;
  const LogginPage({super.key, required this.title});

  @override
  State<LogginPage> createState() => _LogginPageState();
}

class _LogginPageState extends State<LogginPage>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayanimation, muchDelayanimation, leftCurve;
  late AnimationController animationController;
  bool isPasswordVisibled = false;
  TextEditingController emailcontrolar = TextEditingController();
  TextEditingController passwordControlar = TextEditingController();
  final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final _fromkey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    delayanimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));
    muchDelayanimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.8, 1.8, curve: Curves.fastOutSlowIn)));

    leftCurve = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut)));
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  visiblepassword() {
    setState(() {
      isPasswordVisibled = true;
      Future.delayed(const Duration(seconds: 3)).then((value) {
        setState(() {
          isPasswordVisibled = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    animationController.forward();

    return AnimatedBuilder(
        animation: animationController,
        builder: ((context, child) => Scaffold(
              body: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                behavior: HitTestBehavior.opaque,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Transform(
                          transform: Matrix4.translationValues(
                              animation.value * width, 0.0, 0.0),
                          child: Form(
                            key: _fromkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "School Managment Title",
                                  style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "Logg To Your App",
                                  style: TextStyle(
                                      fontSize: 44.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 44.0,
                                ),
                                TextFormField(
                                  controller: emailcontrolar,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Required Email ";
                                    } else if (!emailRegExp.hasMatch(value)) {
                                      return "Right Email Addres";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (value) {
                                    email = value!;
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "Enter Your Email Here",
                                      prefixIcon: Icon(Icons.email_outlined)),
                                ),
                                const SizedBox(
                                  height: 26,
                                ),
                                TextFormField(
                                  controller: passwordControlar,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Required Password";
                                    } else if (value.length < 6) {
                                      return "Password error";
                                    }

                                    return null;
                                  },
                                  obscureText: !isPasswordVisibled,
                                  onSaved: (value) {
                                    password = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Password here",
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: isPasswordVisibled
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility),
                                      onPressed: () {
                                        visiblepassword();
                                      },
                                    ),
                                  ),
                                ),

                                //       suffixIcon: IconButton(
                                //           onPressed: (() {
                                //             visiblepassword();
                                //           }),
                                //           icon: isPasswordVisibled
                                //               ? const Icon(Icons.visibility_off)
                                //               : const Icon(Icons.visibility))),
                                // ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Don't Remember Your Password",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        navigationToNextScreen(
                                            context, const SignUp());
                                      },
                                      child: const Text(
                                        "Registered",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 88,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: RawMaterialButton(
                                    splashColor: Colors.deepOrangeAccent,
                                    highlightColor: Colors.amber,
                                    fillColor: Colors.grey,
                                    hoverColor: Colors.red,
                                    focusColor: Colors.green,
                                    onPressed: () {
                                      if (validationandSava(_fromkey)) {
                                        saveEmailAndpassword();
                                        navigationToNextScreen(
                                            context, const HomePage());
                                      }
                                    },
                                    child: const Text(
                                      "Logg-in",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            )));
  }

  // void visiblepassword() {
  //   setState(() {
  //     isPasswordVisibled = true;
  //     Future.delayed(const Duration(seconds: 3)).then((value) {
  //       setState(() {
  //         isPasswordVisibled = false;
  //       });
  //     });
  //   });
  // }

  saveEmailAndpassword() async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: emailcontrolar.text, password: passwordControlar.text);

      // ignore: use_build_context_synchronously
      await CustomShowSnackbar(isWarning: false)
          .showMessege(context, "Sucessfully Logg in");
      // ignore: use_build_context_synchronously
      navigationToNextScreen(context, const HomePage());
      setState(() {
        emailcontrolar.text = "";
        passwordControlar.text = "";
      });
      // ignore: use_build_context_synchronously

    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        CustomShowSnackbar(isWarning: true)
            .showMessege(context, "user not Found");
      } else if (e.code == "Wrong-password") {
        CustomShowSnackbar(isWarning: true)
            .showMessege(context, "Wrong password");
      }
    }
  }
}
