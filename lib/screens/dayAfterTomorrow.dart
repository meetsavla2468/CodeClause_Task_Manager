import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/screens/taskTile.dart';
import 'package:task_manager_codeclause/screens/updateTask.dart';
import '../providers/expansionProvider.dart';
import '../providers/todoProvider.dart';
import '../reusable/expansionTile.dart';

class dayAfterTomorrowTask extends ConsumerWidget {
  const dayAfterTomorrowTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos1 = ref.watch(todoStateProvider);
    final color = ref.read(todoStateProvider.notifier).getRandomColor();
    String dayAfterTomorrow = ref.read(todoStateProvider.notifier).getdayAfterTomorrow();
    var dayAfterTomorrowTasks = todos1.where((element) => element.date!.contains(dayAfterTomorrow));
    return expansionTile(
        text: DateTime.now()
            .add(const Duration(days: 2))
            .toString()
            .substring(5, 10),
        text2: "Day after tomorrow's task are \nshown here",
        onExpansionChanged: (bool expanded) {
          ref
              .read(expansionState0Provider.notifier)
              .setStart(!expanded);
        },
        trailing: Padding(
          padding: EdgeInsets.only(right: 12.0.w, top: 20.h),
          child: ref.watch(expansionState0Provider)
              ? const Icon(AntDesign.circledown,
              color: constApp.cDark)
              : const Icon(AntDesign.closecircleo,
              color: constApp.cBlueLight),
        ),
        children: [
          for(final todo in dayAfterTomorrowTasks)
            taskTile(
              delete: () {
                ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
              },
              editWidgetIcon: GestureDetector(
                onTap: () {
                  titles = todo.title.toString();
                  descs = todo.desc.toString();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => updateTask(id : todo.id!)));
                },
                child: const Icon(MaterialCommunityIcons.circle_edit_outline),
              ),
              title: todo.title,
              desc: todo.desc,
              color: color,
              start: todo.startTime,
              end: todo.endTime,
              switcher: const SizedBox.shrink(),
            ),
        ]);
  }
}
