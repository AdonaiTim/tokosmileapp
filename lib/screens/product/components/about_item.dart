import 'package:flutter/material.dart';

import '../../../config/constants.dart';

class AboutItem extends StatelessWidget {
  final String label;
  final String content;
  const AboutItem({
    Key? key,
    required this.label,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children:  [
          Text(label,
            style: const TextStyle(fontSize: medium+2,
                fontWeight: FontWeight.w400, color: Colors.grey ),),
          const SizedBox(width: 10,),
          Text(content,
            style: const TextStyle(fontSize: medium+2,
                fontWeight: FontWeight.w600, color:blackColor ),),
        ],
      ),
    );
  }
}