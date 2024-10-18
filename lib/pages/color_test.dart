import 'package:flutter/material.dart';

class ColorTest extends StatelessWidget {
  const ColorTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color test'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primary,
                  child: Center(
                    child: Text(
                      'This is Primary Color, with Primary font',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.secondary,
                  child: Center(
                    child: Text(
                      'This is Primary Color, with Primary font',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
