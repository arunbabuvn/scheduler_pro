import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryText extends StatelessWidget {
  const PrimaryText({
    super.key,
    required this.child,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.height,
  });
  final String child;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      child,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
    );
  }
}
