import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduler_pro/components/pixels.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
  });

  final String? hintText;
  final TextInputType? keyboardType;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Pixels.screenWidth * (16 / Pixels.figmaScreenWidth),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.inter(fontSize: 16),
        ),
      ),
    );
  }
}
