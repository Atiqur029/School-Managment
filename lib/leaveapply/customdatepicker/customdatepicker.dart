// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChange;
  final String? Function(String?) onValidator;
  final Function(String?)? onSaved;
  final String title;

  const CustomDatePicker(
      {Key? key,
      this.controller,
      required this.onChange,
      required this.onValidator,
      required this.onSaved,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      style: const TextStyle(color: Colors.white),
      dateMask: 'dd/MM/yyyy',
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
      lastDate: DateTime(2200),
      controller: controller,
      calendarTitle: title,
      confirmText: "confirm",
      enableSuggestions: true,
      validator: onValidator,
      onChanged: onChange,
      onSaved: onSaved,
    );
  }
}
