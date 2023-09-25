import 'package:flutter/material.dart';
import 'package:minggu_6/theme/theme_color.dart';
import 'package:minggu_6/theme/theme_font_style.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final TextInputType textInputType;
  const TextFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.onChanged,
    required this.controller,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 7.5,
        top: 7.5,
        left: 16,
        right: 16,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          filled: true,
          fillColor: ThemeColor().LightPurple70,
          labelStyle: ThemeTextStyle().BodyRobotoSmall,
          hintStyle: ThemeTextStyle().BodyRobotoLarge,
          label: Text(
            label,
          ),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
