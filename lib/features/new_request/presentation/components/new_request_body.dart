import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:leave_manager/core/utils/enum/load_status.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/domain/entity/pause_entity.dart';
import '../../../../core/presentation/bloc/auth/auth_bloc.dart';
import '../../../../core/presentation/components/buttons/gradient_button.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../bloc/pause_manage_bloc.dart';
import 'input.dart';

class NewRequestBody extends StatefulWidget {
  const NewRequestBody({super.key});

  @override
  State<NewRequestBody> createState() => _NewRequestBodyState();
}

class _NewRequestBodyState extends State<NewRequestBody> {
  late TextEditingController _causeController;
  late TextEditingController _descriptionController;
  late TextEditingController _fromController;
  late TextEditingController _toController;
  DateTime? _fromDay;
  DateTime? _toDay;

  @override
  void initState() {
    _causeController = TextEditingController();
    _descriptionController = TextEditingController();
    _fromController = TextEditingController();
    _toController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PauseManageBloc, PauseManageState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          Alert(
            context: context,
            style: AlertStyle(
              animationType: AnimationType.fromBottom,
              overlayColor: Colors.white.withOpacity(0.6),
              isCloseButton: false,
              isOverlayTapDismiss: true,
              descStyle: Theme.of(context).textTheme.bodyMedium!,
              descTextAlign: TextAlign.start,
              animationDuration: const Duration(milliseconds: 400),
              alertBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
              titleStyle: Theme.of(context).textTheme.bodyLarge!,
              alertAlignment: Alignment.topCenter,
            ),
            type: AlertType.success,
            title: "Bien envoyé",
            desc: "Votre demande de pause est bien envoyé",
            buttons: [
              DialogButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                color: Colors.white,
                radius: BorderRadius.circular(8.r),
                border: const Border.fromBorderSide(
                  BorderSide(
                    color: AppColor.blue1,
                  ),
                ),
                child: Text(
                  "OK",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColor.blue1,
                  ),
                ),
              ),
            ],
          ).show();
        }
      },
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            height: MediaQuery.sizeOf(context).height,
          ),
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
                      Input(
                        controller: _causeController,
                        label: 'Cause',
                        icon: Icons.grid_view,
                      ),
                      Input(
                        controller: _descriptionController,
                        label: 'Description',
                        icon: Icons.file_copy_outlined,
                      ),
                      Input(
                        controller: _fromController,
                        label: 'De',
                        showCursor: false,
                        readOnly: true,
                        icon: Icons.calendar_today_outlined,
                      ),
                      TableCalendar(
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
                          if (_fromDay == null) {
                            setState(() {
                              _fromDay = selectedDay;
                              _fromController.text =
                                  DateFormat('d MMMM yyyy', 'fr_FR')
                                      .format(selectedDay);
                            });
                          } else {
                            setState(() {
                              _toController.text =
                                  DateFormat('d MMMM yyyy', 'fr_FR')
                                      .format(selectedDay);
                              _toDay = selectedDay;
                            });
                          }
                        },
                      ),
                      Input(
                        controller: _toController,
                        label: "Jusqu'au",
                        readOnly: true,
                        showCursor: false,
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
                  child: BlocBuilder<PauseManageBloc, PauseManageState>(
                    builder: (context, state) => GradientButton(
                      onPressed: () {
                        context.read<PauseManageBloc>().add(
                              PauseInsertionEvent(
                                pause: PauseEntity(
                                  user:
                                      context.read<AuthBloc>().state.currentUser!,
                                  from: _fromDay!,
                                  to: _toDay!,
                                  reason: _causeController.text,
                                  description: _descriptionController.text,
                                  status: 'EN ATTENTE',
                                ),
                              ),
                            );
                      },
                      text: 'DEMANDER',
                      fixedHeight: 46.h,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      colors: const [
                        AppColor.blue2,
                        AppColor.blue1,
                      ],
                      child: state.status.isLoading ? SpinKitWave(
                        color: Colors.white,
                        size: 20.sp,
                      ) : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
