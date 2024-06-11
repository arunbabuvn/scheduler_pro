import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduler_pro/components/pixels.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  final String? hintText;
  final TextInputType? keyboardType;
  bool obscureText;
  final TextEditingController? controller;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF5F5F7),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(fontSize: 16),
      ),
    );
  }
}
