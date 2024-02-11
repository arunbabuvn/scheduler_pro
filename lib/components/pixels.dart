import 'package:flutter/material.dart';

class Pixels {
  static void init({required context}) {
    figmaScreenWidth = 393;
    figmaScreenHeight = 852;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  static late double screenWidth;
  static late double screenHeight;
  static late double figmaScreenWidth;
  static late double figmaScreenHeight;
}
