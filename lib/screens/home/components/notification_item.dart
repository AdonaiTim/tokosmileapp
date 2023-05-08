import 'package:flutter/material.dart';

import '../../../config/constants.dart';

class NotificationItem extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const NotificationItem({
    Key? key, this.icon, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          icon!,
          size: iconSizeMedium,
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            padding: const EdgeInsets.symmetric(
                horizontal: 5),
            decoration: BoxDecoration(
                color: primaryHighlightColor,
                borderRadius:
                BorderRadius.circular(5)),
            child:  Center(
              child: Text(
                "${text}",
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: whiteColor),
              ),
            ),
          ),
        )
      ],
    );
  }
}

