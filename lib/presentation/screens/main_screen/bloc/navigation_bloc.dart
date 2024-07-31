import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.initial()) {
    on<BottomNavigationItemSelected>(_onBottomNavigationItemSelected);
  }

  void _onBottomNavigationItemSelected(BottomNavigationItemSelected event, Emitter<NavigationState> emit) {
    emit(state.copyWith(bottomNavigationIndex: event.bottomNavigationIndex));
  }
}
