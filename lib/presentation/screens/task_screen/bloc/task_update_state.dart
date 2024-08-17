part of 'task_update_bloc.dart';

class TaskUpdateState extends Equatable {
  final bool isTaskDeleted;
  final bool isLoading;
  const TaskUpdateState({
    required this.isTaskDeleted,
    required this.isLoading,
  });

  TaskUpdateState copyWith({
    bool? isTaskDeleted,
    bool? isLoading,
  }) {
    return TaskUpdateState(
      isTaskDeleted: isTaskDeleted ?? this.isTaskDeleted,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory TaskUpdateState.initial() {
    return const TaskUpdateState(isLoading: false, isTaskDeleted: false);
  }

  @override
  List<Object> get props => [isLoading, isTaskDeleted];
}
