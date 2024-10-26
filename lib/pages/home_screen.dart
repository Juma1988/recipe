import 'dart:math';

import 'package:app/core/design/navigator.dart';
import 'package:app/pages/01_breakfast/details_view.dart';
import 'package:app/pages/01_breakfast/model.dart';
import 'package:app/pages/01_breakfast/view.dart';
import 'package:app/pages/02_lunch/details_view.dart';
import 'package:app/pages/02_lunch/model.dart';
import 'package:app/pages/02_lunch/view.dart';
import 'package:app/pages/03_salad/details_view.dart';
import 'package:app/pages/03_salad/model.dart';
import 'package:app/pages/03_salad/view.dart';
import 'package:app/pages/04_sauces/view.dart';
import 'package:app/pages/05_sweets/details_view.dart';
import 'package:app/pages/05_sweets/view.dart';
import 'package:app/pages/06_drinks/details_view.dart';
import 'package:app/pages/06_drinks/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '04_sauces/details_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _branch = [
    'وجبات حفيفة',
    'وجبات رأيسية',
    'سلطات',
    'الصلصات',
    'حلويات',
    'مشروبات',
  ];
  final List<String> _images = [
    'assets/svg/breakfast.svg',
    'assets/svg/lunch.svg',
    'assets/svg/salad.svg',
    'assets/svg/sauces.svg',
    'assets/svg/sweet.svg',
    'assets/svg/drinks.svg',
  ];
  final List<Widget> _page = [
    BrackfastView(),
    LunchView(),
    SaladView(),
    SaucesView(),
    SweetsView(),
    DrinksView()
  ];
  final List<Widget> _detailsView = [
    BreakfastDetailsView(itemNum: Random().nextInt(breakfast.length)),
    LunchDetailsView(itemNum: Random().nextInt(lunch.length)),
    SaladDetailsView(itemNum: Random().nextInt(salad.length)),
    SaucesDetailsView(itemNum: Random().nextInt(sauces.length)),
    SweetDetailsView(itemNum: Random().nextInt(sweets.length)),
    DrinksDetailsView(itemNum: Random().nextInt(drinks.length)),
  ];
  final List<Color> _colors = [
    Colors.cyan,
    Colors.pinkAccent,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text('هناكل ايه'),
            )),
        body: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              GridView.builder(
                itemCount: _branch.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 300.w / 400.h),
                itemBuilder: (context, index) => InkWell(
                  enableFeedback: true,
                  autofocus: true,
                  onTap: () {
                    AppGoto(_page[index]);
                  },
                  onDoubleTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => _detailsView[index]),
                    );
                  },
                  focusColor: _colors[index],
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: Offset(0, 4),
                              blurRadius: 4),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          _images[index],
                          width: 60.w,
                          height: 60.h,
                          colorFilter:
                              ColorFilter.mode(_colors[index], BlendMode.srcIn),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          _branch[index],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 21,
                              fontFamily: 'font',
                              color: _colors[index]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(                children: [
                Icon(Icons.info_outline, size: 10, color: Colors.grey),
                Text(
                  'ضغطتيت متتاليتين > اختيار عشوائي',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                )
              ])

            ],
          ),
        ),
      ),
    );
  }
}
