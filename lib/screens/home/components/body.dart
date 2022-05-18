import 'package:flutter/material.dart';
import 'package:sampleproject/screens/home/children/chronometer/chronometer.dart';
import 'package:sampleproject/screens/home/children/leave_quarantine/leave_quarantine.dart';
import 'package:sampleproject/screens/home/children/map/map.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(children: [
      MapScreen(),
      ChronometerScreen(),
      LeaveQuarantineScreen(),
    ]);
  }
}
