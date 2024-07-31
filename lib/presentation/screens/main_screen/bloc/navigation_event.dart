part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BottomNavigationItemSelected extends NavigationEvent {
  final int bottomNavigationIndex;
  BottomNavigationItemSelected({required this.bottomNavigationIndex});
  @override
  List<Object> get props => [bottomNavigationIndex];
}
