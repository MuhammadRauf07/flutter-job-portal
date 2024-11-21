import 'package:flutter/material.dart';
import 'package:flutter_job_portal/desktop/page_content.dart';
import 'package:flutter_job_portal/mobile/header.dart';
import 'package:flutter_job_portal/utils/colors.dart';
import 'package:flutter_job_portal/utils/custom_text.dart';
import 'package:flutter_job_portal/widget/blue_layered_tablet.dart';
import 'package:flutter_job_portal/widget/gradient_button.dart';

/// PortalMobileView represents the main layout of the job portal's mobile view.
class PortalDesktopView extends StatelessWidget {
  const PortalDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CustomPaint(
              size: const Size(double.infinity, 600),

              /// Adjust height for blue background
              painter: BlueLightWavePainter(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Top header with rounded design and shadow
              const MobileTopHeader(),

              

              /// Title text using CustomTextView for consistency
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CustomTextView(
                          text: 'Deine Job\nWebsite',
                          lines: 2,
                          size: 32,
                          color: AppColors().blackText,
                          weight: FontWeight.w600,
                        ),
                        SizedBox(
                          width: 300,
                          child: GradientButton(
                            text: 'Kostenlos Registrieren',
                            onPressed: () {
                              print('Button Pressed!');
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 400,
                      width: 400,
                      padding: const EdgeInsets.all(50),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Image.asset(
                        'assets/agreement.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 100),
                child: DesktopPageContent(
                  text: 'Kostenlos Registrieren',
                  onPressed: () {
                    // Define what happens when the button is pressed
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
