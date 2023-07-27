import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../core/presentation/bloc/auth/auth_bloc.dart';
import '../../../core/utils/constants/app_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.currentUser!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.close,
            color: const Color.fromRGBO(84, 84, 84, 1),
            size: 25.sp,
          ),
        ),
        title: const Text('Mon profil'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.4,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.1],
                    colors: [
                      Colors.transparent,
                      Colors.white,
                    ]
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 33.r,
                      child: CircleAvatar(
                        backgroundColor: AppColor.blue1,
                        radius: 31.r,
                        child: Text(
                          user.fullName![0],
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                    Text(
                      user.fullName ?? '',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 14.sp,
                          ),
                    ),
                    Text(
                      user.department?.name ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        size: 18.sp,
                        color: AppColor.blue1,
                      ),
                      label: Text(
                        'Modifier',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColor.blue1,
                        ),
                      ),
                    ),
                    QrImageView(
                      data: user.email,
                      version: QrVersions.auto,
                      size: 200.sp,
                    ),
                  ],
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.ios_share_rounded,
                size: 18.sp,
                color: const Color.fromRGBO(84, 84, 84, 1),
              ),
              label: Text(
                'Partager mon code',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.file_download,
                size: 18.sp,
                color: const Color.fromRGBO(84, 84, 84, 1),
              ),
              label: Text(
                'Enregistrer sur mon phone',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColor.white1,
    );
  }
}
