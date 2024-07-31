import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduler_pro/presentation/screens/add_task_screen/add_task_screen.dart';
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
                  : (state.bottomNavigationIndex == 2 ? const AddTaskScreen() : Container()));
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
                onTap: (value) =>
                    context.read<NavigationBloc>().add(BottomNavigationItemSelected(bottomNavigationIndex: value)),
                items: [
                  BottomNavigationBarItem(
                    icon: state.bottomNavigationIndex == 0
                        ? const Icon(Icons.home, color: Colors.blue)
                        : const Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: state.bottomNavigationIndex == 1
                        ? const Icon(Icons.search, color: Colors.blue)
                        : const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: state.bottomNavigationIndex == 2
                        ? const Icon(Icons.add, color: Colors.blue)
                        : const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: state.bottomNavigationIndex == 3
                        ? const Icon(Icons.calendar_month, color: Colors.blue)
                        : const Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                          ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: state.bottomNavigationIndex == 4
                        ? const Icon(Icons.settings, color: Colors.blue)
                        : const Icon(
                            Icons.settings,
                            color: Colors.black,
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
