import 'package:flutter/material.dart';
import 'package:tugas12/theme/theme_color.dart';
import 'package:tugas12/theme/theme_font_style.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeColor().LightPurple,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: ThemeTextStyle().LabelRobotoLarge,
        ));
  }
}
