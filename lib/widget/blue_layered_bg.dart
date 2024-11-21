import 'package:flutter/material.dart';

class BlueWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.lightBlue.shade50
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.1) // Start at the top-left corner
      ..quadraticBezierTo(
        size.width * 0.25, 0, // Smoother upward curve
        size.width * 0.5, size.height * 0.15, // First peak
      )
      ..quadraticBezierTo(
        size.width * 0.75, size.height * 0.3, // Smoother downward curve
        size.width, size.height * 0.1, // End of the wave, same height as start
      )
      ..lineTo(size.width, size.height) // Extend to bottom-right corner
      ..quadraticBezierTo(
        size.width * 0.75, size.height * 0.8, // Smoother upward bottom wave
        size.width * 0.5, size.height * 0.9, // Bottom peak
      )
      ..quadraticBezierTo(
        size.width * 0.25, size.height * 1.05, // Smoother downward curve
        0, size.height, // End at bottom-left corner
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
