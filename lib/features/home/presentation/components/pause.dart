import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants/app_color.dart';

class Pause extends StatelessWidget {
  final String cause;
  final String date;
  final String type;
  final bool approved;

  const Pause({
    super.key,
    required this.cause,
    required this.date,
    required this.type,
    required this.approved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6.h,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 12.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cause,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black.withOpacity(0.4),
                    ),
              ),
              Text(
                date,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                type,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColor.blue1,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: approved ? const Color(0x3A67CE67) : AppColor.red2,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  approved ? 'Approuvé' : 'Non Approuvé',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: approved ? AppColor.green1 : AppColor.red1,
                      ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
