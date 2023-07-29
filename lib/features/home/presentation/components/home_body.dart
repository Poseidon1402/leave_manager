import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:leave_manager/core/utils/enum/load_status.dart';

import '../../../../core/presentation/bloc/pause/pause_bloc.dart';
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
  void initState() {
    context.read<PauseBloc>().add(PauseFetchingEvent());
    super.initState();
  }

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
            SizedBox(
              height: 23.h,
            ),
            Expanded(
              child:
                  BlocBuilder<PauseBloc, PauseState>(builder: (context, state) {
                if (state.status.isLoading) {
                  return Center(
                    child: SpinKitRing(
                      color: AppColor.blue1,
                      size: 30.sp,
                    ),
                  );
                } else if (state.status.isSuccess) {
                  final allPauses = state.pauses?.where((pause) =>
                      pause.user.email ==
                      FirebaseAuth.instance.currentUser?.email);
                  return ListView.builder(
                    itemCount: _selected == 'Tout'
                        ? allPauses?.length
                        : allPauses
                            ?.where((pause) => _selected == 'APPROUVE'
                                ? pause.status == 'APPROUVE'
                                : pause.status != 'APPROUVE')
                            .where((pause) =>
                                pause.user.email ==
                                FirebaseAuth.instance.currentUser?.email)
                            .length,
                    itemBuilder: (context, index) {
                      final pauses = _selected == 'Tout'
                          ? state.pauses
                              ?.where((pause) =>
                                  pause.user.email ==
                                  FirebaseAuth.instance.currentUser?.email)
                              .toList()
                          : allPauses
                              ?.where((pause) => _selected == 'APPROUVE'
                                  ? pause.status == 'APPROUVE'
                                  : pause.status != 'APPROUVE')
                              .where((pause) =>
                                  pause.user.email ==
                                  FirebaseAuth.instance.currentUser?.email).toList();
                      return Pause(
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
              }),
            ),
          ],
        ),
      ),
    );
  }
}
