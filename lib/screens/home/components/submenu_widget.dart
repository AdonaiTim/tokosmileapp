import 'package:flutter/material.dart';

import '../../../config/constants.dart';

class SubMenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  const SubMenuTile({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black12.withOpacity(0.04)
          ),
          child: Icon(icon),
        ),
        const SizedBox(height: 10,),
        Text("${label}", style: const TextStyle(fontSize:medium-1, fontWeight: FontWeight.w300, color: blackColor),)
      ],
    );
  }
}



