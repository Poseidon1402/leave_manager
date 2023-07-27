import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:leave_manager/core/utils/enum/load_status.dart';

import '../../../core/presentation/bloc/pause/pause_bloc.dart';
import '../../../core/presentation/components/others/app_filter_chip.dart';
import '../../../core/utils/constants/app_color.dart';
import '../../new_request/presentation/bloc/pause_manage_bloc.dart';
import 'components/need_approbation.dart';

class AdminApprobScreen extends StatefulWidget {
  const AdminApprobScreen({super.key});

  @override
  State<AdminApprobScreen> createState() => _AdminApprobScreenState();
}

class _AdminApprobScreenState extends State<AdminApprobScreen> {
  String _department = "Social";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PauseManageBloc(),
      child: Container(
        constraints: const BoxConstraints.expand(),
        color: AppColor.white1,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Demande de pauses',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Departement',
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
                        onSelected: (value) =>
                            setState(() => _department = "Social"),
                        width: 90.w,
                        selected: _department == "Social",
                        label: 'Social',
                        selectedTextColor: AppColor.blue1,
                        textColor: AppColor.grey1,
                        unselectedBackgroundColor: AppColor.white1,
                        unselectedBorderColor: AppColor.white1,
                        fontWeight: FontWeight.w600,
                      ),
                      AppFilterChip(
                        onSelected: (value) =>
                            setState(() => _department = "Informatique"),
                        width: 90.w,
                        selected: _department == "Informatique",
                        label: 'Informatique',
                        selectedTextColor: AppColor.blue1,
                        textColor: AppColor.grey1,
                        unselectedBackgroundColor: AppColor.white1,
                        unselectedBorderColor: AppColor.white1,
                        fontWeight: FontWeight.w600,
                      ),
                      AppFilterChip(
                        onSelected: (value) =>
                            setState(() => _department = "Commerce"),
                        width: 90.w,
                        selected: _department == "Commerce",
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
                              .where((pause) =>
                                  pause.user.department!.name == _department)
                              .isNotEmpty
                          ? state.pauses!
                              .where((pause) =>
                                  pause.user.department!.name == _department)
                              .where((pause) => pause.status == "EN ATTENTE")
                              .length
                          : 0,
                      itemBuilder: (context, index) {
                        final pauses = state.pauses
                            ?.where((pause) => pause.status == "EN ATTENTE")
                            .toList();

                        return NeedApprobation(
                          pause: pauses!
                              .where((pause) =>
                                  pause.user.department!.name == _department)
                              .toList()[index],
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
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
