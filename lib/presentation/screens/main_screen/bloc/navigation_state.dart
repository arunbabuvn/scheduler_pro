part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  final int bottomNavigationIndex;
  const NavigationState({required this.bottomNavigationIndex});

  factory NavigationState.initial() {
    return const NavigationState(bottomNavigationIndex: 0);
  }

  NavigationState copyWith({int? bottomNavigationIndex}) {
    return NavigationState(
      bottomNavigationIndex: bottomNavigationIndex ?? this.bottomNavigationIndex,
    );
  }

  @override
  List<Object> get props => [bottomNavigationIndex];
}
