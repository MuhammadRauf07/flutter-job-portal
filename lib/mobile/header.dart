import 'package:flutter/material.dart';
import 'package:flutter_job_portal/utils/colors.dart';
import 'package:flutter_job_portal/utils/custom_text.dart';

/// A custom top header widget with a rounded background, shadow, and a "Login" label aligned to the right.
class MobileTopHeader extends StatelessWidget {
  const MobileTopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      /// Sets the header to full width and provides vertical padding
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),

      /// Background and shadow styling for the header
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(2, 2),
            blurRadius: 6,
          ),
        ],
      ),

      /// Content inside the header (Login text aligned to the right)
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Align(
            alignment: Alignment.centerRight,
            child: CustomTextView(
              text: "Login",
              size: 16,
              weight: FontWeight.w600,
              color: AppColors().textColor,
            )),
      ),
    );
  }
}
