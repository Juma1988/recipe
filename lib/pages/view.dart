import 'package:app/pages/01_breakfast/view.dart';
import 'package:app/pages/02_lunch/view.dart';
import 'package:app/pages/03_souses/view.dart';
import 'package:app/pages/04_sweets/view.dart';
import 'package:app/pages/05_drinks/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex = 4;
  final List _page = [
    BreakfastView(),
    LunchView(),
    SousesView(),
    SweetsView(),
    DrinksView()
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          duration: Duration(milliseconds: 300),
          items: [
            /// Breakfast
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                'assets/svg/breakfast.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(Colors.purple, BlendMode.srcIn),
              ),
              title: Text('وجبات خفيفة'),
              selectedColor: Colors.purple,
            ),

            /// lunch
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                'assets/svg/lunch.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(Colors.pink, BlendMode.srcIn),
              ),
              title: Text('وجبات رئيسية'),
              selectedColor: Colors.pink,
            ),

            /// Sauces
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                'assets/svg/sauces.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn),
              ),
              title: Text('صوصات'),
              selectedColor: Colors.orange,
            ),

            /// Sweet
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                'assets/svg/sweet.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(Colors.teal, BlendMode.srcIn),
              ),
              title: Text('حلوا'),
              selectedColor: Colors.teal,
            ),

            /// drinks
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                'assets/svg/drinks.svg',
                width: 24,
                height: 24,
                colorFilter:
                    ColorFilter.mode(Colors.green, BlendMode.srcIn),
              ),
              title: Text('مشروبات'),
              selectedColor: Colors.green,
            ),
          ],
        ),
        body: _page[_currentIndex],
      ),
    );
  }
}
