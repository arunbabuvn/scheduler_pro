part of 'date_and_time_cubit.dart';

class DateAndTimeState extends Equatable {
  final String date;
  final String time;
  const DateAndTimeState({required this.date, required this.time});
  factory DateAndTimeState.initial() {
    return const DateAndTimeState(
      date: "MMM DD, YYYY",
      time: "00:00 AM",
    );
  }

  DateAndTimeState copyWith({String? date, String? time}) {
    return DateAndTimeState(
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  @override
  List<Object> get props => [date, time];
}
