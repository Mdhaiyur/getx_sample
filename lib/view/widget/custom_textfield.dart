import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  String hint;
  bool isObscure;
  TextEditingController controller;
  TextInputType textInputType;
  int maxlines;
  Color fillColor;
  Color textColor;

  CustomTextField(
      {required this.hint,
      required this.controller,
      required this.textInputType,
      this.isObscure = false,
      this.maxlines = 1,
      this.fillColor = Colors.black87,
      this.textColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: textColor,
      obscureText: isObscure,
      keyboardType: textInputType,
      maxLines: maxlines,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(color: textColor, fontSize: 17)),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.white, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.white, width: 1)),
          filled: true,
          hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey[400], fontSize: 17)),
          hintText: hint,
          fillColor: fillColor),
    );
  }
}
