import 'package:eduvibe/core/cubit/AuthCubit.dart';
import 'package:eduvibe/core/cubit/AuthState.dart';
import 'package:eduvibe/core/theme/assets.dart';
import 'package:eduvibe/core/widget/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../core/route/routes.dart';
import '../../../core/theme/ev_colors.dart';
import '../../../core/widget/primary_button.dart';
import '../../../core/widget/spacers.dart';
import '../../../generated/l10n.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController _repeatedPass = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController user = TextEditingController();
  final TextEditingController user1 = TextEditingController();
  final List<String> _university = [
    'Cairo University',
    'Alexandria University',
    'Tanta University',
    'ELmansoura University',
  ];

  SignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;


    return BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: isDarkMode
                  ? EVColors.backgroundDark
                  : EVColors.backgroundLight,
              body: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ListView(
                    children: [
                      verticalSpacer(30),
                      SvgPicture.asset(
                        Assets.book,
                        width: 64.w,
                        height: 64.h,
                        theme: SvgTheme(
                          currentColor: isDarkMode
                              ? EVColors.primaryDark
                              : EVColors.primaryLight,
                        ),
                      ),
                      verticalSpacer(20),

                      Column(
                        children: [
                          Text(
                            AppLocalizations.current.signUp,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: isDarkMode
                                          ? EVColors.onBackground60Dark
                                          : EVColors.onBackground60Light,
                                    ),
                          ),
                        ],
                      ),
                      verticalSpacer(20),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: PrimaryTextField(
                                hintText: AppLocalizations.current.firstName,
                                numForm: 26,
                                backgroundColor: isDarkMode
                                    ? EVColors.backgroundDark
                                    : EVColors.backgroundLight,
                                hintColor: isDarkMode
                                    ? EVColors.onBackground37Dark
                                    : EVColors.onBackground37Light,
                                textColor: isDarkMode
                                    ? EVColors.onBackground87Dark
                                    : EVColors.primaryLight,
                                borderColor: isDarkMode
                                    ? EVColors.onBackground16Dark
                                    : EVColors.onBackground16Light,
                                width: 10.w,
                                // just 14
                                controller: user,
                                valid: (value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.current.fieldRequired;
                                  } else if (value.length <= 2) {
                                    return AppLocalizations.current.uTypedLessThan2ch;
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            // horizontalSpacer(2),
                            Expanded(
                              child: PrimaryTextField(
                                hintText: AppLocalizations.current.lastName,
                                numForm: 26,
                                borderColor: isDarkMode
                                    ? EVColors.onBackground16Dark
                                    : EVColors.onBackground16Light,
                                backgroundColor: isDarkMode
                                    ? EVColors.backgroundDark
                                    : EVColors.backgroundLight,
                                hintColor: isDarkMode
                                    ? EVColors.onBackground37Dark
                                    : EVColors.onBackground37Light,
                                textColor: isDarkMode
                                    ? EVColors.onBackground87Dark
                                    : EVColors.primaryLight,
                                width: 10.w,
                                controller: user1,
                                valid: (value) {
                                  if (value!.isEmpty) {
                                    return AppLocalizations.current.fieldRequired;
                                  } else if (value.length <= 2) {
                                    return AppLocalizations.current.uTypedLessThan2ch;
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isDarkMode
                                  ? EVColors.onBackground16Dark
                                  : EVColors.onBackground16Light,
                            ),
                            borderRadius: BorderRadius.circular(35.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InternationalPhoneNumberInput(
                              textFieldController: phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppLocalizations.current.fieldRequired;
                                } else if (value.length <= 11) {
                                  return AppLocalizations.current.uTypedLessThan11ch;
                                }
                                return null;
                              },
                              onInputChanged: (value) {},
                              cursorColor: EVColors.primaryLight,
                              inputDecoration: InputDecoration.collapsed(
                                  hintText:
                                      AppLocalizations.current.phoneNumber,
                                  hintStyle: TextStyle(
                                    color: isDarkMode
                                        ? EVColors.onBackground37Dark
                                        : EVColors.onBackground37Light,
                                  )),
                              keyboardType: TextInputType.phone,
                              ignoreBlank: true,
                              selectorConfig: const SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DIALOG),
                              textStyle: TextStyle(
                                color: isDarkMode
                                    ? EVColors.onBackground87Dark
                                    : EVColors.primaryLight,
                                fontSize: 16,
                              ),
                              selectorTextStyle: TextStyle(
                                color: isDarkMode
                                    ? EVColors.onBackground87Dark
                                    : EVColors.onBackground87Light,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      verticalSpacer(20),

                      /////////////////////////////////////////////////////////
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: isDarkMode
                                  ? EVColors.backgroundDark
                                  : EVColors.backgroundLight,
                              borderRadius: BorderRadius.circular(35.r),
                              border: Border.all(
                                color: isDarkMode
                                    ? EVColors.onBackground16Dark
                                    : EVColors.onBackground16Light,
                              )),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              focusColor: Colors.transparent,
                              value: AuthCubit.get(context).selectedUniversity,
                              onChanged: (newValue) {
                                AuthCubit.get(context).changeOption(newValue);
                              },
                              dropdownColor: isDarkMode
                                  ? EVColors.backgroundDark
                                  : EVColors.backgroundLight,
                              isExpanded: true,
                              icon: const SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                color: isDarkMode
                                    ? EVColors.backgroundLight
                                    : EVColors.onBackground37Light,
                                fontSize: 16,
                              ),
                              hint: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 13.w),
                                child: Text(
                                  AppLocalizations.current.university,
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? EVColors.onBackground37Dark
                                        : EVColors.onBackground37Light,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              items: _university.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0.w),
                                      child: Text(
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: isDarkMode
                                              ? EVColors.onBackground37Dark
                                              : EVColors.onBackground37Light,
                                        ),
                                        value,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                    // Your other widgets...
                    child: (!_university.contains(AuthCubit.get(context).selectedUniversity)) ? const Padding(
                      padding: EdgeInsets.only(bottom: 8.0, left: 40),
                      child: Text(
                        'Make sure to choose your university',
                        style: TextStyle(
                            fontSize: 12, color: Colors.red),
                      ),
                    )
                        : Container(),
                  ),
                      /////////////////////////////////////////////////////////
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryTextField(
                        hintText: AppLocalizations.current.email,
                        numForm: 24,
                        backgroundColor: isDarkMode
                            ? EVColors.backgroundDark
                            : EVColors.backgroundLight,
                        hintColor: isDarkMode
                            ? EVColors.onBackground37Dark
                            : EVColors.onBackground37Light,
                        textColor: isDarkMode
                            ? EVColors.onBackground87Dark
                            : EVColors.primaryLight,
                        borderColor: isDarkMode
                            ? EVColors.onBackground16Dark
                            : EVColors.onBackground16Light,
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
                        hintColor: isDarkMode
                            ? EVColors.onBackground37Dark
                            : EVColors.onBackground37Light,
                        textColor: isDarkMode
                            ? EVColors.onBackground87Dark
                            : EVColors.primaryLight,
                        borderColor: isDarkMode
                            ? EVColors.onBackground16Dark
                            : EVColors.onBackground16Light,
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
                          } else if (value == user.text) {
                            return AppLocalizations.current.passwordMatchFirstName;
                          } else if (value == user1.text) {
                            return AppLocalizations.current.passwordMatchLastName;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      verticalSpacer(20),
                      PrimaryTextField(
                        width: 30.w,
                        hintText: AppLocalizations.current.confirmPass,
                        numForm: 24,
                        obscureText: AuthCubit.get(context).isPass2,
                        backgroundColor: isDarkMode
                            ? EVColors.backgroundDark
                            : EVColors.backgroundLight,
                        hintColor: isDarkMode
                            ? EVColors.onBackground37Dark
                            : EVColors.onBackground37Light,
                        borderColor: isDarkMode
                            ? EVColors.onBackground16Dark
                            : EVColors.onBackground16Light,
                        textColor: isDarkMode
                            ? EVColors.onBackground87Dark
                            : EVColors.primaryLight,
                        suffix: IconButton(
                            onPressed: () {
                              AuthCubit.get(context).changePass2();
                            },
                            icon:  Icon(
                              AuthCubit.get(context).suffix2,
                              color: EVColors.onBackground60Light,
                            )),
                        controller: _repeatedPass,
                        valid: (val) {
                          if (val!.isEmpty) {
                            return AppLocalizations.current.fieldRequired;
                          } else if (val != _pass.text) {
                            return AppLocalizations.current.notMatch;
                          } else if (val.length <= 7) {
                            return AppLocalizations.current.passwordShouldContainMore8ch;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      verticalSpacer(40),
                      PrimaryButton(
                        textColor: isDarkMode
                            ? EVColors.backgroundLight
                            : EVColors.backgroundLight,
                        backgroundColor: isDarkMode
                            ? EVColors.primaryDark
                            : EVColors.primaryLight,
                        text: AppLocalizations.current.signUp,
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
                            AppLocalizations.current.alreadyHaveAccount,
                            style: TextStyle(
                                color: isDarkMode
                                    ? EVColors.backgroundLight
                                    : EVColors.onBackground60Light,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.loginScreen);
                            },
                            child: Text(
                              AppLocalizations.current.login,
                              style: TextStyle(
                                  color: isDarkMode
                                      ? EVColors.primaryDark
                                      : EVColors.primaryLight,
                                  fontSize: 12),
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
        ));
  }
}
