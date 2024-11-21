import 'package:flutter/material.dart';
import 'package:flutter_job_portal/mobile/tabs/tabs_view.dart';
import 'package:flutter_job_portal/model/data_model.dart';
import 'package:flutter_job_portal/provider/tab_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_job_portal/utils/colors.dart';
import 'package:flutter_job_portal/utils/custom_text.dart';

class CustomAnimatedTabBar extends StatelessWidget {
  final List<String> tabs;

  const CustomAnimatedTabBar({super.key, required this.tabs});

  /// Dynamically sets the border radius based on the selected tab's position.
  BorderRadius _getTabIndicatorBorderRadius(int index, int tabCount) {
    if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(12),
        bottomLeft: Radius.circular(12),
      );
    } else if (index == tabCount - 1) {
      return const BorderRadius.only(
        topRight: Radius.circular(12),
        bottomRight: Radius.circular(12),
      );
    }
    return BorderRadius.zero;
  }

  @override
  Widget build(BuildContext context) {
    final tabProvider = context.watch<TabProvider>();
    final currentIndex = tabProvider.currentIndex;

    return Column(
      children: [
        /// The tab bar container
        Container(
          height: 42,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Stack(
            children: [
              /// Animated background for the selected tab
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: currentIndex *
                    (MediaQuery.of(context).size.width - 32) / tabs.length,
                child: Container(
                  height: 42,
                  width: (MediaQuery.of(context).size.width - 32) / tabs.length,
                  decoration: BoxDecoration(
                    color: AppColors().tabsColor,
                    borderRadius: _getTabIndicatorBorderRadius(
                        currentIndex, tabs.length),
                  ),
                ),
              ),

              /// Tab labels
              Row(
                children: List.generate(tabs.length, (index) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        tabProvider.setIndex(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            right: index < tabs.length - 1
                                ? BorderSide(color: Colors.grey.shade300)
                                : BorderSide.none,
                          ),
                        ),
                        child: Center(
                          child: CustomTextView(
                            text: tabs[index],
                            color: currentIndex == index
                                ? Colors.white
                                : AppColors().tabsColor,
                            weight: currentIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            size: 16,
                            align: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),

        /// Dynamic content displayed based on the selected tab
        IndexedStack(
          index: currentIndex,
          children: List.generate(
            tabs.length,
                (index) => MobileStepsView(steps: _getStepsData()[index]),
          ),
        ),
      ],
    );
  }

  /// Returns the steps data for each tab
  List<List<StepsDataModel>> _getStepsData() {
    return [
      [
        StepsDataModel(
          stepNumber: '1.',
          description: 'Erstellen dein Lebenslauf',
          assetPath: 'assets/tab1step1.png',
        ),
        StepsDataModel(
          stepNumber: '2.',
          description: 'Erstellen dein Lebenslauf',
          assetPath: 'assets/tab1step2.png',
        ),
        StepsDataModel(
          stepNumber: '3.',
          description: 'Mit nur einem Klick bewerben',
          assetPath: 'assets/tab1step3.png',
        ),
      ],
      [
        StepsDataModel(
          stepNumber: '1.',
          description: 'Erstellen dein\nUnternehmensprofil',
          assetPath: 'assets/tab1step1.png',
        ),
        StepsDataModel(
          stepNumber: '2.',
          description: 'Erstellen ein jobenserat',
          assetPath: 'assets/tab2step2.png',
        ),
        StepsDataModel(
          stepNumber: '3.',
          description: 'Wähle deinen neuen\nMitarbeiter aus',
          assetPath: 'assets/tab2step3.png',
        ),
      ],
      [
        StepsDataModel(
          stepNumber: '1.',
          description: 'Erstellen dein Lebenslauf',
          assetPath: 'assets/tab1step1.png',
        ),
        StepsDataModel(
          stepNumber: '2.',
          description: 'Erstellen dein Lebenslauf',
          assetPath: 'assets/tab3step2.png',
        ),
        StepsDataModel(
          stepNumber: '3.',
          description: 'Mit nur einem Klick bewerben',
          assetPath: 'assets/tab3step3.png',
        ),
      ]
    ];
  }
}
