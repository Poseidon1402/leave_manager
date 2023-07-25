import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app_theme.dart';
import 'core/navigation/app_router.dart';
import 'core/presentation/bloc/auth/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await Firebase.initializeApp();
  runApp(const LeaveManager());
}

class LeaveManager extends StatelessWidget {
  const LeaveManager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp.router(
          title: 'Za Mandresy',
          theme: AppTheme.customTheme(),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.configurations,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('fr', ''),
          ],
        ),
        designSize: const Size(428, 926),
      ),
    );
  }
}