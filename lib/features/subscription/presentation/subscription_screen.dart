import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constants/app_color.dart';
import 'components/subscription_body.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo1.webp',
          width: 179.w,
          height: 46.h,
          fit: BoxFit.fill,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: const SubscriptionBody(),
      backgroundColor: AppColor.white1,
    );
  }
}