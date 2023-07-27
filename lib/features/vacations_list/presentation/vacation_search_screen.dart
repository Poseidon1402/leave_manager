import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constants/app_color.dart';

class VacationSearchScreen extends StatelessWidget {
  const VacationSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: AppColor.white1,
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 44.h,),
            _buildSearchField(context),
            SizedBox(
              height: 34.h,
            ),
            /*Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const EmployeeOnVacation(
                    name: 'Moussa Diop',
                    reason: 'Malade',
                    from: 'Sam 23',
                    to: 'Mar 26',
                  );
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 19.h,
            horizontal: 20.w,
          ),
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Nom, département',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColor.grey3,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                prefixIcon: Icon(
                  Icons.search_sharp,
                  color: AppColor.grey1,
                  size: 18.sp,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.white3,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: AppColor.grey4,
                  size: 18.sp,
                ),
                SizedBox(
                  width: 15.w,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Du ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.4),
                            ),
                      ),
                      TextSpan(
                        text: 'Sam 23 Sep 2023 ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                      TextSpan(
                        text: "- ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.4),
                            ),
                      ),
                      TextSpan(
                        text: 'Mar 26 Sep 2023',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
