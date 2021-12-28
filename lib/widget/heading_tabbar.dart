


import 'package:flutter/material.dart';

class HeadingsTabBar extends StatelessWidget {
  const HeadingsTabBar({
    Key? key,
    required TabController tabController, 
    // required this.text,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  // final String text;
  // String icon;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: [
        getTab('Transactions'),
        getTab('About'),
        getTab('Video'),
        getTab('Social'),
     
      ],
      indicator: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      isScrollable: true,
      unselectedLabelColor: Colors.red,
      labelColor: Colors.white,
      automaticIndicatorColorAdjustment: true,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 1.0),
    );
  }

  getTab(String title) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 35,
      // child: Center(
      //   child: Text(title),
      // ),
    );
  }
}
