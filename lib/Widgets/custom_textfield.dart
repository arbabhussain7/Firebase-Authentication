import 'package:firebase/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  CustomTextfield({
    super.key,
    required this.controller,
    this.suffixIcons,
    required this.hinttext,
    this.obscureText = false,
    this.isPassword = false,
    this.secureText = false,
    this.inputType = TextInputType.text,
    this.validator,
  });

  final TextEditingController controller;
  IconData? suffixIcons;
  final String hinttext;
  bool isPassword;
  bool secureText;
  bool obscureText;
  final TextInputType inputType;
  final String? Function(String?)? validator;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.montserrat(
          fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff0A1828)),
      controller: widget.controller,
      keyboardType: widget.inputType,
      obscureText: widget.obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
          hintText: widget.hinttext,
          hintStyle:
              GoogleFonts.montserrat(fontSize: 12.sp, color: Color(0xff989898)),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.secureText = !widget.secureText;
                      widget.obscureText = !widget.obscureText;
                    });
                    print(widget.secureText);
                  },
                  child: widget.secureText
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                )
              : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.r),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.1))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.r),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.1))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.r),
              borderSide: BorderSide(color: orangeColor))),
    );
  }
}
