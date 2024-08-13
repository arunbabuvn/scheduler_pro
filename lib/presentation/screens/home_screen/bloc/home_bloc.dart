import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scheduler_pro/data/models/tasks.dart';
import 'package:scheduler_pro/data/repository/tasks_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeTaskChangeEvent>(_onTaskChanged);
    on<LoadTasksEvent>(_onLoadTasks);
  }

  void _onTaskChanged(HomeTaskChangeEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(taskIndex: event.taskIndex));
  }

  Future<void> _onLoadTasks(LoadTasksEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(taskLoading: true));
    try {
      List<Tasks> snapshot = await TasksRepository().getTasks();
      if (snapshot.isEmpty) {
        emit(state.copyWith(taskLoading: false, taskEmpty: true));
      }

      emit(state.copyWith(taskLoading: false, taskEmpty: false, tasks: snapshot));
    } catch (e) {
      emit(
        state.copyWith(
          taskLoading: false,
          taskLoadingFailed: true,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
