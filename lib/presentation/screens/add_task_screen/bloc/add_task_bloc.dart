import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scheduler_pro/data/repository/tasks_repository.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskState.initial()) {
    on<TaskPriority>(_onPriorityIndexChange);
    on<TaskData>(_onTaskData);
    on<TaskSubmit>(_onTaskSubmit);
    on<TaskAdded>(_onTaskAdded);
  }

  void _onPriorityIndexChange(TaskPriority event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(priorityIndex: event.priorityIndex));
  }

  void _onTaskData(TaskData event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(
      title: event.title,
      location: event.location,
      date: event.date,
      startTime: event.startTime,
      endTime: event.endTime,
      description: event.description,
    ));
  }

  void _onTaskAdded(TaskAdded event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(taskAdded: false, isSubmitting: false));
  }

  Future<void> _onTaskSubmit(TaskSubmit event, Emitter<AddTaskState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    await TasksRepository().addTask(
      state.title,
      state.location,
      state.date,
      state.startTime,
      state.endTime,
      state.priorityIndex == 0 ? "Low" : (state.priorityIndex == 1 ? "Medium" : "High"),
      state.description,
    );
    emit(state.copyWith(isSubmitting: false, taskAdded: true));
  }
}
