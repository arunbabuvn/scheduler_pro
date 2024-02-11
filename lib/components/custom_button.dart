import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scheduler_pro/components/pixels.dart';
import 'package:scheduler_pro/components/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.buttonColor,
  });
  final Function() onTap;
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Pixels.screenWidth,
      height: Pixels.screenHeight * (60 / Pixels.figmaScreenHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: buttonColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Center(
              child: PrimaryText(
            child: text,
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          )),
        ),
      ),
    );
  }
}
