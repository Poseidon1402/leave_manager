import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/presentation/components/others/app_filter_chip.dart';
import '../../../../core/utils/constants/app_color.dart';

class UserPauseDetailBody extends StatefulWidget  {
  const UserPauseDetailBody({super.key});

  @override
  State<UserPauseDetailBody> createState() => _UserPauseDetailBodyState();
}

class _UserPauseDetailBodyState extends State<UserPauseDetailBody> {
  String _selected = 'Tout';

  @override
  Widget build(BuildContext context) {

    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w,),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 33.r,
                  child: CircleAvatar(
                    backgroundColor: AppColor.blue1,
                    radius: 31.r,
                    child: Text(
                      'A',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w,),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Brookling Simons\n',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'En informatique',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white2,
                  borderRadius: BorderRadius.circular(9.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppFilterChip(
                      onSelected: (value) {
                        setState(() => _selected = "Tout");
                      },
                      width: 80.w,
                      selected: _selected == "Tout",
                      label: 'Tout',
                      selectedTextColor: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    AppFilterChip(
                      onSelected: (value) {
                        setState(() => _selected = "APPROUVE");
                      },
                      selected: _selected == "APPROUVE",
                      icon: const Icon(
                        Icons.check,
                        color: Colors.greenAccent,
                      ),
                      label: 'Approuvé',
                      selectedTextColor: Colors.black,
                      textColor: AppColor.grey1,
                      fontWeight: FontWeight.w600,
                    ),
                    AppFilterChip(
                      onSelected: (value) {
                        setState(() => _selected = "REFUSE");
                      },
                      selected: _selected == "REFUSE",
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      label: 'Non Approuvé',
                      selectedTextColor: Colors.black,
                      textColor: AppColor.grey1,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}