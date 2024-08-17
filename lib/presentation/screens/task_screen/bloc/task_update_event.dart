part of 'task_update_bloc.dart';

sealed class TaskUpdateEvent extends Equatable {
  const TaskUpdateEvent();

  @override
  List<Object> get props => [];
}

class TaskDeleteEvent extends TaskUpdateEvent {
  final String docId;
  const TaskDeleteEvent({
    required this.docId,
  });
}
