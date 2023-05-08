import 'package:flutter/material.dart';

import '../../../config/constants.dart';

class CarouselDots extends StatelessWidget {
  final MainAxisAlignment? alignment;
  final int? count;
  final int? index;
  const CarouselDots({
    Key? key, this.alignment, this.count, this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: alignment!,
        children: List<Widget>.generate(
            count!, (int currentindex) {
          return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 4,
              width: (currentindex == index) ? 20 : 4,
              margin: const EdgeInsets.symmetric(
                  horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: (currentindex == index)
                      ? blackColor
                      : Colors.black54));
        }));
  }
}
