import 'package:flutter/material.dart';
import 'package:minggu_9/theme/theme_color.dart';
import 'package:minggu_9/theme/theme_font_style.dart';

class HeaderContactPage extends StatelessWidget {
  const HeaderContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.phone_android,
              color: ThemeColor().LightPurpleSecondary,
            ),
          ),
          Text(
            'Create New Contacts',
            style: ThemeTextStyle().RobotoMedium,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ',
              style: ThemeTextStyle().RobotoMedium,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: ThemeColor().LightPurple80,
            ),
          ),
        ],
      ),
    );
  }
}
