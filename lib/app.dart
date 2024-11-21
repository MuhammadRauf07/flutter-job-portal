import 'package:flutter/material.dart';
import 'package:flutter_job_portal/desktop/portal_desktop_view.dart';
import 'package:flutter_job_portal/mobile/portal_mobile_view.dart';
import 'package:flutter_job_portal/tablet/portal_tablet_view.dart';
import 'package:flutter_job_portal/utils/screen_utils.dart';

class AppContent extends StatelessWidget {
  const AppContent({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ProKitResponsive(
            mobile: PortalMobileView(),
            largeMobile: PortalMobileView(),
            tablet: PortalTabletView(),
            desktop: PortalDesktopView(),
            extraLargeScreen: PortalDesktopView(),
          )),
    );
  }
}
