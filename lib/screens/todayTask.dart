import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager_codeclause/screens/taskTile.dart';
import 'package:task_manager_codeclause/screens/updateTask.dart';
import '../models/taskModel.dart';
import '../providers/todoProvider.dart';
import '../reusable/constants.dart';

class TodayTask extends ConsumerWidget {
  const TodayTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> listData = ref.watch(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listData
        .where((element) =>
            element.isCompleted == 0 && element.date!.contains(today))
        .toList();
    return ListView.builder(
        itemCount: todayList.length,
        itemBuilder: (context, index) {
          final data = todayList[index];
          bool isCompleted =
              ref.read(todoStateProvider.notifier).getStatus(data);
          dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
          return taskTile(
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
            },
            editWidgetIcon: GestureDetector(
              onTap: () {
                titles = data.title.toString();
                descs = data.desc.toString();
                Navigator.push(context, MaterialPageRoute(builder: (context) => updateTask(id : data.id!)));
              },
              child: const Icon(MaterialCommunityIcons.circle_edit_outline),
            ),
            title: data.title,
            color: color,
            desc: data.desc,
            start: data.startTime,
            end: data.endTime,
            switcher: Switch(
              value: isCompleted,
              onChanged: (value) {
                ref.read(todoStateProvider.notifier).markAsDone(
                    data.id ?? 0,
                    data.title.toString(),
                    data.desc.toString(),
                    1,
                    data.date.toString(),
                    data.startTime.toString(),
                    data.endTime.toString());
              },
            ),
          );
        });
  }
}
