import 'package:app/pages/05_drinks/view.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  final int itemNum;

  const DetailsView({super.key, required this.itemNum});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(drinks[widget.itemNum]['title_ar']),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  drinks[widget.itemNum]['image'],
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
                Title(txt: 'المقــادير'),
                SizedBox(
                  height:
                      drinks[widget.itemNum]['ingredients_count'].toDouble() *
                          66,
                  child: Ingredients(
                    indexNumber: widget.itemNum,
                  ),
                ),
                Title(txt: 'طريقة العمل'),
                SizedBox(
                  height:
                      drinks[widget.itemNum]['steps'].length.toDouble() * 66,
                  child: Steps(indexNumber: widget.itemNum),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

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
      drinks[widget.indexNumber]['steps'].length,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: drinks[widget.indexNumber]['ingredients'].length,
        itemBuilder: (context, index) => CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          tristate: true,
          title: Text(drinks[widget.indexNumber]['ingredients'][index]),
          value: _checkedStates[index],
          onChanged: (value) {
            setState(() {
              _checkedStates[index] = value ?? false;
            });
          },
        ),
      ),
    );
  }
}

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
      drinks[widget.indexNumber]['steps'].length,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: drinks[widget.indexNumber]['steps'].length,
        itemBuilder: (context, index) => CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          tristate: true,
          title: Text(drinks[widget.indexNumber]['steps'][index]),
          value: _checkedStates[index],
          onChanged: (value) {
            setState(() {
              _checkedStates[index] = value ?? false;
            });
          },
        ),
      ),
    );
  }
}

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
