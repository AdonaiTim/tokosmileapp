import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tokosmile/config/constants.dart';
import 'package:tokosmile/data/data.dart';
import 'package:tokosmile/screens/home/components/notification_item.dart';
import 'package:unicons/unicons.dart';
import 'components/about_item.dart';
import 'components/auto_suggest.dart';
import 'components/description_item.dart';
import 'components/dot.dart';
import 'components/header.dart';
import 'components/image_reviews.dart';
import 'components/rating_bar.dart';
import 'components/tab_items.dart';
import 'components/thumbnail_item.dart';
import 'components/user_review_widget.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<Widget> getThumbnails(List<String> thumbnails) {
    List<Widget> thumb_nails = [];
    for (var i = 0; i < thumbnails.length; i++) {
      thumb_nails.add(thumbnail_item_widget(image: thumbnails[i]));
    }
    return thumb_nails;
  }

  List<String> suggestions = [
    "Product in good condition",
    "Very fast delivery",
    "Fast seller response"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackgroundColor,
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        height: 120,
        decoration: BoxDecoration(
          color: pageBackgroundColor2,
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.1),
              spreadRadius: 20,
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Total Price",
                  style: TextStyle(
                      fontSize: medium,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                Text(
                  "\$18.00",
                  style: TextStyle(
                      fontSize: medium + 10,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: primaryColor),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                    height: 70,
                    width: 250,
                    decoration: BoxDecoration(
                        color: darkprimaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 140,
                        ),
                        Text(
                          "Buy Now",
                          style: TextStyle(
                              fontSize: medium + 2,
                              fontWeight: FontWeight.w500,
                              color: whiteColor),
                        ),
                      ],
                    )),
                Container(
                    height: 70,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Iconsax.bag_2,
                          color: whiteColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: medium + 5,
                                fontWeight: FontWeight.w500,
                                color: whiteColor),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
      /*  Row(
          children: [
            Expanded(child: Container(
              decoration: const BoxDecoration(
                  color:primaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), topLeft: Radius.circular(5))
              ),
            )),
            Expanded(child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                color:primaryColor,
                //borderRadius: BorderRadius.circular(5)
              ),
            ))
          ],
        )*/
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              delegate: HeaderSliverAppBar(
                expandedHeight: 150,
              ),
              pinned: true,
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: greybg.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: getThumbnails(products[0].thumbnails!),
                            ),
                          ),
                        )
                            .animate()
                            .fadeIn(
                              begin: 0,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastOutSlowIn,
                            )
                            .slideY(
                              begin: 0.1,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastOutSlowIn,
                            ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Image.asset(
                              "assets/images/products/preview_img.png",
                              fit: BoxFit.cover,
                            ) .animate()
                                .fadeIn(
                              begin: 0,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastOutSlowIn,
                            )
                                .slideY(
                              begin: 0.1,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastOutSlowIn,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children:  [
                         const Icon(
                           Iconsax.shop,
                           color: Colors.grey,
                         ),
                         const SizedBox(
                           width: 10,
                         ),
                         const Text(
                           "Thrifting_Store",
                           style: TextStyle(
                               fontSize: medium,
                               fontWeight: FontWeight.w400,
                               color: Colors.grey),
                         ) .animate()
                             .fadeIn(
                           begin: 0,
                           duration: const Duration(milliseconds: 1000),
                           curve: Curves.fastOutSlowIn,
                         )
                             .slideY(
                           begin: 0.1,
                           duration: const Duration(milliseconds: 1000),
                           curve: Curves.fastOutSlowIn,
                         )
                       ],
                     ),
                     const SizedBox(
                       height: 20,
                     ),
                     Text(
                       products[0].desc!,
                       style: const TextStyle(
                           fontSize: medium + 8,
                           color: blackColor,
                           fontWeight: FontWeight.w500),
                     ),
                     const SizedBox(
                       height: 20,
                     ),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: const [
                         Icon(
                           Icons.star,
                           color: ratingColor,
                         ),
                         SizedBox(
                           width: 10,
                         ),
                         Text(
                           "4.9 Ratings",
                           style: TextStyle(
                               fontSize: medium + 3,
                               fontWeight: FontWeight.w400,
                               color: Colors.grey),
                         ),
                         SizedBox(
                           width: 18,
                         ),
                         dot(),
                         SizedBox(
                           width: 18,
                         ),
                         Text(
                           "2.3k Reviews",
                           style: TextStyle(
                               fontSize: medium + 3,
                               fontWeight: FontWeight.w400,
                               color: Colors.grey),
                         ),
                         SizedBox(
                           width: 18,
                         ),
                         dot(),
                         SizedBox(
                           width: 18,
                         ),
                         Text(
                           "2.9k Sold",
                           style: TextStyle(
                               fontSize: medium + 3,
                               fontWeight: FontWeight.w400,
                               color: Colors.grey),
                         ),
                       ],
                     ),
                   ],
                 ).animate()
                     .fadeIn(
                   begin: 0,
                   duration: const Duration(milliseconds: 1000),
                   curve: Curves.fastOutSlowIn,
                 )
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Tabs(tabController: _tabController)),

                  //To Do
                  // Connect this to Tab bar ontap
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AboutItem(
                                    label: "Brand:",
                                    content: "ChArmkpR",
                                  )
                                      .animate()
                                      .fadeIn(
                                        begin: 1,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastOutSlowIn,
                                      )
                                      .slideY(
                                        begin: 0.5,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastOutSlowIn,
                                      ),
                                  const AboutItem(
                                    label: "Category:",
                                    content: "Casual Shirt",
                                  )
                                      .animate()
                                      .fadeIn(
                                        begin: 0,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastOutSlowIn,
                                      )
                                      .slideY(
                                        begin: 0.5,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastOutSlowIn,
                                      ),
                                  const AboutItem(
                                    label: "Condition:",
                                    content: "New",
                                  )
                                      .animate()
                                      .fadeIn(
                                        begin: 0,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastOutSlowIn,
                                      )
                                      .slideY(
                                        begin: 0.5,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastOutSlowIn,
                                      ),
                                ],
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AboutItem(
                                    label: "Color:",
                                    content: "Aprikot",
                                  )
                                      .animate()
                                      .fadeIn(
                                        begin: 1,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastOutSlowIn,
                                      )
                                      .slideY(
                                        begin: 0.5,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastOutSlowIn,
                                      ),
                                  const AboutItem(
                                    label: "Material:",
                                    content: "Polyster",
                                  )
                                      .animate()
                                      .fadeIn(
                                        begin: 0,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastOutSlowIn,
                                      )
                                      .slideY(
                                        begin: 0.5,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastOutSlowIn,
                                      ),
                                  AboutItem(
                                    label: "Heavy:",
                                    content: "200g",
                                  )
                                      .animate()
                                      .fadeIn(
                                        begin: 0,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastOutSlowIn,
                                      )
                                      .slideY(
                                        begin: 0.5,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastOutSlowIn,
                                      ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: const [
                              Expanded(
                                  child: Divider(
                                      thickness: 0.5, color: Colors.grey)),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Description",
                            style: TextStyle(
                                fontSize: medium + 3,
                                fontWeight: FontWeight.w600,
                                color: blackColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                DescriptionItem(
                                  desc:
                                      "Long-sleeve dress shirt classic fit featuring button down collar",
                                ),
                                DescriptionItem(
                                  desc: "Patch Pocket on Left Chest",
                                ),
                                DescriptionItem(
                                  desc: "Durable Combination Cotton Fabric",
                                ),
                                DescriptionItem(
                                  desc: "Comfortable and quality Dress Shirt",
                                ),
                                DescriptionItem(
                                  desc:
                                      "Go To Classic button down shirt for all special occasions",
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.88,
                            child: const Text(
                              "Chat us if there is anything you need to ask about the product :)",
                              style: TextStyle(
                                  fontSize: medium + 2,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Text(
                                "See less",
                                style: TextStyle(
                                    fontSize: medium + 2,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Iconsax.arrow_up_2,
                                size: 20,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Expanded(
                                  child: Divider(
                                      thickness: 0.5, color: Colors.grey)),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Shippings Information:",
                            style: TextStyle(
                                fontSize: medium + 3,
                                fontWeight: FontWeight.w600,
                                color: blackColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              AboutItem(
                                label: "Delivery:",
                                content: "Shipping from Jakarta, Indonesia",
                              ),
                              AboutItem(
                                label: "Shipping:",
                                content: "FREE International Shipping",
                              ),
                              AboutItem(
                                label: "Arrive:",
                                content: "Estimated arrival on 25-27 Oct 2022",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Expanded(
                                  child: Divider(
                                      thickness: 0.5, color: Colors.grey)),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Seller Information:",
                            style: TextStyle(
                                fontSize: medium + 3,
                                fontWeight: FontWeight.w600,
                                color: blackColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: const [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: greybg,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: Center(
                                        child: Text(
                                          "Thrifting Store.",
                                          style: TextStyle(
                                              fontSize: medium - 2,
                                              fontWeight: FontWeight.w700,
                                              color: blackColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: pageBackgroundColor,
                                      radius: 12,
                                      child: CircleAvatar(
                                        radius: 6,
                                        backgroundColor: greybg,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Thrifting_Store",
                                    style: TextStyle(
                                        fontSize: medium + 5,
                                        fontWeight: FontWeight.w600,
                                        color: blackColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        "Active 5 Min ago",
                                        style: TextStyle(
                                            fontSize: medium - 2,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        " | ",
                                        style: TextStyle(
                                            fontSize: medium - 2,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "96.7% Positive Feedback",
                                        style: TextStyle(
                                            fontSize: medium - 2,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border:
                                            Border.all(color: primaryColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Iconsax.shop,
                                            color: primaryColor,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Visit store",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: medium - 2,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: const [
                              Expanded(
                                  child: Divider(
                                      thickness: 0.5, color: Colors.grey)),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Reviews & Ratings",
                            style: TextStyle(
                                fontSize: medium + 3,
                                fontWeight: FontWeight.w600,
                                color: blackColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                            fontSize: large + 10,
                                            fontWeight: FontWeight.w600,
                                            color: blackColor),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 12),
                                        child: Text(
                                          " / 5.0",
                                          style: TextStyle(
                                              fontSize: medium,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.star_rounded,
                                        color: ratingColor,
                                      ),
                                      Icon(
                                        Icons.star_rounded,
                                        color: ratingColor,
                                      ),
                                      Icon(
                                        Icons.star_rounded,
                                        color: ratingColor,
                                      ),
                                      Icon(
                                        Icons.star_rounded,
                                        color: ratingColor,
                                      ),
                                      Icon(
                                        Icons.star_half_rounded,
                                        color: ratingColor,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  const Text(
                                    "2.3k Reviews",
                                    style: TextStyle(
                                        fontSize: medium,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      RatingBar(
                                        rating: "5",
                                        total: "1.5k",
                                        percent: 0.85,
                                      ),
                                      RatingBar(
                                        rating: "4",
                                        total: "710",
                                        percent: 0.50,
                                      ),
                                      RatingBar(
                                        rating: "3",
                                        total: "140",
                                        percent: 0.15,
                                      ),
                                      RatingBar(
                                        rating: "2",
                                        total: "10",
                                        percent: 0.08,
                                      ),
                                      RatingBar(
                                        rating: "1",
                                        total: "4",
                                        percent: 0.01,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Reviews with images & videos",
                            style: TextStyle(
                                fontSize: medium + 3,
                                fontWeight: FontWeight.w600,
                                color: blackColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return ImageReview(
                                    index: index,
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Expanded(
                                  child: Divider(
                                      thickness: 0.5, color: Colors.grey)),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Top Reviews",
                                    style: TextStyle(
                                        fontSize: medium + 3,
                                        fontWeight: FontWeight.w600,
                                        color: blackColor),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Showing 3 of 2.3k+ reviews",
                                    style: TextStyle(
                                        fontSize: medium,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Container(
                                height: 45,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: pageBackgroundColor2,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(width: 2, color: greybg)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Popular",
                                        style: TextStyle(
                                            fontSize: medium,
                                            fontWeight: FontWeight.w600,
                                            color: blackColor),
                                      ),
                                      Icon(
                                        Iconsax.arrow_down_14,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          UserReviewWidget(suggestions: suggestions),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: const [
                              Expanded(
                                  child: Divider(
                                      thickness: 0.5, color: Colors.grey)),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          UserReviewWidget(suggestions: suggestions),
                          const SizedBox(height: 20,),
                          Row(
                            children: const [
                              Expanded(
                                  child: Divider(
                                      thickness: 0.5, color: Colors.grey)),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor:greybg,
                                    child: Center(child: Icon(UniconsLine.angle_left, color: blackColor, size: 25,)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                          fontSize: medium ,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          color: primaryColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                          fontSize: medium ,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          color: blackColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      "3",
                                      style: TextStyle(
                                          fontSize: medium ,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          color: blackColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      ".......",
                                      style: TextStyle(
                                          fontSize: medium ,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          color: blackColor),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor:whiteColor,
                                    child: Center(child: Icon(UniconsLine.angle_right, color: blackColor, size: 25,)),
                                  ),
                                ],
                              ),
                              Text(
                                "See more",
                                style: TextStyle(
                                    fontSize: medium ,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor),
                              ),
                            ],
                          ),
                          const SizedBox(height: 60,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Recommendation",
                                style: TextStyle(
                                    fontSize: medium + 3,
                                    fontWeight: FontWeight.w600,
                                    color: blackColor),
                              ),
                              Text(
                                "See more",
                                style: TextStyle(
                                    fontSize: medium ,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,
                  childAspectRatio: 200/280,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child:Container(
                              decoration:  BoxDecoration(
                                  color: greybg,
                                  image: DecorationImage(
                                    image: AssetImage(products[index].image!),
                                    fit: BoxFit.cover,
                                  )
                              ),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: products[index].isFav! ? const Icon( Iconsax.heart5, color: primaryHighlightColor,) :const Icon(
                                        Iconsax.heart),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                            child:Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10,),
                                  Text(products[index].category!, style:  const TextStyle(fontSize:medium,
                                      fontWeight: FontWeight.w400,
                                      color:Colors.black38),),
                                  Text(products[index].desc!, style:  const TextStyle(fontSize:medium,
                                      fontWeight: FontWeight.w600,
                                      color:blackColor),),
                                  const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children:  [
                                          const Icon(Icons.star, size: 16, color: ratingColor,),
                                          Text("${products[index].rating.toString()!} | ${products[index].total_ratings!}", style:  const TextStyle(fontSize:medium-2,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Montserrat",
                                              color:Colors.black38),),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("\$${products[index].price.toString()!}", style:  const TextStyle(fontSize:medium+8,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Montserrat",
                                              color:primaryColor)),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))
                      ],
                    );
                  },
                  childCount: 2,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
