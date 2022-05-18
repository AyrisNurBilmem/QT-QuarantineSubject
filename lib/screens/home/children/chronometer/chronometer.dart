import 'package:flutter/material.dart';

class ChronometerScreen extends StatelessWidget {
  const ChronometerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text(
          "Chronometer",
          textAlign: TextAlign.center,
        ));
  }
}
