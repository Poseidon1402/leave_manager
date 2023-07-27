import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/domain/entity/pause_entity.dart';
import '../../../../core/presentation/bloc/pause/pause_bloc.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../../../new_request/presentation/bloc/pause_manage_bloc.dart';
import 'approbation_button.dart';

class NeedApprobation extends StatelessWidget {
  final PauseEntity pause;

  const NeedApprobation({
    super.key,
    required this.pause,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColor.blue1,
              child: Text(
                pause.user.fullName![0],
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pause.user.fullName!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                  overflow: TextOverflow.fade,
                ),
                Text(
                  pause.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black.withOpacity(0.4),
                      ),
                  overflow: TextOverflow.fade,
                ),
                Text(
                  pause.reason,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColor.blue1,
                        fontWeight: FontWeight.w500,
                      ),
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                ApprobationButton(
                  label: 'Approuver',
                  onPressed: () {
                    context.read<PauseManageBloc>().add(
                          PauseUpdateEvent(
                            id: pause.id as String,
                            status: 'APPROUVE',
                          ),
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColor.green1,
                        content: Text(
                          'La demande a été approuvée',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                    context.read<PauseBloc>().add(PauseFetchingEvent());
                  },
                  backgroundColor: AppColor.green1.withOpacity(0.15),
                  textColor: AppColor.green1,
                  icon: Icons.check,
                  iconColor: AppColor.green2,
                ),
                ApprobationButton(
                  label: 'Refuser',
                  onPressed: () {
                    context.read<PauseManageBloc>().add(
                          PauseUpdateEvent(
                            id: pause.id as String,
                            status: 'REFUSE',
                          ),
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColor.red1,
                        content: Text(
                          'La demande a été refusée',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                    context.read<PauseBloc>().add(PauseFetchingEvent());
                  },
                  backgroundColor: AppColor.red1.withOpacity(0.15),
                  textColor: AppColor.red1,
                  icon: Icons.check,
                  iconColor: AppColor.red1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
