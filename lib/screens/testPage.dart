import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager_codeclause/providers/codeProvider.dart';
import 'package:task_manager_codeclause/reusable/appStyle.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/reusable/textWidgets.dart';

class testPage extends ConsumerWidget {
  const testPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          children: [
            textWidget(
                text: code,
                style: appStyle(30, constApp.cLight, FontWeight.bold)),
            TextButton(onPressed: () {
              ref.read(codeStateProvider.notifier).setStart("Hello");
            }, child: const Text("Press me")),
          ],
        ),
      ),
    );
  }
}
