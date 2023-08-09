import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: hintText,
      border: const OutlineInputBorder(borderSide: BorderSide.none));
}
