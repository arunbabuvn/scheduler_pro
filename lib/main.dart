import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scheduler_pro/core/theme/app_theme.dart';
import 'package:scheduler_pro/firebase_options.dart';
import 'package:scheduler_pro/presentation/screens/home_screen/bloc/home_bloc.dart';
import 'package:scheduler_pro/presentation/screens/main_screen/bloc/navigation_bloc.dart';
import 'package:scheduler_pro/presentation/routes/router.dart';
import 'package:scheduler_pro/presentation/screens/signin_screen/bloc/signin_bloc.dart';
import 'package:scheduler_pro/presentation/widgets/custom_textfield/cubit/date_and_time_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SigninBloc(
            firebaseAuth: FirebaseAuth.instance,
          ),
        ),
        BlocProvider(create: (context) => NavigationBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        // BlocProvider(create: (context) => DateAndTimeCubit())
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          routerConfig: appRoute,
        ),
      ),
    );
  }
}
