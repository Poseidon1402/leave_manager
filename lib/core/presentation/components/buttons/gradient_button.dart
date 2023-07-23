import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientButton extends StatelessWidget {

  final Function() onPressed;
  final String? text;
  final List<Color> colors;
  final double horizontalPadding;
  final double verticalPadding;
  final double? fixedHeight;
  final double fixedWidth;
  final Alignment begin;
  final Alignment end;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Widget? child;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.colors,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.fixedHeight,
    this.fixedWidth = double.maxFinite,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.child,
  });

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        fixedSize: Size(fixedWidth, fixedHeight ?? 55.h),
      ),
      child: Ink(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: colors
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          child: child ?? Text(
            text ?? '',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}