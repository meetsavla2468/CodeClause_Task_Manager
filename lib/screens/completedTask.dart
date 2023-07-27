import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager_codeclause/screens/taskTile.dart';
import '../models/taskModel.dart';
import '../providers/todoProvider.dart';

class completedTask extends ConsumerWidget {
  const completedTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> listData = ref.watch(todoStateProvider);
    List lastMonth = ref.read(todoStateProvider.notifier).last30days();
    var completedList = listData
        .where((element) =>
            element.isCompleted == 1 ||
            lastMonth.contains(element.date!.substring(0, 10)))
        .toList();
    return ListView.builder(
        itemCount: completedList.length,
        itemBuilder: (context, index) {
          final data = completedList[index];
          bool isCompleted =
              ref.read(todoStateProvider.notifier).getStatus(data);
          dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
          return taskTile(
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
            },
            editWidgetIcon: const SizedBox.shrink(),
            title: data.title,
            color: color,
            desc: data.desc,
            start: data.startTime,
            end: data.endTime,
            switcher: const Icon(AntDesign.checkcircle, color: Colors.green),
          );
        });
  }
}
