import 'dart:collection';

import 'package:flutter/material.dart';

class AnimatedProgressbar extends StatelessWidget {
  final double value;
  final double height;

  const AnimatedProgressbar({ Key? key, required this.value, this.height = 12 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //LayouBuilder useful when you are not sure size the widget should be when you build it
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints box) {
        return Container(
          padding:  const EdgeInsets.all(10),
          width: box.maxWidth,
        );
      },
    );
  }
}