import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../config/constants.dart';
import 'auto_suggest.dart';

class UserReviewWidget extends StatelessWidget {
  const UserReviewWidget({
    Key? key,
    required this.suggestions,
  }) : super(key: key);

  final List<String> suggestions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Row(
              children: const [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage("assets/images/portrait1.jpeg"),
                ),
                SizedBox(width: 10,),
                Text(
                  "Eren",
                  style: TextStyle(
                      fontSize: medium,
                      fontWeight: FontWeight.w600,
                      color: blackColor),
                ),
                SizedBox(width: 10,),
                Text(
                  "Y****r",
                  style: TextStyle(
                      fontSize: medium,
                      fontWeight: FontWeight.w600,
                      color: blackColor),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.star, color: ratingColor,),
                SizedBox(width: 10,),
                Text(
                  "5.0",
                  style: TextStyle(
                      fontSize: medium+2,
                      fontWeight: FontWeight.w600,
                      color: blackColor),
                ),
                SizedBox(width: 10,),
                Icon(Iconsax.more, size: 20,)
              ],
            )
          ],
        ),
        const SizedBox(height: 20,),
        SizedBox(
          height: 30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return AutoSuggest(
                  content: suggestions[index],
                );
              }),
        ),
        const SizedBox(height: 20,),
        const Text(
          "According to my expectations. This is the best. Thank you.",
          style: TextStyle(
              fontSize: medium+2.5,
              fontWeight: FontWeight.w400,
              color: blackColor),
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Iconsax.like_15, size: 20, color: primaryColor,),
                SizedBox(width: 20,),
                Text(
                  "Helpful ?",
                  style: TextStyle(
                      fontSize: medium,
                      fontWeight: FontWeight.w600,
                      color: primaryColor),
                ),
              ],
            ),
            const Text(
              "Yesterdays",
              style: TextStyle(
                  fontSize: medium,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}