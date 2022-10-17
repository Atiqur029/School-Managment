import 'package:flutter/material.dart';

class UserDetailsCard extends StatefulWidget {
  const UserDetailsCard({super.key});

  @override
  State<UserDetailsCard> createState() => _UserDetailsCardState();
}

class _UserDetailsCardState extends State<UserDetailsCard>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayAnimation, muchDelayAnimation, leftCurve;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    delayAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    muchDelayAnimation = muchDelayAnimation = Tween(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(
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
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 3),
          child: Container(
            alignment: const Alignment(0, 0),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 0),
              child: Container(
                height: height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 10, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimationHome(
                                muchDelayAnimation: muchDelayAnimation,
                                width: width),
                            studentsDetails(width)
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }

  Transform studentsDetails(double width) {
    return Transform(
      transform: Matrix4.translationValues(delayAnimation.value * width, 0, 0),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: (Colors.orange[500]),
                ),
                child: const Text(
                  "18191203029",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Atiqur Rahman",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Standard 12",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Section B",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AnimationHome extends StatelessWidget {
  const AnimationHome({
    Key? key,
    required this.muchDelayAnimation,
    required this.width,
  }) : super(key: key);

  final Animation muchDelayAnimation;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform:
          Matrix4.translationValues(muchDelayAnimation.value * width, 0, 0),
      child: const CircleAvatar(
        radius: 28,
        backgroundImage: AssetImage("image/home.jpg"),
      ),
    );
  }
}
