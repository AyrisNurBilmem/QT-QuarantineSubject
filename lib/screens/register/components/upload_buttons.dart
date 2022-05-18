// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';

class UploadButtons extends StatefulWidget {
  final String description;
  final IconData icon;
  final Function press;
  const UploadButtons(
      {Key? key,
      required this.description,
      required this.press,
      required this.icon})
      : super(key: key);

  @override
  State<UploadButtons> createState() => _UploadButtonsState();
}

class _UploadButtonsState extends State<UploadButtons> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: 130,
        child: Column(
          children: [
            FlatButton(
              onPressed: () {},
              shape:
                  CircleBorder(side: BorderSide(color: primaryColor, width: 2)),
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Icon(widget.icon, color: primaryColor),
            ),
            SizedBox(height: size.height * 0.015),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ));
  }
}
