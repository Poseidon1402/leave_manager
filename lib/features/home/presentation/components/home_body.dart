import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/presentation/components/others/app_filter_chip.dart';
import '../../../../core/utils/constants/app_color.dart';
import 'pause.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String _selected = "Tout";

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 19.h,
            ),
            Text(
              'Pause Demandé',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(
              height: 17.h,
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
                        setState(() => _selected = "Approuvé");
                      },
                      selected: _selected == "Approuvé",
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
                        setState(() => _selected = "Non Approuvé");
                      },
                      selected: _selected == "Non Approuvé",
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
            SizedBox(
              height: 23.h,
            ),
            Text(
              'Septembre 2023',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColor.grey2,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const FractionallySizedBox(
              widthFactor: 1,
              child: Pause(
                cause: 'À cause de ma santé',
                date: 'Samedi 23 Septembre',
                type: 'Malade',
                approved: true,
              ),
            ),
            const FractionallySizedBox(
              widthFactor: 1,
              child: Pause(
                cause: 'Réunion',
                date: 'Vendredi 08 Septembre',
                type: 'Réunion',
                approved: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
