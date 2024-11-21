import 'package:flutter/material.dart';
import 'package:flutter_job_portal/model/data_model.dart';
import 'package:flutter_job_portal/utils/colors.dart';
import 'package:flutter_job_portal/widget/blue_layered_bg.dart';
import 'package:flutter_job_portal/utils/custom_text.dart';

/// A widget that displays steps for users to follow using the provided steps data.
class MobileStepsView extends StatelessWidget {
  final List<StepsDataModel> steps;

  const MobileStepsView({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Title for the steps section
        Padding(
          padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
          child: CustomTextView(
            text: 'Drei einfache Schritte zur\n Vermittlung neuer Mitarbeiter',
            align: TextAlign.center,
            size: 18,
            lines: 2,
            weight: FontWeight.w600,
            color: AppColors().blackText,
          ),
        ),

        /// List of steps rendered dynamically using ListView.builder
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: steps.length,
          itemBuilder: (context, index) {
            final step = steps[index];
            final isBlueBackground = index % 2 == 1; // Alternate background
            return StepItem(
              step: step,
              isLastItem: index == 2,
              isFirstItem: index == 0,
              useBlueBackground: isBlueBackground,
            );
          },
        ),
      ],
    );
  }
}

/// A widget that displays an individual step with its data and background styling.
class StepItem extends StatelessWidget {
  final StepsDataModel step;
  final bool isLastItem;
  final bool isFirstItem;
  final bool useBlueBackground;

  const StepItem({
    super.key,
    required this.step,
    required this.isFirstItem,
    required this.isLastItem,
    required this.useBlueBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Blue wave background for alternate steps
        if (useBlueBackground)
          CustomPaint(
            size: const Size(double.infinity, 400),
            // Adjust height for blue background
            painter: BlueWavePainter(),
          ),

        /// Step 1 has a unique design
        !isFirstItem
            ? Stack(
                children: [
                  if (isLastItem)
                    Positioned(
                      top: -80,
                      left: -50,
                      child: Container(
                        width: 400,
                        height: 400,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF7FAFC), shape: BoxShape.circle),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Step number and description
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomTextView(
                              text: step.stepNumber,
                              size: 100,
                              weight: FontWeight.bold,
                              color: AppColors().greyText,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: CustomTextView(
                                  text: step.description,
                                  lines: 2,
                                  size: 18,
                                  align: TextAlign.start,
                                  color: useBlueBackground
                                      ? AppColors().greyText
                                      : AppColors().greyText,
                                ),
                              ),
                            ),
                          ],
                        ),

                        /// Step image
                        Center(
                          child: Image.asset(
                            step.assetPath,
                            height: 145,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : stepOneUI(step.description),
      ],
    );
  }

  /// Special UI for the first step
  Widget stepOneUI(description) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          /// Large "1." for the first step
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: CustomTextView(
                text: '1.',
                size: 100,
                lines: 2,
                weight: FontWeight.bold,
                color: AppColors().greyText,
              ),
            ),
          ),

          /// Description text for the first step
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 105, bottom: 27),
              child: CustomTextView(
                text: description,
                size: 16,
                lines: 2,
                color: AppColors().greyText,
              ),
            ),
          ),

          /// Step 1 image
          Padding(
            padding: const EdgeInsets.only(left: 100, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/tab1step1.png', // Replace with your asset path
                  height: 145,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
