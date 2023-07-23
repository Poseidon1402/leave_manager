import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppActionChip extends StatelessWidget {
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;
  final String label;
  final Icon? icon;
  final Function()? onPressed;

  const AppActionChip({
    super.key,
    this.textColor = Colors.black,
    this.borderColor = Colors.transparent,
    this.label = '',
    this.backgroundColor = Colors.white,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onPressed,
      avatar: icon,
      side: BorderSide(
        color: borderColor,
      ),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9.r),
      ),
      label: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}