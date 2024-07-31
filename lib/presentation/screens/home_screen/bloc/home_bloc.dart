import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeTaskChangeEvent>(_onTaskChanged);
  }

  void _onTaskChanged(HomeTaskChangeEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(taskIndex: event.taskIndex));
  }
}
