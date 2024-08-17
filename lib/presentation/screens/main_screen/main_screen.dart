import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduler_pro/core/theme/app_colors.dart';
import 'package:scheduler_pro/presentation/screens/add_task_screen/add_task_screen.dart';
import 'package:scheduler_pro/presentation/screens/calander_screen/calander_screen.dart';
import 'package:scheduler_pro/presentation/screens/home_screen/home_screen.dart';
import 'package:scheduler_pro/presentation/screens/main_screen/bloc/navigation_bloc.dart';
import 'package:scheduler_pro/presentation/screens/search_screen/search_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return state.bottomNavigationIndex == 0
              ? const HomeScreen()
              : (state.bottomNavigationIndex == 1
                  ? const SearchScreen()
                  : (state.bottomNavigationIndex == 2
                      ? const AddTaskScreen()
                      : (state.bottomNavigationIndex == 3 ? const CalanderScreen() : Container())));
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              return BottomNavigationBar(
                elevation: 0,
                currentIndex: state.bottomNavigationIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (value) => context.read<NavigationBloc>().add(
                      BottomNavigationItemSelected(
                        bottomNavigationIndex: value,
                      ),
                    ),
                items: [
                  BottomNavigationBarItem(
                    icon: state.bottomNavigationIndex == 0
                        ? Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.accentColor,
                            ),
                            child: Image.asset(
                              "assets/icons/home.png",
                              width: 18,
                              height: 20,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/icons/home.png",
                              width: 18,
                              height: 20,
                            ),
                          ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: state.bottomNavigationIndex == 1
                        ? Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.accentColor,
                            ),
                            child: Image.asset(
                              "assets/icons/search.png",
                              width: 25,
                              height: 26,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/icons/search.png",
                              width: 25,
                              height: 26,
                            ),
                          ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: state.bottomNavigationIndex == 2
                        ? Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.accentColor,
                            ),
                            child: Image.asset(
                              "assets/icons/add.png",
                              width: 18,
                              height: 20,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/icons/add.png",
                              width: 18,
                              height: 20,
                            ),
                          ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: state.bottomNavigationIndex == 3
                        ? Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.accentColor,
                            ),
                            child: Image.asset(
                              "assets/icons/calender.png",
                              width: 23,
                              height: 23,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/icons/calender.png",
                              width: 23,
                              height: 23,
                            ),
                          ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: state.bottomNavigationIndex == 4
                        ? Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.accentColor,
                            ),
                            child: Image.asset(
                              "assets/icons/settings.png",
                              width: 24,
                              height: 24,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/icons/settings.png",
                              width: 24,
                              height: 24,
                            ),
                          ),
                    label: "",
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
