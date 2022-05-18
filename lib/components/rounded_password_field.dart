import 'package:flutter/material.dart';
import 'package:sampleproject/components/text_field_container.dart';
import 'package:sampleproject/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  @override
  Widget build(BuildContext context) {
    var obscureText = true;
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(Icons.lock, color: primaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
