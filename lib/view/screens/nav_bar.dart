import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meui_project/view/screens/profile_screen.dart';

import 'home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, s}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List<Widget> screens = [];

  @override
  void initState() {
    super.initState();

    screens = [
      const HomeScreen(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : const Color(0xFFF9F9F9),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            tooltip: "Home",
            icon: Icon(
              Icons.house_outlined,
              color: Color(0xff2d2b75),
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
          BottomNavigationBarItem(
            label: "My Order",
            tooltip: "News",
            icon: Icon(
              Icons.list_alt,
              color: Color(0xff2d2b75),
              size: 24.0,
            ),
          ),
          BottomNavigationBarItem(
            label: "Place an ad",
            tooltip: "Cart",
            icon: Icon(
              Icons.add_circle,
              color: Color(0xff2d2b75),
              size: 28.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            tooltip: "Cart",
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xff2d2b75),
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
          BottomNavigationBarItem(
            label: "My Account",
            tooltip: "Cart",
            icon: Icon(
              Icons.person,
              color: Color(0xff2d2b75),
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
        ],
      ),
      body: screens.elementAt(_selectedIndex),
      backgroundColor: Colors.white,
    );
  }
}
