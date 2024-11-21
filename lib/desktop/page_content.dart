import 'package:flutter/material.dart';
import 'package:flutter_job_portal/tablet/tabs/anim_tabbar.dart';
import 'package:flutter_job_portal/widget/gradient_button.dart';

/// PageContent widget displaying a gradient button and animated tab bar with styling.
class DesktopPageContent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DesktopPageContent({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Container for the main content with rounded corners and shadow
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          margin: const EdgeInsets.only(top: 5),
          child: const CustomAnimDesktopTab(
            tabs: ['Arbeitnehmer', 'Arbeitgeber', 'Option 3'],
          ),
        ),
      ],
    );
  }
}
