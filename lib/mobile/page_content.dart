import 'package:flutter/material.dart';
import 'package:flutter_job_portal/mobile/tabs/anim_tabbar.dart';
import 'package:flutter_job_portal/widget/gradient_button.dart';

/// PageContent widget displaying a gradient button and animated tab bar with styling.
class MobilePageContent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MobilePageContent({
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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300]!,
                offset: const Offset(-2, -2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            children: [
              /// Gradient button for registration
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
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
              const CustomAnimatedTabBar(
                tabs: ['Arbeitnehmer', 'Arbeitgeber', 'Option 3'],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
