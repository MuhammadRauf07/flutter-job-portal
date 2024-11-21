import 'package:flutter/material.dart';
import 'package:flutter_job_portal/mobile/tabs/anim_tabbar.dart';
import 'package:flutter_job_portal/tablet/tabs/anim_tabbar.dart';
import 'package:flutter_job_portal/widget/gradient_button.dart';

/// PageContent widget displaying a gradient button and animated tab bar with styling.
class TabletPageContent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const TabletPageContent({
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
          child: Column(
            children: [
              /// Gradient button for registration
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: GradientButton(
                  text: 'Kostenlos Registrieren',
                  onPressed: () {
                    print('Button Pressed!');
                  },
                ),
              ),

              const SizedBox(height: 12),

              /// Divider for separating sections
              Divider(color: Colors.grey.shade200),

              const SizedBox(height: 12),

              /// Custom animated tab bar
              const CustomAnimDesktopTab(
                tabs: ['Arbeitnehmer', 'Arbeitgeber', 'Option 3'],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
