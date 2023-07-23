import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/presentation/components/buttons/gradient_button.dart';
import '../../../../core/utils/constants/app_color.dart';
import 'input.dart';

class NewRequestBody extends StatefulWidget {
  const NewRequestBody({super.key});

  @override
  State<NewRequestBody> createState() => _NewRequestBodyState();
}

class _NewRequestBodyState extends State<NewRequestBody> {
  DateTime _start = DateTime.now();
  DateTime _end = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Demander une pause',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 19.h,
                horizontal: 35.w,
              ),
              height: MediaQuery.sizeOf(context).height * 0.65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  const Input(
                    label: 'Cause',
                    icon: Icons.grid_view,
                  ),
                  const Input(
                    label: 'Description',
                    icon: Icons.file_copy_outlined,
                  ),
                  const Input(
                    label: 'De',
                    icon: Icons.calendar_today_outlined,
                  ),
                  // TODO: Select range
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    rangeStartDay: _start,
                    rangeEndDay: _end,
                    focusedDay: DateTime.now(),
                    locale: 'fr_FR',
                    rowHeight: 35.h,
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month',
                    },
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      leftChevronIcon: const Icon(
                        Icons.chevron_left,
                        color: AppColor.blue1,
                      ),
                      rightChevronIcon: const Icon(
                        Icons.chevron_right,
                        color: AppColor.blue1,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      weekendTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      selectedTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: AppColor.red1,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: AppColor.blue1.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      rangeEndDecoration: const BoxDecoration(
                        color: AppColor.red1,
                        shape: BoxShape.circle,
                      ),
                      rangeStartDecoration: const BoxDecoration(
                        color: AppColor.red1,
                        shape: BoxShape.circle,
                      ),
                      rangeStartTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      rangeEndTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      rangeHighlightColor: AppColor.red1.withOpacity(0.2),
                    ),
                    onRangeSelected: (from, to, focusedDay) {
                      setState(() {
                        _start = from!;
                        _end = to!;
                      });
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _start = selectedDay;
                        _end = focusedDay;
                      });
                    },
                  ),
                  const Input(
                    label: "Jusqu'au",
                    icon: Icons.calendar_today_outlined,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: GradientButton(
                onPressed: () {},
                text: 'DEMANDER',
                fixedHeight: 46.h,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                colors: const [
                  AppColor.blue2,
                  AppColor.blue1,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}