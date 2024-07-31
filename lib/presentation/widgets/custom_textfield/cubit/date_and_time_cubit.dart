import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'date_and_time_state.dart';

class DateAndTimeCubit extends Cubit<DateAndTimeState> {
  DateAndTimeCubit() : super(DateAndTimeState.initial());

  void setDate(String date) {
    emit(state.copyWith(date: date));
  }

  void setTime(String time) {
    emit(state.copyWith(time: time));
  }
}
