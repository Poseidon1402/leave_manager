import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final BorderSide? borderSide;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final double? borderRadius;
  final Function()? onTap;

  const RoundedTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius,
    this.borderSide,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      readOnly: readOnly,
      keyboardType: keyboardType,
      onTap: onTap,
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          borderSide: borderSide ??
              const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          borderSide: borderSide ??
              const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black.withOpacity(0.4),
            ),
        prefixIcon: Icon(
          prefixIcon,
          size: 24.sp,
        ),
        suffixIcon: Icon(
          suffixIcon,
          size: 24.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 26.w,
          vertical: 17.5.h,
        ),
      ),
    );
  }
}
