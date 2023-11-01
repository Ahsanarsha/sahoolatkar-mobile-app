import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saholatkar/view/Home%20Screen/home_screen.dart';
import 'package:saholatkar/view/Promotions/promotion_screen.dart';
import 'package:saholatkar/view/StoreLocator/store_locator.dart';
import 'package:saholatkar/view/profile/profile_screen.dart';

import '../QR/qr_screen.dart';

class BottemNavigationScreen extends StatefulWidget {
  const BottemNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottemNavigationScreen> createState() => _BottemNavigationScreenState();
}

class _BottemNavigationScreenState extends State<BottemNavigationScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            const HomeScreen(),
            const StoreLocator(),
            const QRScreenReader(),
            const PromotionScreen(),
             ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: Colors.black,
              title: const Text('Home'),
              icon: SvgPicture.asset("assets/svg_icons/nav_bar/home.svg",
                  width: 20, height: 20, semanticsLabel: 'Home')),
          BottomNavyBarItem(
              activeColor: Colors.black,
              title: const Text('Store Locator'),
              icon: SvgPicture.asset("assets/svg_icons/nav_bar/nav_home.svg",
                  width: 20, height: 20, semanticsLabel: 'Login')),
          BottomNavyBarItem(
              activeColor: Colors.black,
              title: const Text('Scan'),
              icon: SvgPicture.asset("assets/svg_icons/nav_bar/scanner.svg",
                  width: 20, height: 20, semanticsLabel: 'Scan')),
          BottomNavyBarItem(
              activeColor: Colors.black,
              title: const Text('Promotions'),
              icon: SvgPicture.asset("assets/svg_icons/nav_bar/promotion.svg",
                  color: Colors.black,
                  width: 20,
                  height: 20,
                  semanticsLabel: 'Promotion')),
          BottomNavyBarItem(
              activeColor: Colors.black,
              title: const Text('Profile'),
              icon: SvgPicture.asset("assets/svg_icons/nav_bar/User.svg",
                  width: 20, height: 20, semanticsLabel: 'Profile')),
        ],
      ),
    );
  }
}
