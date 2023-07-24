import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/presentation/components/others/app_filter_chip.dart';
import '../../../core/utils/constants/app_color.dart';

class VacationsListScreen extends StatelessWidget {
  const VacationsListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: AppColor.white1,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personnels en congé',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Département',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.grey2,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 50.h,
                child: Center(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      AppFilterChip(
                        width: 90.w,
                        selected: true,
                        label: 'Social',
                        selectedTextColor: AppColor.blue1,
                        textColor: AppColor.grey1,
                        unselectedBackgroundColor: AppColor.white1,
                        unselectedBorderColor: AppColor.white1,
                        fontWeight: FontWeight.w600,
                      ),
                      AppFilterChip(
                        width: 90.w,
                        selected: false,
                        label: 'Informatique',
                        selectedTextColor: AppColor.blue1,
                        textColor: AppColor.grey1,
                        unselectedBackgroundColor: AppColor.white1,
                        unselectedBorderColor: AppColor.white1,
                        fontWeight: FontWeight.w600,
                      ),
                      AppFilterChip(
                        width: 90.w,
                        selected: false,
                        label: 'Commerce',
                        textColor: AppColor.grey1,
                        selectedTextColor: AppColor.blue1,
                        unselectedBackgroundColor: AppColor.white1,
                        unselectedBorderColor: AppColor.white1,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Mois de : ',
                          style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColor.grey2,
                          ),
                        ),
                        TextSpan(
                          text: 'Septembre 2023',
                          style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColor.grey2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    label: Text(
                      'Filtrer',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.white1,
    );
  }
}