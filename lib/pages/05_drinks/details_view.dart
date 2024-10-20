import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({
    super.key, required int aNumber,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(drinks[aNumber][title_ar]),
          ),
    );
  }
}
