import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:leave_manager/core/utils/enum/load_status.dart';

import '../../../../core/presentation/bloc/auth/auth_bloc.dart';
import '../../../../core/presentation/components/buttons/gradient_button.dart';
import '../../../../core/presentation/components/input/rounded_text_field.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/route_name.dart';

class AuthBody extends StatefulWidget {
  const AuthBody({super.key});

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          if(state.currentUser?.role == "ADMIN") {
            GoRouter.of(context).go(RouteName.admin);
          } else {
            GoRouter.of(context).go(RouteName.home);
          }
        } else if (state.status.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
              backgroundColor: AppColor.red1,
            ),
          );
        }
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: ListView(
          children: [
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 73.h,),
                  Text(
                    'Bonjour à vous !',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Bienvenue dans notre application mobile ! Nous sommes ravis de vous avoir parmi nous.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black.withOpacity(0.8),
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 75.h,),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RoundedTextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email ou numéro de tel',
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  RoundedTextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    hintText: 'Mot de passe',
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    'Mot de passe oublié',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 82.h,),
            Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      switch(state.status) {
                        case LoadStatus.loading :
                          return GradientButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                AuthEventLogin(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            },
                            colors: const [
                              AppColor.blue2,
                              AppColor.blue1,
                            ],
                            child: SpinKitCircle(
                              color: Colors.white,
                              size: 28.r,
                            ),
                          );
                        default :
                          return GradientButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                AuthEventLogin(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            },
                            text: 'SE CONNECTER',
                            fixedHeight: 46.h,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            colors: const [
                              AppColor.blue2,
                              AppColor.blue1,
                            ],
                          );
                      }
                    }
                  ),
                ),
                SizedBox(
                  height: 36.h,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Vous n’avez pas de compte ?",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                      ),
                      TextSpan(
                        text: " S'inscrire",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColor.red1,
                            ),
                        recognizer: TapGestureRecognizer()..onTap = () => context.push(RouteName.subscription),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
