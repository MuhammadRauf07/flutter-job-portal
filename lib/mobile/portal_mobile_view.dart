import 'package:flutter/material.dart';
import 'package:flutter_job_portal/mobile/page_content.dart';
import 'package:flutter_job_portal/mobile/header.dart';
import 'package:flutter_job_portal/utils/colors.dart';
import 'package:flutter_job_portal/utils/custom_text.dart';

/// PortalMobileView represents the main layout of the job portal's mobile view.
class PortalMobileView extends StatelessWidget {
  const PortalMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Top header with rounded design and shadow
          const MobileTopHeader(),

          /// Title text using CustomTextView for consistency
          CustomTextView(
            text: 'Deine Job\nWebsite',
            lines: 2,
            align: TextAlign.center,
            size: 32,
            color: AppColors().blackText,
            weight: FontWeight.w600,
          ),

          /// Stack containing the image and PageContent
          Stack(
            children: [
              /// Full-width image representing the agreement illustration
              SizedBox(
                height: 450,
                width: double.infinity,
                child: Image.asset(
                  'assets/agreement.png',
                  fit: BoxFit.fill,
                ),
              ),

              /// Page content positioned below the image
              Container(
                margin: const EdgeInsets.only(top: 400),
                child: MobilePageContent(
                  text: 'Kostenlos Registrieren',
                  onPressed: () {
                    // Define what happens when the button is pressed
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
