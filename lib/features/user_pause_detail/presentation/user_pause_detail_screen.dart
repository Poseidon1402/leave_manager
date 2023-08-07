import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/constants/app_color.dart';
import 'widgets/user_pause_detail_body.dart';

class UserPauseDetailScreen extends StatelessWidget {
  const UserPauseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20.sp,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: const UserPauseDetailBody(),
      backgroundColor: AppColor.white1,
    );
  }
}