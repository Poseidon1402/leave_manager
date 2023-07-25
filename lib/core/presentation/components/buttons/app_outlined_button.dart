import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final Color borderColor;
  final double fixedWidth;
  final double? fixedHeight;
  final double borderWidth;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double?  borderRadius;
  final Color textColor;
  final Function()? onPressed;

  const AppOutlinedButton({
    super.key,
    required this.text,
    this.borderColor = Colors.black,
    this.fixedWidth = double.maxFinite,
    this.fixedHeight,
    this.textColor = Colors.black,
    this.borderRadius,
    this.fontSize,
    this.borderWidth = 1.0,
    this.fontWeight,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: borderColor,
          width: borderWidth,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        ),
        elevation: 0.0,
        fixedSize: Size(fixedWidth, fixedHeight ?? 55.h),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
