import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants/app_color.dart';

class Input extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool readOnly;
  final bool showCursor;
  final IconData icon;

  const Input({
    super.key,
    required this.label,
    this.controller,
    this.readOnly = false,
    this.showCursor = true,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      showCursor: showCursor,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.4),
            ),
        prefixIcon: Container(
          margin: EdgeInsets.only(
            right: 12.w,
          ),
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColor.blue1,
          ),
          child: Icon(
            icon,
            size: 28.sp,
            color: Colors.white,
          ),
        ),
        prefixIconConstraints: BoxConstraints.tightFor(
          width: 46.w,
          height: 34.h,
        ),
        enabled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.1),
          ),
        ),
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      cursorHeight: 25.h,
    );
  }
}
