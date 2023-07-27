import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/presentation/bloc/pause/pause_bloc.dart';
import '../../../core/utils/constants/app_color.dart';
import '../../admin_approb/presentation/admin_approb_screen.dart';
import '../../vacations_list/presentation/vacation_search_screen.dart';
import '../../vacations_list/presentation/vacations_list_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  static const _screens = [
    AdminApprobScreen(),
    VacationSearchScreen(),
    VacationsListScreen(),
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    context.read<PauseBloc>().add(PauseFetchingEvent());
    super.initState();
  }

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
          CircleAvatar(
            radius: 47.r,
            backgroundImage: const CachedNetworkImageProvider(
              'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmVzc2lvbmFsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
              scale: 5.0,
            ),
          ),
        ],
      ),
      body: _screens[_currentIndex],
      backgroundColor: AppColor.white1,
      bottomNavigationBar: FractionallySizedBox(
        widthFactor: 0.9,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 1.0,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              currentIndex: _currentIndex,
              unselectedFontSize: 0.0,
              onTap: (index) => setState(
                  () => index < 3 ? _currentIndex = index : _currentIndex = 2),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.listCheck,
                    color: AppColor.grey4,
                    size: 39.sp,
                  ),
                  activeIcon: Icon(
                    FontAwesomeIcons.listCheck,
                    color: AppColor.blue1,
                    size: 39.sp,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.solidCalendar,
                    color: AppColor.grey4,
                    size: 39.sp,
                  ),
                  activeIcon: Icon(
                    FontAwesomeIcons.solidCalendar,
                    color: AppColor.blue1,
                    size: 39.sp,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.clipboardList,
                    color: AppColor.grey4,
                    size: 39.sp,
                  ),
                  activeIcon: Icon(
                    FontAwesomeIcons.clipboardList,
                    color: AppColor.blue1,
                    size: 39.sp,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings_sharp,
                    color: AppColor.grey4,
                    size: 39.sp,
                  ),
                  activeIcon: Icon(
                    Icons.settings_sharp,
                    color: AppColor.blue1,
                    size: 39.sp,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
