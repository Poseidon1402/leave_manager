import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:leave_manager/core/utils/enum/load_status.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/presentation/bloc/pause/pause_bloc.dart';
import '../../../core/utils/constants/app_color.dart';
import 'components/employee_on_vacation.dart';

class VacationSearchScreen extends StatefulWidget {
  const VacationSearchScreen({super.key});

  @override
  State<VacationSearchScreen> createState() => _VacationSearchScreenState();
}

class _VacationSearchScreenState extends State<VacationSearchScreen> {
  DateTime _fromDay = DateTime.now();
  DateTime _toDay = DateTime.now();
  bool _isVisible = false;

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
            SizedBox(
              height: 44.h,
            ),
            _buildSearchField(context),
            ColoredBox(
              color: Colors.white,
              child: Visibility(
                visible: _isVisible,
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  rangeStartDay: _fromDay,
                  rangeEndDay: _toDay,
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
                  onDaySelected: (selectedDay, focusedDay) {
                    if (_fromDay.day == DateTime.now().day) {
                      setState(() {
                        _fromDay = selectedDay;
                      });
                    } else {
                      setState(() {
                        _toDay = selectedDay;
                      });
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 34.h,
            ),
            Expanded(
              child: BlocBuilder<PauseBloc, PauseState>(
                builder: (context, state) {
                  if (state.status.isLoading) {
                    return Center(
                      child: SpinKitRing(
                        color: AppColor.blue1,
                        size: 30.sp,
                      ),
                    );
                  } else if (state.status.isSuccess) {
                    return ListView.builder(
                      itemCount: state.pauses!
                          .where((pause) => pause.status == "APPROUVE")
                          .where((pause) =>
                              _fromDay.isBefore(pause.to) &&
                              _toDay.isAfter(pause.from))
                          .length,
                      itemBuilder: (context, index) {
                        final pauses = state.pauses
                            ?.where((pause) => pause.status == "APPROUVE")
                            .toList();

                        return EmployeeOnVacation(
                          pause: pauses![index],
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                        'Something went wrong',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    );
                  }
                },
              ),
            ),
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
            InkWell(
              onTap: () => setState(() => _isVisible = !_isVisible),
              child: Row(
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
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                        ),
                        TextSpan(
                          text: '${DateFormat('dd MMMM yyyy', 'fr_FR').format(_fromDay)} ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                        ),
                        TextSpan(
                          text: "- ",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                        ),
                        TextSpan(
                          text: DateFormat('dd MMMM yyyy', 'fr_FR').format(_toDay),
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
            ),
          ]),
        ),
      ),
    );
  }
}
