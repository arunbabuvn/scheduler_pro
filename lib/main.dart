import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduler_pro/core/theme/app_theme.dart';
import 'package:scheduler_pro/firebase_options.dart';
import 'package:scheduler_pro/presentation/routes/router.dart';
import 'package:scheduler_pro/presentation/screens/add_task_screen/bloc/add_task_bloc.dart';
import 'package:scheduler_pro/presentation/screens/auth_screens/bloc/auth_bloc.dart';
import 'package:scheduler_pro/presentation/screens/main_screen/bloc/navigation_bloc.dart';

Future<void> main() async {
  // Ensure that the Flutter binding is initialized before any Flutter specific code.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase for the application.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the main application widget which sets up the BLoC providers.
  runApp(const AppProviders());
}

/// A widget that provides all the necessary BLoCs to the widget tree.
class AppProviders extends StatelessWidget {
  const AppProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => NavigationBloc()),
        BlocProvider(create: (context) => AddTaskBloc()),
      ],
      child: const MyApp(),
    );
  }
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive UI design.
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      // The builder provides the context and a child widget.
      // We return the MaterialApp.router here.
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Scheduler Pro',
        theme: AppTheme.lightTheme,
        routerConfig: appRoute,
      ),
    );
  }
}
