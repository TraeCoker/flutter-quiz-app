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
          //widgets on top of eachother, first is on bottom
          child: Stack(
            children: [
              Container(
                height: height,
                //Progress bar background
                decoration: BoxDecoration(
                  color:  Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(height),
                  )
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                height: height,
                width: box.maxWidth * _floor(value),
                decoration: BoxDecoration(
                  color: _colorGen(value),
                  borderRadius: BorderRadius.all(
                    Radius.circular(height),
                  )
                )
              )
            ],
          ),
        );
      },
    );
  }

    ///Always round negative or NaNs to min value
  _floor(double value, [min = 0.0]) {
    return value.sign <= min ? min : value;
  }

  _colorGen(double value) {
    int rbg = (value * 255).toInt();
    return Colors.deepOrange.withGreen(rbg).withRed(255 - rbg );
  }

}



