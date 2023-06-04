import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? content;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  const BaseButton({
    Key? key,
    this.onPressed,
    this.content,
    this.color,
    this.width,
    this.height,
    this.textStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
        primary: color,
        fixedSize: Size(width ?? 0, height ?? 0)
      ),
      onPressed: onPressed,
      child: Text(
        '$content',
        style: textStyle,
      ),
    );
  }
}
