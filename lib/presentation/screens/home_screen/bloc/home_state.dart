part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int taskIndex;
  final bool taskEmpty;
  final bool taskLoading;
  final bool taskLoadingFailed;
  final tasks;
  final String errorMessage;

  const HomeState({
    required this.taskIndex,
    required this.taskEmpty,
    required this.taskLoading,
    required this.taskLoadingFailed,
    required this.tasks,
    required this.errorMessage,
  });

  factory HomeState.initial() {
    return const HomeState(
      taskIndex: 0,
      taskEmpty: false,
      taskLoading: false,
      tasks: [],
      errorMessage: "Error",
      taskLoadingFailed: false,
    );
  }

  HomeState copyWith(
      {int? taskIndex, bool? taskEmpty, bool? taskLoading, tasks, String? errorMessage, bool? taskLoadingFailed}) {
    return HomeState(
      taskIndex: taskIndex ?? this.taskIndex,
      taskEmpty: taskEmpty ?? this.taskEmpty,
      taskLoading: taskLoading ?? this.taskLoading,
      tasks: tasks ?? this.tasks,
      errorMessage: errorMessage ?? this.errorMessage,
      taskLoadingFailed: taskLoadingFailed ?? this.taskLoadingFailed,
    );
  }

  @override
  List<Object> get props => [taskIndex, taskEmpty, taskLoading, tasks, errorMessage, taskLoadingFailed];
}
