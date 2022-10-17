import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AttentdenceCard extends StatefulWidget {
  bool isAttendence;
  String startTime;
  String endtime;
  String subject;
  String staf;

  AttentdenceCard({
    Key? key,
    this.isAttendence = true,
    required this.startTime,
    required this.endtime,
    required this.subject,
    required this.staf,
  }) : super(key: key);

  @override
  State<AttentdenceCard> createState() => _AttentdenceCardState();
}

class _AttentdenceCardState extends State<AttentdenceCard>
    with SingleTickerProviderStateMixin {
  late Animation animation, deleyAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.3, 0.7, curve: Curves.fastOutSlowIn),
      ),
    );
    deleyAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.3, 0.7, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.height;
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: ((context, child) => Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Transform(
              transform:
                  Matrix4.translationValues(deleyAnimation.value * width, 0, 0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                decoration: BoxDecoration(
                  color: Colors.red,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.startTime,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.endtime,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.subject,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.staf,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.isAttendence == true
                              ? Colors.green
                              : Colors.red),
                      child: Center(
                        child: widget.isAttendence == true
                            ? const Text(
                                "P",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            : const Text(
                                "A",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
