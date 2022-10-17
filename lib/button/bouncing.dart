import 'package:flutter/material.dart';

class Bouncing extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const Bouncing({super.key, required this.child, required this.onPressed});

  @override
  State<Bouncing> createState() => _BouncingState();
}

class _BouncingState extends State<Bouncing>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
        lowerBound: 0.0,
        upperBound: 0.1);
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - animationController.value;
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        if (widget.onPressed != null) {
          animationController.forward();
        }
      },
      onPointerUp: (PointerUpEvent event) {
        if (widget.onPressed != null) {
          animationController.reverse();
          widget.onPressed!();
        }
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
