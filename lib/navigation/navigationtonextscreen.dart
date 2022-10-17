import 'package:flutter/material.dart';

navigationToNextScreen(BuildContext context, Widget nextScreen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => nextScreen));
}
