import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unicons/unicons.dart';

import '../../../config/constants.dart';
import '../../home/components/notification_item.dart';

class HeaderSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  HeaderSliverAppBar({
    required this.expandedHeight,
  });

  //HeaderSliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: pageBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children:  [
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: const Icon(Iconsax.arrow_left_2)
              ),
              Row(
                children:  const [
                  Icon(Iconsax.heart),
                  SizedBox(width: 25,),
                  Icon( UniconsLine.share_alt,size: 27,),
                  SizedBox(width: 25,),
                  NotificationItem(
                    icon: Iconsax.bag_2,
                    text: "1",
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
