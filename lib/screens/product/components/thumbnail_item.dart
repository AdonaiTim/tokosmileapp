import 'package:flutter/material.dart';

import '../../../config/constants.dart';

class thumbnail_item_widget extends StatelessWidget {
  final String image;
  const thumbnail_item_widget({
    Key? key, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 50,
      width: 50,
      decoration:  BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fitWidth
          )
      ),
    );
  }
}

