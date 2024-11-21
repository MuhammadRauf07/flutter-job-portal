import 'package:flutter/material.dart';
import 'package:flutter_job_portal/utils/custom_text.dart';

/// A gradient button widget with hover and click effects.
class GradientButton extends StatefulWidget {
  /// Text to display on the button.
  final String text;

  /// Callback function to trigger on button press.
  final VoidCallback onPressed;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  /// Tracks whether the button is being hovered.
  bool _isHovered = false;

  /// Tracks whether the button is being clicked.
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      /// Trigger hover state when the mouse enters the button area.
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },

      /// Reset hover state when the mouse exits the button area.
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },

      /// Gesture detector for click states and button actions.
      child: GestureDetector(
        onTapDown: (_) {
          /// Set clicked state when the button is pressed.
          setState(() {
            _isClicked = true;
          });
        },
        onTapUp: (_) {
          /// Reset clicked state and trigger the callback when the button is released.
          setState(() {
            _isClicked = false;
          });
          widget.onPressed();
        },
        onTapCancel: () {
          /// Reset clicked state if the gesture is canceled.
          setState(() {
            _isClicked = false;
          });
        },

        /// Animated container to provide smooth transitions between states.
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // Rounded corners
            gradient: _isClicked
                ? const LinearGradient(
              colors: [
                Color(0xCB053144),
                Color(0xFF072330),
              ], // Dark gradient for clicked state
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
                : _isHovered
                ? const LinearGradient(
              colors: [
                Color(0xFF0057A8),
                Color(0xFF003F7F),
              ], // Blue gradient for hover state
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
                : const LinearGradient(
              colors: [
                Color(0xFF005377),
                Color(0xFF00334E),
              ], // Default gradient for initial state
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: _isHovered
                ? [
              BoxShadow(
                color: Colors.blue.withOpacity(0.4), // Hover shadow effect
                blurRadius: 8,
                offset: const Offset(0, 4), // Shadow offset
              )
            ]
                : [],
          ),
          child: Center(
            /// Button text using `CustomTextView` for consistent styling.
            child: CustomTextView(
              text: widget.text,
              size: 16, // Font size
              weight: _isClicked ? FontWeight.w900 : FontWeight.bold, // Weight changes on click
              color: Colors.white, // Text color
              align: TextAlign.center, // Center align the text
            ),
          ),
        ),
      ),
    );
  }
}
