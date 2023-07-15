import 'package:flutter/material.dart';

class textWidget extends StatelessWidget {
  const textWidget({super.key, required this.text, required this.style});
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        textAlign: TextAlign.left,
        softWrap: false,
        overflow: TextOverflow.fade,
        style : style,
    );
  }
}
