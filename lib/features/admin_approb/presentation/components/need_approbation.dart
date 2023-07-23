import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants/app_color.dart';
import 'approbation_button.dart';

class NeedApprobation extends StatelessWidget {
  final String name;
  final String description;
  final String reason;

  const NeedApprobation({
    super.key,
    required this.name,
    required this.description,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35.r,
            backgroundColor: AppColor.blue1,
            child: Text(
              'A',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black.withOpacity(0.4),
                    ),
              ),
              Text(
                reason,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColor.blue1,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              ApprobationButton(
                label: 'Approuver',
                onPressed: () {},
                backgroundColor: AppColor.green1.withOpacity(0.15),
                textColor: AppColor.green1,
                icon: Icons.check,
                iconColor: AppColor.green2,
              ),
              ApprobationButton(
                label: 'Refuser',
                onPressed: () {},
                backgroundColor: AppColor.red1.withOpacity(0.15),
                textColor: AppColor.red1,
                icon: Icons.check,
                iconColor: AppColor.red1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
