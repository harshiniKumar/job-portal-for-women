import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/components/text_field_container.dart';
import '../../constants/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        // textAlign: TextAlign.center,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
          hintText: "Password",
          // contentPadding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

