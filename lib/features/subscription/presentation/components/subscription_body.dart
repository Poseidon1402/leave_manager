import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:leave_manager/core/utils/enum/load_status.dart';

import '../../../../core/domain/entity/department_entity.dart';
import '../../../../core/domain/entity/user_entity.dart';
import '../../../../core/presentation/bloc/auth/auth_bloc.dart';
import '../../../../core/presentation/components/buttons/gradient_button.dart';
import '../../../../core/presentation/components/input/rounded_text_field.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/route_name.dart';

class SubscriptionBody extends StatefulWidget {
  const SubscriptionBody({super.key});

  @override
  State<SubscriptionBody> createState() => _SubscriptionBodyState();
}

class _SubscriptionBodyState extends State<SubscriptionBody> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;
  late TextEditingController _departmentController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    _departmentController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state.status.isSuccess) {
          context.go(RouteName.home);
        } else if(state.status.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.8,
          ),
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
              Flexible(
                flex: 4,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RoundedTextField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        hintText: 'Nom complet',
                      ),
                      RoundedTextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Email',
                      ),
                      RoundedTextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        hintText: 'Tel',
                      ),
                      RoundedTextField(
                        controller: _departmentController,
                        keyboardType: TextInputType.name,
                        hintText: 'Departement',
                      ),
                      RoundedTextField(
                        controller: _passwordController,
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
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) => GradientButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  AuthEventSubscribe(
                                    user: UserEntity(
                                      fullName: _nameController.text,
                                      email: _emailController.text,
                                      phone: _phoneController.text,
                                      role: 'USER',
                                      department: DepartmentEntity(
                                        name: _departmentController.text,
                                      ),
                                    ),
                                    password: _passwordController.text,
                                  ),
                                );
                          },
                          text: "S'INSCRIRE",
                          fixedHeight: 46.h,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          colors: const [
                            AppColor.red1,
                            AppColor.red2,
                          ],
                          child: state.status.isLoading ? SpinKitThreeBounce(
                            color: Colors.white,
                            size: 30.r,
                          ) : null,
                        ),
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.push(RouteName.auth),
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
        ),
      ),
    );
  }
}
