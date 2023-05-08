import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/constants.dart';
import 'carousel_dots.dart';

class DiscountCarouselWidget extends StatelessWidget {
  const DiscountCarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        color: CupertinoColors.systemGrey5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  const Text(
                    "#FASHION DAY",
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "80% OFF",
                    style: TextStyle(
                        fontSize: large,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                      width: 180,
                      child: Text(
                        "Discover fashion that suits to your style",
                        style: TextStyle(
                            fontWeight:
                            FontWeight.w400),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius:
                        BorderRadius.circular(5)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Center(
                          child: Text(
                            "Check this out",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 12,
                                fontWeight:
                                FontWeight.bold),
                          )),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CarouselDots(
                        alignment: MainAxisAlignment.end,
                        count: 3,
                        index: 0,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Image.asset(
                      "assets/images/specials/image0.png",
                      height: 150,
                    ),
                  ],
                )),
          ],
        ));
  }
}
