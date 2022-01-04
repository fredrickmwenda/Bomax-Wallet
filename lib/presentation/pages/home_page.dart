import 'package:bodax_wallet/presentation/pages/news_page.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'balance_page.dart';
import 'coin_list_page.dart';

import 'profile_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> _pages = [
    const BalancePage(),
    const CoinListPage(),
    const NewsPage(),
    const ProfilePageBody()
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _pos = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var deviceType = getDeviceType(size);
    final isDesktop = (deviceType == DeviceScreenType.desktop) &&
        ScreenUtil().orientation == Orientation.landscape;
    return Scaffold(
      bottomNavigationBar: isDesktop
          ? null
          : _BottomNavigationBar(
              onTap: (pos) {
                setState(() {
                  _pos = pos;
                });
              },
            ),
      backgroundColor: const Color(0xDA000000),
      body: isDesktop
          ? CollapsibleSidebar(
              items: [
                CollapsibleItem(
                  text: 'My balances',
                  icon: Icons.home_filled,
                  onPressed: () {
                    setState(() {
                      _pos = 0;
                    });
                  },
                  isSelected: _pos == 0,
                ),
                CollapsibleItem(
                    text: 'Prices',
                    icon: Icons.equalizer,
                    onPressed: () {
                      setState(() {
                        _pos = 1;
                      });
                    },
                    isSelected: _pos == 1),
                CollapsibleItem(
                    text: 'Profile',
                    icon: Icons.person,
                    onPressed: () {
                      setState(() {
                        _pos = 2;
                      });
                    },
                    isSelected: _pos == 2),
              ],
              body: Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: widget._pages[_pos],
              ),
              avatarImg: const AssetImage('assets/profile.jpeg'),
              backgroundColor: Colors.white,
              title: 'Fredrick Mwenda',
              selectedIconColor: const Color(0XFFF01FFB2),
              selectedTextColor: const Color(0XFFF01FFB2),
              unselectedTextColor: Colors.black87,
              textStyle: TextStyle(fontSize: 26.sp),
              titleStyle: TextStyle(
                  fontSize: 36.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
              toggleTitleStyle:
                  TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
            )
          : widget._pages[_pos],
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar(
      {Key? key, required this.onTap, this.initialPage = 0})
      : super(key: key);

  final Function(int) onTap;
  final int initialPage;

  @override
  Widget build(BuildContext context) {
    return GNav(
      rippleColor: Colors.grey,
      hoverColor: Colors.grey,
      haptic: true, // haptic feedback
      tabBorderRadius: 15, 
      tabActiveBorder: Border.all(color: Colors.black, width: 1), 
      // tab button border
      tabBorder: Border.all(color:Colors.black, width: 1),
      tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), 
                  blurRadius: 8)], // tab button shadow
      curve: Curves.easeOutExpo, // tab animation curves
      duration: const Duration(milliseconds: 900), // tab animation duration
      gap: 8, // the tab button gap between icon and text 
      color: Colors.grey[800],
      activeColor: Colors.purple, // selected icon and text color
      iconSize: 24, // tab button icon size
      tabBackgroundColor: Colors.purple.withOpacity(0.1), 
      // selected tab background color
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5), 
      
      tabs: const[
        GButton(
          icon: Icons.home_filled,
          text: 'Home',
        ),
        GButton(
          icon: Icons.equalizer,
          text: 'Market',
        ),
        GButton(
          icon: Icons.new_releases,
          text: 'News',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
      ],
      onTabChange: onTap,
    );
  
  }
}
