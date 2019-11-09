import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  double screenSizeHeight = MediaQuery.of(context).size.height;
  double containerHeight = screenSizeHeight - 300.0;
    return Container(
      constraints: BoxConstraints.expand(height: containerHeight - 80),
      decoration: BoxDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
