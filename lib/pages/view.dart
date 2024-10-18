import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Theme(
        data: ThemeData(useMaterial3: false),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.abc),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 16,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: List.generate(
            5,
            (index) => index == 2
                ? Spacer()
                : Expanded(
                    child: Container(
                      color: Color(0xFFF050F0 * (index + 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.add), Text('data')],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
