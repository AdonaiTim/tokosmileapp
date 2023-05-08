import 'package:flutter/material.dart';

import '../../../config/constants.dart';

class ImageReview extends StatelessWidget {
  final int index;
  const ImageReview({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index == 0
          ? const EdgeInsets.only(right: 10, bottom: 10, top: 10)
          : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 80,
      width: 85,
      decoration: BoxDecoration(
        color: greybg,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
            colorFilter: index==3 ? ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.overlay) : null,
            image: AssetImage("assets/images/products/thumbnail${index}.png"),
            fit: BoxFit.cover),

      ),
      child: index == 3 ? const Center(child: Text("132+", style: TextStyle(fontWeight:FontWeight.bold, fontSize: medium, color: whiteColor),)) : const SizedBox.shrink(),
    );
  }
}
