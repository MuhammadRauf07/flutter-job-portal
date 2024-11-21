import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop, extraLarge }

class ProKitResponsive extends StatelessWidget {
  const ProKitResponsive({
    super.key,
    required this.desktop,
    required this.mobile,
    this.largeMobile,
    this.tablet,
    this.extraLargeScreen,
  });

  final Widget desktop;
  final Widget? largeMobile;
  final Widget mobile;
  final Widget? tablet;
  final Widget? extraLargeScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final deviceType =
        DeviceUtils.getDeviceTypeFromConstraints(constraints.maxWidth);

        print("deviceType :: ${deviceType}");

        if (deviceType == DeviceType.extraLarge && extraLargeScreen != null) {
          return extraLargeScreen!;
        } else if (deviceType == DeviceType.desktop) {
          return desktop;
        } else if (deviceType == DeviceType.tablet && tablet != null) {
          return tablet!;
        } else if (deviceType == DeviceType.mobile && largeMobile != null) {
          return largeMobile!;
        } else {
          return mobile;

          /// Fallback to mobile if no other options
        }
      },
    );
  }
}

class DeviceUtils {
  static DeviceType getDeviceType(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return _getDeviceTypeFromWidth(size);
  }

  static DeviceType getDeviceTypeFromConstraints(double maxWidth) {
    return _getDeviceTypeFromWidth(maxWidth);
  }

  static DeviceType _getDeviceTypeFromWidth(double width) {
    if (width >= 1440) return DeviceType.extraLarge;

    /// Extra large screens (e.g., large desktops)
    if (width >= 1024) return DeviceType.desktop;

    /// Desktops and laptops
    if (width >= 600) return DeviceType.tablet;

    /// Tablets
    return DeviceType.mobile;

    /// Mobile devices
  }
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late DeviceType deviceType;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    deviceType = DeviceUtils.getDeviceType(context);
  }

  static double width(double value) {
    final baseWidth = _getBaseWidth();
    return (value / baseWidth) * screenWidth;
  }

  static double height(double value) {
    final baseHeight = _getBaseHeight();
    return (value / baseHeight) * screenHeight;
  }

  static double _getBaseWidth() {
    switch (deviceType) {
      case DeviceType.desktop:
        return 1440;

    /// More typical for modern desktops/laptops (slightly adjusted)
      case DeviceType.tablet:
        return 768;

    /// Standard tablet width
      default:
        return 414;

    /// Common mobile device width
    }
  }

  static double _getBaseHeight() {
    switch (deviceType) {
      case DeviceType.desktop:
        return 900;

    /// Height adjusted to match common desktop resolution
      case DeviceType.tablet:
        return 1024;

    /// Standard tablet height
      default:
        return 896;

    /// Common mobile height (iPhone 11 reference)
    }
  }

  /// Automatic text scaling based on screen width
  static double scaleTextSize(double baseSize) {
    double scalingFactor = (screenWidth - 414) / (1366 - 414);
    scalingFactor =
        scalingFactor.clamp(0.0, 1.0); // Ensure scaling factor stays in bounds
    return baseSize +
        (baseSize * 0.5 * scalingFactor); // Scale between 100% to 150%
  }
}

extension SizeExtensions on num {
  double get w {
    if (SizeConfig.screenWidth == 0) {
      throw FlutterError(
          'SizeConfig has not been initialized. Call SizeConfig.init(context) before using it.');
    }
    return SizeConfig.width(toDouble());
  }

  double get h {
    if (SizeConfig.screenHeight == 0) {
      throw FlutterError(
          'SizeConfig has not been initialized. Call SizeConfig.init(context) before using it.');
    }
    return SizeConfig.height(toDouble());
  }

  SizedBox get height => SizedBox(
    height: toDouble().w,
  );

  SizedBox get width => SizedBox(
    width: toDouble().w,
  );
}
