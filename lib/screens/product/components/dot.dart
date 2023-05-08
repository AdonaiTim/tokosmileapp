
import 'package:flutter/material.dart';

class dot extends StatelessWidget {
  const dot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: 5,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color:Colors.black38),
    );
  }
}
