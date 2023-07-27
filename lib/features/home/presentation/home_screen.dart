import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/components/buttons/app_elevated_button.dart';
import '../../../core/utils/constants/app_color.dart';
import '../../../core/utils/constants/route_name.dart';
import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo3.webp',
          width: 67.w,
          height: 67.h,
          fit: BoxFit.cover,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          AppElevatedButton(
            onPressed: () => context.push(RouteName.request),
            backgroundColor: AppColor.blue1,
            borderRadius: 8.r,
            padding: EdgeInsets.all(1.sp),
            child: Icon(
              Icons.more_time,
              size: 46.sp,
            ),
          ),
          GestureDetector(
            onTap: () => context.push(RouteName.profile),
            child: CircleAvatar(
              radius: 47.r,
              backgroundImage: const CachedNetworkImageProvider(
                'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmVzc2lvbmFsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                scale: 5.0,
              ),
            ),
          ),
        ],
      ),
      body: const HomeBody(),
      backgroundColor: AppColor.white1,
    );
  }
}
