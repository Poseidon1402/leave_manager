import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/presentation/components/buttons/app_outlined_button.dart';
import '../../core/presentation/components/buttons/gradient_button.dart';
import '../../core/utils/constants/app_color.dart';
import '../../core/utils/constants/route_name.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/Leave manager.webp',
          width: 179.w,
          height: 46.h,
          fit: BoxFit.fill,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(child: SizedBox()),
            Flexible(
              flex: 5,
              child: Image.asset(
                'assets/Leave manager img.webp',
                width: 468.w,
                height: 351.h,
              ),
            ),
            Flexible(
              flex: 2,
              child: FractionallySizedBox(
                widthFactor: 0.85,
                child: Column(
                  children: [
                    Text(
                      "Optimisez la gestion de vos congés grâce à LeaveManager\n",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Gagnez du temps et simplifiez vos processus de demande de congé avec une interface simple et intuitive.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: GradientButton(
                      onPressed: () => context.push(RouteName.auth),
                      text: 'SE CONNECTER',
                      fixedHeight: 46.h,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      colors: const [
                        AppColor.blue2,
                        AppColor.blue1,
                      ],
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: AppOutlinedButton(
                      onPressed: () => context.push(RouteName.subscription),
                      borderColor: AppColor.blue1,
                      fixedHeight: 46.h,
                      text: "S'INSCRIRE",
                      borderWidth: 2.sp,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      textColor: AppColor.blue1,
                    ),
                  ),
                ],
              ),
            ),
            const Flexible(child: SizedBox()),
          ],
        ),
      ),
      backgroundColor: AppColor.white1,
    );
  }
}
