import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/components/buttons/gradient_button.dart';
import '../../../../core/presentation/components/input/rounded_text_field.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/route_name.dart';

class SubscriptionBody extends StatelessWidget {
  const SubscriptionBody({super.key});

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
                    'Créer votre compte',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Nous sommes ravis de vous accueillir dans notre application mobile.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black.withOpacity(0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const Flexible(
            flex: 4,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RoundedTextField(
                    keyboardType: TextInputType.name,
                    hintText: 'Nom complet',
                  ),
                  RoundedTextField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email',
                  ),
                  RoundedTextField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Tel',
                  ),
                  RoundedTextField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Departement',
                  ),
                  RoundedTextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    hintText: 'Mot de passe',
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: GradientButton(
                    onPressed: () => context.push(RouteName.home),
                    text: "S'INSCRIRE",
                    fixedHeight: 46.h,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    colors: const [
                      AppColor.red1,
                      AppColor.red2,
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
                        text: "Vous avez déjà un compte ?",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      TextSpan(
                        text: " Se connecter",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.blue1,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () => context.push(RouteName.auth),
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