import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scheduler_pro/data/repository/tasks_repository.dart';

part 'task_update_event.dart';
part 'task_update_state.dart';

class TaskUpdateBloc extends Bloc<TaskUpdateEvent, TaskUpdateState> {
  TaskUpdateBloc() : super(TaskUpdateState.initial()) {
    on<TaskDeleteEvent>(_onTaskDeleted);
  }
  void _onTaskDeleted(TaskDeleteEvent event, Emitter<TaskUpdateState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await TasksRepository().deleteTask(event.docId);
      emit(state.copyWith(isTaskDeleted: true, isLoading: false));
    } catch (e) {
      print(e);
    }
  }
}
