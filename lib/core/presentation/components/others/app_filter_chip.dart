import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_color.dart';

class AppFilterChip extends StatelessWidget {
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;
  final Color selectedColor;
  final Color selectedTextColor;
  final String label;
  final double? width;
  final double? height;
  final bool showCheckmark;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool selected;
  final Icon? icon;

  const AppFilterChip({
    super.key,
    this.textColor = Colors.black,
    this.borderColor = Colors.transparent,
    this.label = '',
    required this.selected,
    this.selectedColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.selectedTextColor = Colors.white,
    this.showCheckmark = false,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      onSelected: (value) {},
      selected: selected,
      avatar: icon,
      elevation: selected ? 1.5 : 0.0,
      side: BorderSide(
        color: selected ? borderColor : AppColor.white2,
      ),
      backgroundColor: selected ? backgroundColor : AppColor.white2,
      selectedColor: selectedColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9.r),
      ),
      showCheckmark: showCheckmark,
      label: SizedBox(
        width: width,
        height: height,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: selected ? selectedTextColor : textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}