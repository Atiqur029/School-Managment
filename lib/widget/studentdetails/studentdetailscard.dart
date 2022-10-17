import 'package:flutter/material.dart';

class UserDetailsCard extends StatefulWidget {
  const UserDetailsCard({super.key});

  @override
  State<UserDetailsCard> createState() => _UserDetailsCardState();
}

class _UserDetailsCardState extends State<UserDetailsCard>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation, deleyAnimation, muchDelayAnimation, leftCurve;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    deleyAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.2, 0.5, curve: Curves.fastOutSlowIn)));

    muchDelayAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: ((context, child) => Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 10, 3),
            child: Container(
              alignment: const Alignment(0, 0),
              padding: const EdgeInsets.only(top: 10, right: 0.0),
              child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    height: height * .17,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform(
                                transform: Matrix4.translationValues(
                                    muchDelayAnimation.value * width, 0, 0),
                                child: const Center(
                                  child: CircleAvatar(
                                    radius: 28,
                                    backgroundImage:
                                        AssetImage("image/home.jpg"),
                                  ),
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(
                                    muchDelayAnimation.value * width, 0, 0),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: Colors.orange[50],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Text(
                                            "18191203029",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Atiqur Rahman",
                                          style: TextStyle(
                                              fontSize: 21,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                "Standard 12",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Section B",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          )),
    );
  }
}
