import 'package:flutter/material.dart';
import 'package:job_portal/components/text_field_container.dart';
import '../../constants/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
          child: TextFormField(
          onChanged: onChanged,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              icon: Icon(icon,color: kPrimaryColor,),
              hintText: hintText,
              border: InputBorder.none,
              // contentPadding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          ),
          ),
        );

  }
}
