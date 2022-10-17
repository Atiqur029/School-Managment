// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomShowSnackbar {
  final bool isWarning;
  CustomShowSnackbar({
    required this.isWarning,
  });

  showMessege(BuildContext context, String messege) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(messege,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
      backgroundColor: isWarning ? Colors.red : Colors.green,
    ));
  }
}
