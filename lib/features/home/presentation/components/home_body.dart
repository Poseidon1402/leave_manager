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
            Expanded(
              child: BlocBuilder<PauseBloc, PauseState>(
                bloc: context.read<PauseBloc>()..add(PauseFetchingEvent()),
                builder: (context, state) {
                  if(state.status.isLoading) {
                    return Center(
                      child: SpinKitRing(
                        color: AppColor.blue1,
                        size: 30.sp,
                      ),
                    );
                  } else if(state.status.isSuccess) {
                    return ListView.builder(
                      itemCount: state.pauses?.length,
                      itemBuilder: (context, index) {
                        return Pause(
                          pause: state.pauses![index],
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
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
