import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_manager_codeclause/dataBase/helper.dart';
import 'package:task_manager_codeclause/models/taskModel.dart';

import '../reusable/constants.dart';
part 'todoProvider.g.dart';

@riverpod
class todoState extends _$todoState {
  @override
  List<TaskModel> build() {
    return [];
  }

  void refresh() async {
    final data = await dataBaseHelper.getItems();
    state = data.map((e) => TaskModel.fromJson(e)).toList();
  }

  void addItem(TaskModel task) async {
    await dataBaseHelper.createItem(task);
    refresh();
  }

  dynamic getRandomColor(){
    Random random = Random();
    int randomIndex = random.nextInt(colors.length);
    return colors[randomIndex];
  }

  void updateItem(int id, String title, String desc, int isCompleted,
      String date, String startTime, String endTime) async {
    await dataBaseHelper.updateItem(
        id, title, desc, isCompleted, date, startTime, endTime);
  }

  Future<void> deleteTodo(int id) async {
    await dataBaseHelper.deleteItem(id);
    refresh();
  }

  void markAsDone(int id, String title, String desc, int isCompleted,
      String date, String startTime, String endTime) async {
    await dataBaseHelper.updateItem(
        id, title, desc, 1, date, startTime, endTime);
    refresh();
  }

  String getToday() {
    DateTime today = DateTime.now();
    return today.toString().substring(0, 10);
  }

  String getTomorrow() {
    DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.toString().substring(0, 10);
  }

  List<String> last30days() {
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(const Duration(days: 30));
    List<String> dates = [];
    for (int i = 0; i < 30; i++) {
      DateTime date = oneMonthAgo.add(Duration(days: i));
      dates.add(date.toString().substring(0, 10));
    }
    return dates;
  }

  String getdayAfterTomorrow() {
    DateTime dayAftertomorrow = DateTime.now().add(const Duration(days: 2));
    return dayAftertomorrow.toString().substring(0, 10);
  }

  bool getStatus(TaskModel data){
    bool? isCompleted;
    if(data.isCompleted==1) {
      isCompleted=true;
    } else {
      isCompleted=false;
    }
    return isCompleted;
  }
}
