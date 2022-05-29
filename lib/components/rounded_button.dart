// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Widget press;
  final Color color, textColor;
  final double buttonLength;
  const RoundedButton({
    Key? key,
    this.text = "",
    required this.press,
    required this.color,
    this.textColor = Colors.white,
    this.buttonLength = 0.8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * buttonLength,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 19, horizontal: 40),
            color: color,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return press;
                  },
                ),
              );
            },
            child: Text(text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ))),
      ),
    );
  }
}
