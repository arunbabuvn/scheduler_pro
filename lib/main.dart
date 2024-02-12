import 'package:flutter/material.dart';
import 'package:scheduler_pro/components/pixels.dart';
import 'package:scheduler_pro/screens/intro_screen.dart';
import 'package:scheduler_pro/services/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Pixels.init(context: context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xFFFEFEFE),
        useMaterial3: true,
      ),
      routerConfig: appRoute,
    );
  }
}
