import 'package:flutter/material.dart';

import '../../../config/constants.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
    required TabController? tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          decoration:  const BoxDecoration(
              border: Border(bottom: BorderSide( width:0,color: Colors.grey))),
          child: TabBar(
              isScrollable: true,
              controller: _tabController,
              labelStyle: const TextStyle(
                  fontSize: medium+2,
                  fontWeight: FontWeight.w500,
                  color: primaryColor),
              labelColor: primaryColor,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(
                  fontSize: medium+2,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
              indicator:  const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2, color: primaryColor),
                  insets: EdgeInsets.symmetric(horizontal: 0.0)),
              onTap: (index) {
                //To Do
              },
              tabs:  [
                SizedBox(width:MediaQuery.of(context).size.width/4,child:const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("About Item"),
                )),
                SizedBox(width:MediaQuery.of(context).size.width/2,child:const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Review"),
                )),

              ]),
        ),
      ),
    );
  }
}