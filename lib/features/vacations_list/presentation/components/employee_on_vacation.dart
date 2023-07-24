import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/presentation/components/buttons/app_elevated_button.dart';
import '../../../../core/utils/constants/app_color.dart';

class EmployeeOnVacation extends StatelessWidget {
  final String name;
  final String reason;
  final String from;
  final String to;

  const EmployeeOnVacation({
    super.key,
    required this.name,
    required this.reason,
    required this.from,
    required this.to,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h,),
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: AppColor.blue1,
              radius: 30.r,
              child: const Text('A'),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  reason,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.blue1,
                      ),
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: ColoredBox(
                        color: AppColor.blue1,
                        child: Padding(
                          padding: EdgeInsets.all(4.sp),
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Du ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                          ),
                          TextSpan(
                            text: '$from ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                          ),
                          TextSpan(
                            text: "Jusqu'au ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                          ),
                          TextSpan(
                            text: to,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: AppElevatedButton(
              onPressed: () {},
              borderRadius: 4.r,
              backgroundColor: AppColor.orange1.withOpacity(0.15),
              child: Text(
                'En cours',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColor.orange1,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
