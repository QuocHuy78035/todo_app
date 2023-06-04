import 'package:flutter/material.dart';

import 'base_color.dart';

class BaseInput extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onChanged;

  const BaseInput({
    Key? key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorColor: AppColor.colorBlack,
      decoration: InputDecoration(
        hintText: '$hintText',
        hintStyle: TextStyle(fontSize: 16, color: AppColor.colorWhite),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColor.colorWhite)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColor.colorWhite)),
      ),
    );
  }
}
