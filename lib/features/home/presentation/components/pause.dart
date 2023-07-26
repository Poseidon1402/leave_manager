import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/domain/entity/pause_entity.dart';
import '../../../../core/utils/constants/app_color.dart';

class Pause extends StatelessWidget {
  final PauseEntity pause;

  const Pause({
    super.key,
    required this.pause,
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
                pause.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black.withOpacity(0.4),
                    ),
              ),
              Text(
                "${DateFormat('d MMMM yyyy', 'fr_FR').format(pause.from)} - ${DateFormat('d MMMM yyyy', 'fr_FR').format(pause.to)}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                pause.reason,
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
                  color: pause.status == "APPROUVE" ? const Color(0x3A67CE67) : AppColor.red2,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  pause.status == "APPROUVE" ? 'Approuvé' : 'Non Approuvé',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: pause.status == "APPROUVE" ? AppColor.green1 : AppColor.red1,
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
