import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DefaultButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final IconData suffixIcon;
  final Color iconColor;
  final Color labelColor;
  final Color borderColor;
  final Color? backgroundColor;
  final double iconSize;
  final double borderRadius;
  final double borderWidth;
  final double labelFontSize;
  final double contentPadding;

  const DefaultButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.suffixIcon,
      required this.iconColor,
      this.contentPadding = 0,
      this.iconSize = 20,
      required this.labelColor,
      this.backgroundColor,
      this.borderColor = Colors.transparent,
      this.borderRadius = 24,
      this.borderWidth = 0,
      this.labelFontSize = 18});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(contentPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius), // Border radius
        side: BorderSide(
            color: borderColor, width: borderWidth), // Border color and width
      ),
      onPressed: onPressed,
      color: backgroundColor,
      // Button color
      textColor: Colors.white,
      // Text color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: labelColor,
              fontSize: labelFontSize,
            ),
          ),
          const Gap(8),
          Icon(suffixIcon, size: iconSize, color: iconColor)
        ],
      ),
    );
  }
}
