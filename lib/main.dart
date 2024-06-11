import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduler_pro/components/pixels.dart';
import 'package:scheduler_pro/firebase_options.dart';
import 'package:scheduler_pro/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:scheduler_pro/services/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Pixels.init(context: context);
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            scaffoldBackgroundColor: const Color(0xFFFEFEFE),
            useMaterial3: true,
          ),
          routerConfig: appRoute,
        ),
      ),
    );
  }
}
