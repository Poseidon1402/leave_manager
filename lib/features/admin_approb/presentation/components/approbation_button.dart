import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApprobationButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final Color backgroundColor;
  final Function()? onPressed;

  const ApprobationButton({
    super.key,
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.textColor,
    required this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      icon: Icon(
        Icons.check,
        color: iconColor,
      ),
      label: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
