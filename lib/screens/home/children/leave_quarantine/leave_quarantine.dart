// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:slide_countdown/slide_countdown.dart';

class LeaveQuarantineScreen extends StatefulWidget {
  const LeaveQuarantineScreen({Key? key}) : super(key: key);

  @override
  State<LeaveQuarantineScreen> createState() => _LeaveQuarantineScreenState();
}

class _LeaveQuarantineScreenState extends State<LeaveQuarantineScreen> {
  bool isStarted = false;
  @override
  Color buttonColor(difference) {
    if (isStarted == false) {
      return primaryColor;
    } else {
      return Color.fromARGB(255, 192, 188, 188);
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    var text = new RichText(
      text: new TextSpan(
        style: new TextStyle(
          fontSize: 15.0,
          color: Color.fromARGB(255, 90, 87, 87),
        ),
        children: <TextSpan>[
          new TextSpan(
              text: 'You will have two hours to conduct a COVID test. If you'),
          new TextSpan(
              text: ' DO NOT RETURN ',
              style: new TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red)),
          new TextSpan(text: 'to your quarantine locaiton,'),
          new TextSpan(
              text: ' AUTHORITIES ',
              style: new TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red)),
          new TextSpan(text: 'will be alerted'),
        ],
      ),
    );
    return Scaffold(
        body: SafeArea(
      child: Container(
          width: double.infinity,
          height: size.height,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              Text("LEAVE QUARANTINE",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.05),
              Container(
                height: 130,
                width: 300,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(30),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(27, 0, 0, 0),
                        spreadRadius: 0,
                        blurRadius: 5),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: text,
                ),
              ),
              SizedBox(height: size.height * 0.12),
              isStarted == true
                  ? SlideCountdownSeparated(
                      height: 50,
                      width: 50,
                      textStyle: TextStyle(fontSize: 20, color: Colors.white),
                      duration: const Duration(hours: 2),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    )
                  : Text("Click to start countdown"),
              SizedBox(height: size.height * 0.08),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      primary: buttonColor(isStarted),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      textStyle: TextStyle(color: Colors.black, fontSize: 18)),
                  child: Text("Start"),
                  onPressed: () {
                    setState(() {
                      isStarted = true;
                    });
                  }),
              SizedBox(height: size.height * 0.10),
              Container(
                height: 65,
                width: 300,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(30),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(27, 0, 0, 0),
                        spreadRadius: 0,
                        blurRadius: 5),
                  ],
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10.0),
                          primary: primaryColor,
                        ),
                        onPressed: () {},
                        child: Icon(Icons.add)),
                  ),
                  Text(
                    "Upload Files Here",
                    style: TextStyle(fontSize: 17),
                  ),
                ]),
              ),
            ],
          )),
    ));
  }
}
