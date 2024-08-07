part of 'add_task_bloc.dart';

class AddTaskState extends Equatable {
  final int priorityIndex;
  final String title;
  final String location;
  final String date;
  final String startTime;
  final String endTime;
  final String description;
  final bool isSubmitting;
  final bool taskAdded;
  const AddTaskState({
    required this.priorityIndex,
    required this.title,
    required this.location,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.isSubmitting,
    required this.taskAdded,
  });

  AddTaskState copyWith({
    int? priorityIndex,
    String? title,
    String? location,
    String? date,
    String? startTime,
    String? endTime,
    String? description,
    bool? isSubmitting,
    bool? taskAdded,
  }) {
    return AddTaskState(
      priorityIndex: priorityIndex ?? this.priorityIndex,
      title: title ?? this.title,
      location: location ?? this.location,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      description: description ?? this.description,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      taskAdded: taskAdded ?? this.taskAdded,
    );
  }

  factory AddTaskState.initial() {
    return const AddTaskState(
      priorityIndex: 0,
      title: '',
      location: '',
      date: '',
      startTime: '',
      endTime: '',
      description: '',
      isSubmitting: false,
      taskAdded: false,
    );
  }

  @override
  List<Object> get props => [
        priorityIndex,
        title,
        location,
        date,
        startTime,
        endTime,
        description,
        isSubmitting,
        taskAdded,
      ];
}
