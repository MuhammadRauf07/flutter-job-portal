import 'package:flutter/material.dart';

class BlueLightWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.lightBlue.shade50
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.1) // Start at the top-left corner
      ..quadraticBezierTo(
        size.width * 0.25, size.height * 0.05, // Slightly upward curve
        size.width * 0.5, size.height * 0.1, // End at middle with a minor peak
      )
      ..quadraticBezierTo(
        size.width * 0.75, size.height * 0.15, // Slightly downward curve
        size.width, size.height * 0.1, // End of the wave, same height as start
      )
      ..lineTo(size.width, size.height) // Extend to bottom-right corner
      ..quadraticBezierTo(
        size.width * 0.75, size.height * 0.85, // Slightly upward bottom curve
        size.width * 0.5, size.height * 0.9, // Bottom peak
      )
      ..quadraticBezierTo(
        size.width * 0.25, size.height * 0.95, // Slightly downward curve
        0, size.height, // End at bottom-left corner
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
