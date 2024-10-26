import 'dart:math';

import 'package:app/pages/02_lunch/details_view.dart';
import 'package:app/pages/02_lunch/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LunchView extends StatefulWidget {
  const LunchView({super.key});

  @override
  State<LunchView> createState() => _LunchViewState();
}

class _LunchViewState extends State<LunchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سلطات و صوصات'),
      ),
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset('assets/images/dont_know.svg'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  LunchDetailsView(itemNum: Random().nextInt(lunch.length)),
            ),
          );
        },
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.r),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 8.w,
          childAspectRatio: 200 / 70,
          mainAxisSpacing: 8.h,
        ),
        itemCount: lunch.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LunchDetailsView(itemNum: index)),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4),
              ],
            ),
            child: Row(
              children: [
                ///Container 01
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.r).copyWith(
                            topRight: Radius.circular(8.r),
                            bottomRight: Radius.circular(8.r))),
                    child: Image.asset(
                      lunch[index]['image'],
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),

                ///Container 02
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                lunch[index]['title_ar'],
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'font01',
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    lunch[index]['stats'] =
                                        !lunch[index]['stats'];
                                  });
                                },
                                icon: Icon(
                                  !lunch[index]['stats']
                                      ? Icons.favorite_border
                                      : Icons.favorite,
                                  color: Colors.redAccent,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  height: 20,
                                  width: 75,
                                  child: Text(
                                      'المستوي : ${lunch[index]['level']}'),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                              SizedBox(width: 9),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  height: 20,
                                  width: 75,
                                  child: Text(
                                      'مدة التحضير ${lunch[index]['prep_time']}'),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.h),
                                  height: 20.h,
                                  width: 75.w,
                                  child: Text(
                                      'عدد المقادير  ${(lunch[index]['ingredients'] as List?)?.length ?? 0}'),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                              SizedBox(width: 9.w),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.r),
                                  height: 20.h,
                                  width: 75.w,
                                  child: Text(
                                      'مده الطهو ${lunch[index]['cook_time']}'),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
