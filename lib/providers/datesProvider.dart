import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'datesProvider.g.dart';

@riverpod
class datesState extends _$datesState {
  @override
  String build() {
    return "";
  }

  void setDate(String newState) {
    state = newState;
  }
}

@riverpod
class startTimeState extends _$startTimeState {
  @override
  String build() {
    return "";
  }

  void setStartTime(String newState) {
    state = newState;
  }

  List<int> dates(DateTime startDate) {
    DateTime now = DateTime.now();
    Duration difference = startDate.difference(now);
    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;
    return [days, hours, minutes, seconds];
  }
}

@riverpod
class finishTimeState extends _$finishTimeState {
  @override
  String build() {
    return "";
  }

  void setFinishTime(String newState) {
    state = newState;
  }
}
