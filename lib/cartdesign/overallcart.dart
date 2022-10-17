import 'package:flutter/material.dart';

class OverAllAttendenceCard extends StatefulWidget {
  final String date;
  final String day;
  final bool isfirstHalf;
  final bool issecondHalf;
  const OverAllAttendenceCard(
      {super.key,
      required this.date,
      required this.day,
      required this.isfirstHalf,
      required this.issecondHalf});

  @override
  State<OverAllAttendenceCard> createState() => _OverAllAttendenceCardState();
}

class _OverAllAttendenceCardState extends State<OverAllAttendenceCard>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: 5.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    delayAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    return AnimatedBuilder(
        animation: animationController,
        builder: ((context, child) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.date,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          widget.day,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Morning Half",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Afternoon Half",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.isfirstHalf == true
                                  ? (Colors.green)
                                  : Colors.red),
                          child: Center(
                              child: widget.isfirstHalf == true
                                  ? const Text(
                                      "p",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  : const Text("A",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.issecondHalf == true
                                  ? (Colors.green)
                                  : Colors.red),
                          child: Center(
                              child: widget.issecondHalf == true
                                  ? const Text(
                                      "P",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  : const Text("A",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
