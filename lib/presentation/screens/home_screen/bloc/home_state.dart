part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int taskIndex;
  const HomeState({required this.taskIndex});

  factory HomeState.initial(){
    return const HomeState(taskIndex: 0);
  }

  HomeState copyWith({int? taskIndex}) {
    return HomeState(taskIndex: taskIndex ?? this.taskIndex);
  }

  @override
  List<Object> get props => [taskIndex];
}
