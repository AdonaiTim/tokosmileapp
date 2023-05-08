import 'package:flutter/material.dart';

import '../../../config/constants.dart';
import 'dot.dart';

class DescriptionItem extends StatelessWidget {
  final String desc;
  const DescriptionItem({
    Key? key,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: dot(),
          ),
          const SizedBox(width: 5,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.83,
            child:  Text(desc,
              style: const TextStyle(fontSize: medium+2,
                  fontWeight: FontWeight.w400, color: Colors.grey ),),
          ),
        ],
      ),
    );
  }
}

