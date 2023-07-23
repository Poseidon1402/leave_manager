import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/components/buttons/gradient_button.dart';
import '../../../../core/presentation/components/input/rounded_text_field.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/route_name.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
          ),
          Flexible(
            flex: 2,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const RoundedTextField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email ou numéro de tel',
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  const RoundedTextField(
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
          ),
          Flexible(
            flex: 3,
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: GradientButton(
                    onPressed: () => context.push(RouteName.home),
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
          ),
          const Flexible(child: SizedBox()),
        ],
      ),
    );
  }
}
