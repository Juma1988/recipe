import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model.dart';

class LunchDetailsView extends StatefulWidget {
  final int itemNum;

  const LunchDetailsView({super.key, required this.itemNum});

  @override
  State<LunchDetailsView> createState() => _LunchDetailsViewState();
}

class _LunchDetailsViewState extends State<LunchDetailsView> {
  bool isChecked = false;
  late double ingredientsHeight =
      lunch[widget.itemNum]['ingredients_count'].toDouble() * 86;
  late double stepsHeight =
      lunch[widget.itemNum]['steps_count'].toDouble() * 86;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            ///Container 01 - image
            SliverAppBar(
              title: Text(lunch[widget.itemNum]['title_ar']),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  lunch[widget.itemNum]['image'],
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.primary,
              expandedHeight: MediaQuery.of(context).size.height * 0.60,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                    padding: EdgeInsets.all(16).copyWith(bottom: 0),
                    child: Title(txt: 'المقــادير')),
                SizedBox(
                  height: ingredientsHeight,
                  child: Ingredients(
                    indexNumber: widget.itemNum,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                    padding: EdgeInsets.all(16).copyWith(bottom: 0),
                    child: Title(txt: 'طريقة العمل')),
                SizedBox(
                  height: stepsHeight,
                  child: Steps(
                    indexNumber: widget.itemNum,
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

///Container 01 - Title
class Title extends StatelessWidget {
  final String txt;

  const Title({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          txt,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'font'),
        ),
        Expanded(
            child: Divider(
          color: Color(0xFFA9A9A9),
          endIndent: 20,
          indent: 20,
        )),
      ],
    );
  }
}

///Container 02 - Ingredients
class Ingredients extends StatefulWidget {
  final int indexNumber;

  const Ingredients({super.key, required this.indexNumber});

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  late List<bool> _checkedStates;

  @override
  void initState() {
    super.initState();
    _checkedStates = List.generate(
      lunch[widget.indexNumber]['ingredients'].length,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // var xx = Lunch[widget.indexNumber]['ingredients'];
    // developer.log('$xx.length', name: 'my.Lunch.category');
    return Center(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: lunch[widget.indexNumber]['ingredients'].length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4),
                ],
              ),
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                tristate: true,
                title: Text(
                    lunch[widget.indexNumber]['ingredients'][index]['item']),
                subtitle: Text(
                  lunch[widget.indexNumber]['ingredients'][index]['quantity'],
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.75)),
                ),
                value: _checkedStates[index],
                onChanged: (value) {
                  setState(() {
                    _checkedStates[index] = value ?? false;
                  });
                },
              ),
            ),
            SizedBox(height: 8.h)
          ],
        ),
      ),
    );
  }
}

///Container 03 - Steps
class Steps extends StatefulWidget {
  final int indexNumber;

  const Steps({super.key, required this.indexNumber});

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  late List<bool> _checkedStates;

  @override
  void initState() {
    super.initState();
    _checkedStates = List.generate(
      lunch[widget.indexNumber]['steps'].length,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: lunch[widget.indexNumber]['steps'].length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4),
                ],
              ),
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                tristate: true,
                title: Text(lunch[widget.indexNumber]['steps'][index]),
                value: _checkedStates[index],
                onChanged: (value) {
                  setState(() {
                    _checkedStates[index] = value ?? false;
                  });
                },
              ),
            ),
            SizedBox(height: 8.h)
          ],
        ),
      ),
    );
  }
}
