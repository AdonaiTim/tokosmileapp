import 'package:flutter/material.dart';

import '../../../config/constants.dart';

class RatingBar extends StatelessWidget {
  final String rating;
  final String total;
  final double percent;
  const RatingBar({
    Key? key, required this.rating, required this.total, required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children:  [
          const Icon(Icons.star_rounded, color: ratingColor,),
          const SizedBox(width: 5,),
          Text(
            rating,
            style: const TextStyle(
                fontSize: medium,
                fontWeight: FontWeight.w500,
                color: Colors.grey),
          ),
          const SizedBox(width: 15,),
          Stack(
            children: [
              Container(
                height: 12,
                width: 150,
                decoration: BoxDecoration(
                    color: greybg,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              Container(
                height: 12,
                width: 150 * percent,
                decoration: BoxDecoration(
                    color: ratingColor2,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ],
          ),
          const SizedBox(width: 15,),
          Text(
            total,
            style: const TextStyle(
                fontSize: medium,
                fontWeight: FontWeight.w600,
                color:blackColor),
          ),

        ],
      ),
    );
  }
}