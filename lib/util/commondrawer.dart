import 'package:flutter/material.dart';

class CommonDrower extends StatelessWidget with PreferredSizeWidget {
  CommonDrower(
      {super.key,
      required this.title,
      required this.isMenuEnabled,
      required this.isNatificationEnabled,
      required this.ontap});
  final String title;
  final bool isMenuEnabled;
  final bool isNatificationEnabled;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      leading: isMenuEnabled == true
          ? IconButton(onPressed: (() => ontap), icon: const Icon(Icons.menu))
          : null,
      actions: [
        isNatificationEnabled == true
            ? InkWell(
                onTap: (() {}),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                // child: Image.asset(
                //   "image/notificatiots.png",
                //   height: 35,

                // child: const Icon(
                //   Icons.notifications,
                //   color: Colors.amber,
                //   size: 35,
              )
            : const SizedBox(
                width: 1,
              )
      ],
      centerTitle: true,
      backgroundColor: Colors.lightGreen,
      elevation: 0.0,
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
