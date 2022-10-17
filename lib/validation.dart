import 'package:flutter/material.dart';

bool validationandSava(GlobalKey<FormState> globalKey) {
  final from = globalKey.currentState;
  if (from!.validate()) {
    from.save();
    return true;
  }
  return false;
}
