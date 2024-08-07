part of 'add_task_bloc.dart';

sealed class AddTaskEvent extends Equatable {
  const AddTaskEvent();

  @override
  List<Object> get props => [];
}

class TaskPriority extends AddTaskEvent {
  final int priorityIndex;
  const TaskPriority({required this.priorityIndex});
  @override
  List<Object> get props => [priorityIndex];
}

class TaskData extends AddTaskEvent {
  final String title;
  final String location;
  final String date;
  final String startTime;
  final String endTime;
  final String description;
  const TaskData({
    required this.title,
    required this.location,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.description,
  });
  @override
  List<Object> get props => [title, location, date, startTime, endTime, description];
}

class TaskSubmit extends AddTaskEvent {}

class TaskAdded extends AddTaskEvent {}
