import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tokosmile/components/custom_btn.dart';
import 'package:tokosmile/components/reusable_text_field.dart';
import 'package:tokosmile/screens/home/components/carousel_dots.dart';
import 'package:tokosmile/screens/product/product_detail_page.dart';

import '../../config/constants.dart';
import 'components/category_carousel_widget.dart';
import 'components/discount_carousel_widget.dart';
import 'components/notification_item.dart';
import 'components/submenu.dart';
import 'components/submenu_widget.dart';
import '../../data/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController? _colorAnimationController;
  Animation? _colorTween;
  int currentTabIndex = 0;
  PageController? pageController;
  int index = 0;
  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      //print(scrollInfo.metrics.pixels);
      //print(scrollInfo.metrics.pixels/500);
      _colorAnimationController!.animateTo(scrollInfo.metrics.pixels / 100);
    }
    return true;
  }

  Timer? timer;

  //carousel widgets
  List<Widget> carousel = [
    const DiscountCarouselWidget(),
    const CategoryCarouselWidget()
  ];

  @override
  void initState() {
    super.initState();

    //configure animation
    pageController = PageController();
    _colorAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _colorTween = ColorTween(begin: Colors.transparent, end: whiteColor)
        .animate(_colorAnimationController!);

    //start timer
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (index < carousel.length - 1) {
        index++;
      } else {
        index = 0;
      }
      pageController!.animateToPage(
        index,
        duration: const Duration(milliseconds: 2000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    _colorAnimationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackgroundColor2,
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: _scrollListener,
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers:  [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 350,
                      child: PageView(
                          physics: const BouncingScrollPhysics(),
                          controller: pageController,
                          onPageChanged: (index) {
                            this.index = index;
                            setState(() {});
                          },
                          children: carousel),
                    ),
                  ),
                  SliverAppBar(
                    elevation: 0,
                    toolbarHeight:  Platform.isIOS ? 75:120,
                    collapsedHeight:  Platform.isIOS ? 75:120,
                    backgroundColor: pageBackgroundColor,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          SubMenu(),
                          const SizedBox(
                            height: 20,
                          ),
                          const CarouselDots(
                            count: 3,
                            alignment: MainAxisAlignment.center,
                            index: 0,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverAppBar(
                    elevation: 0,
                    toolbarHeight: Platform.isIOS ? 0:50,
                    collapsedHeight: Platform.isIOS ? 0:50,
                    backgroundColor: pageBackgroundColor2,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: pageBackgroundColor2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Best Sale Product", style: TextStyle(color: blackColor, fontWeight:FontWeight.w600,fontSize:medium+4),),
                                  Text("See more", style: TextStyle( color:primaryColor, fontWeight:FontWeight.w400,fontSize:medium+4),)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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
                          return  GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                return const ProductDetailPage();
                              }));
                            },
                            child: Column(
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
                              ),
                          );
                        },
                        childCount: 6,
                      ),
                    ),
                  ),
                ]),
          ),
          AnimatedBuilder(
              animation: _colorAnimationController!,
              builder: (context, child) => Container(
                    height: 150,
                    color: _colorTween!.value,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              Expanded(
                                  child: ReuseableTextField(
                                hintText: "Search",
                                color: Colors.transparent,
                                prefixIcon: const Icon(
                                  Iconsax.search_normal_1,
                                  size: iconSize,
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              const NotificationItem(
                                icon: Iconsax.bag_2,
                                text: "1",
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const NotificationItem(
                                icon: Iconsax.message,
                                text: "9+",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: BottomNavigationBar(
            backgroundColor: pageBackgroundColor,
            currentIndex: 0,
            onTap: pageChanged, //model.setTabIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.home_25,
                      color: currentTabIndex == 0 ? primaryColor : blackColor),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.ticket,
                      color: currentTabIndex == 1 ? primaryColor : blackColor),
                  label: "Voucer"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.wallet_3,
                    color: currentTabIndex == 2 ? primaryColor : blackColor,
                  ),
                  label: "Wallet"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Iconsax.setting,
                    color: currentTabIndex == 2 ? primaryColor : blackColor,
                  ),
                  label: "Settings"),
            ]),
      ),
    );
  }

  void pageChanged(int index) {
    setState(() {
      //currentTabIndex = index;
    });
  }
}


