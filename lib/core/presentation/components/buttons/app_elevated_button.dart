import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {

  final Widget child;
  final Color borderColor;
  final EdgeInsetsGeometry padding;
  final double elevation;
  final double borderRadius;
  final Color? backgroundColor;
  final Function() onPressed;

  const AppElevatedButton({
    super.key,
    required this.child,
    this.elevation = 0.0,
    this.borderRadius = 0.0,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(8.0),
    this.borderColor = Colors.transparent,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(
          color: borderColor,
        )
      ),
      child: child
    );
  }
}