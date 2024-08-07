part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeTaskChangeEvent extends HomeEvent {
  const HomeTaskChangeEvent({required this.taskIndex});
  final int taskIndex;

  @override
  List<Object> get props => [taskIndex];
}

class LoadTasksEvent extends HomeEvent {}
