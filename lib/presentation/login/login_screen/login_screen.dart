import 'package:eduvibe/core/cubit/AuthCubit.dart';
import 'package:eduvibe/core/cubit/AuthState.dart';
import 'package:eduvibe/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/route/routes.dart';
import '../../../core/theme/assets.dart';
import '../../../core/theme/ev_colors.dart';
import '../../../core/widget/primary_button.dart';
import '../../../core/widget/primary_textfield.dart';
import '../../../core/widget/spacers.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController email = TextEditingController();


  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
        create: (context)=>AuthCubit(),
      child: BlocConsumer<AuthCubit,AuthState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: isDarkMode
                ? EVColors.backgroundDark
                : EVColors.backgroundLight,
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListView(
                  children: [
                    verticalSpacer(30),

                    SvgPicture.asset(
                      Assets.book,
                      width: 64.w,
                      height: 64.h,
                      theme: SvgTheme(currentColor:isDarkMode
                          ? EVColors.primaryDark
                          : EVColors.primaryLight, ),
                    ),
                    verticalSpacer(20),

                    Column(
                      children: [
                        Text(
                          AppLocalizations.current.login,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: isDarkMode
                                ? EVColors.onBackground60Dark
                                : EVColors.onBackground60Light,
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(20),

                    PrimaryTextField(
                      hintText: AppLocalizations.current.email,
                      numForm: 24,
                      backgroundColor: isDarkMode
                          ? EVColors.backgroundDark
                          : EVColors.backgroundLight,
                      borderColor: isDarkMode
                          ? EVColors.onBackground16Dark
                          : EVColors.onBackground16Light,
                      hintColor: isDarkMode
                          ? EVColors.onBackground37Dark
                          : EVColors.onBackground37Light,
                      textColor: isDarkMode
                          ? EVColors.onBackground87Dark
                          : EVColors.primaryLight,
                      width: 30.w,
                      controller: email,
                      valid: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.current.fieldRequired;
                        } else if (value.length <= 5) {
                          return AppLocalizations.current.uTypedLessThan5ch;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    verticalSpacer(20),

                    PrimaryTextField(
                      hintText: AppLocalizations.current.password,
                      numForm: 24,
                      obscureText: AuthCubit.get(context).isPass,
                      backgroundColor: isDarkMode
                          ? EVColors.backgroundDark
                          : EVColors.backgroundLight,
                      borderColor: isDarkMode
                          ? EVColors.onBackground16Dark
                          : EVColors.onBackground16Light,
                      hintColor: isDarkMode
                          ? EVColors.onBackground37Dark
                          : EVColors.onBackground37Light,
                      textColor: isDarkMode
                          ? EVColors.onBackground87Dark
                          : EVColors.primaryLight,
                      width: 30.w,
                      suffix: IconButton(
                          onPressed: () {
                            AuthCubit.get(context).changePass();
                          },
                          icon:  Icon(
                            AuthCubit.get(context).suffix,
                            color: EVColors.onBackground60Light,
                          )),
                      controller: _pass,
                      valid: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.current.fieldRequired;
                        } else if (value.length <= 7) {
                          return AppLocalizations.current.passwordShouldContainMore8ch;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                    ),

                    verticalSpacer(10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, Routes.forgetPasswordScreen);

                            },
                            child:  Text(
                              AppLocalizations.current.forgetPass,
                              style:
                              TextStyle(
                                  color: isDarkMode
                                      ? EVColors.onBackground37Dark
                                      : EVColors.onBackground37Light,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(40),
                    PrimaryButton(
                      textColor: isDarkMode
                          ? EVColors.backgroundLight
                          : EVColors.backgroundLight,
                      backgroundColor: isDarkMode
                          ? EVColors.primaryDark
                          : EVColors.primaryLight,


                      text: AppLocalizations.current.login,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, Routes.mainScreen);
                        }
                      },
                    ),

                    verticalSpacer(20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.current.dontHaveAccount,
                          style: TextStyle(
                              color: isDarkMode
                                  ? EVColors.backgroundLight
                                  : EVColors.onBackground60Light,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, Routes.signUpScreen);

                          },
                          child: Text(
                            AppLocalizations.current.signUp,
                            style:
                            TextStyle(color: isDarkMode
                                ? EVColors.primaryDark
                                : EVColors.primaryLight, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(50),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
