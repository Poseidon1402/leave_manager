import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdownField extends StatelessWidget {
  final String value;
  final Function(dynamic) onChanged;
  final double borderRadius;
  final List<DropdownMenuItem> items;

  const AppDropdownField({
    required this.value,
    required this.onChanged,
    required this.items,
    this.borderRadius = 4.0,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    return DropdownButtonFormField(
      value: value,
      elevation: 0,
      isExpanded: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius)
            )
        ),
      ),
      items: items,
      onChanged: onChanged,
    );
  }
}