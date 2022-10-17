import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  bool isMenuenabled;
  bool isNotificaton;
  final Function() ontap;
  CommonAppBar(
      {super.key,
      required this.title,
      this.isMenuenabled = true,
      this.isNotificaton = true,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: isMenuenabled == true
            ? IconButton(
                color: Colors.white,
                onPressed: ontap,
                icon: const Icon(
                  Icons.menu,
                ),
              )
            : null,
        actions: [
          isNotificaton == true
              ? InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.notifications,
                  ),
                )
              : const SizedBox(
                  width: 1,
                ),
        ],
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
