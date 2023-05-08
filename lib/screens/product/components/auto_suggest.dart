import 'package:flutter/material.dart';

import '../../../config/constants.dart';

class AutoSuggest extends StatelessWidget {
  final String content;
  const AutoSuggest({
    Key? key, required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 30,
      decoration:  BoxDecoration(
          color: primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: primaryColor)
      ),
      child:  Text(content, style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: primaryColor
      ),),
    );
  }
}