import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_case_can_creative/data/config/theme.dart';
import 'package:test_case_can_creative/application/favorite/favorite_page.dart';
import 'package:test_case_can_creative/application/home/home_page.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  final List<Widget> _widgetMenu = <Widget>[
    const HomePage(),
    const FavoritePage(),
  ];

  void itemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _widgetMenu.elementAt(_selectedIndex),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 360.w,
              height: 60.h,
              child: ClipRect(
                child: BottomNavigationBar(
                  unselectedItemColor: secondaryColor,
                  showSelectedLabels: true,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border),
                      label: 'Favorite',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  backgroundColor: whiteColor,
                  selectedItemColor: primaryColor,
                  onTap: itemSelected,
                  iconSize: 16.w,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
