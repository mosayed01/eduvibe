import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../core/route/routes.dart';
import '../../../core/theme/assets.dart';
import '../../../core/theme/ev_colors.dart';
import '../../../core/widget/primary_button.dart';
import '../../../core/widget/spacers.dart';
import '../../../generated/l10n.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController phone = TextEditingController();


  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor: isDarkMode
          ? EVColors.backgroundDark
          : EVColors.backgroundLight,
      body: Form(
        key: formKey,
        child: Padding(
          padding:  EdgeInsets.all(4.0),
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
                    AppLocalizations.current.forgetPass,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: isDarkMode
                          ? EVColors.onBackground60Dark
                          : EVColors.onBackground60Light,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  verticalSpacer(20),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0.w),
                    child: Text(
                      AppLocalizations.current.enterPhoneNum,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isDarkMode
                            ? EVColors.onBackground60Dark
                            : EVColors.onBackground60Light,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpacer(20),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.w),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: isDarkMode
                        ? EVColors.onBackground16Dark
                        : EVColors.onBackground16Light,),
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
                      inputDecoration:  InputDecoration.collapsed(
                          hintText: AppLocalizations.current.phoneNumber,
                          hintStyle:
                          TextStyle(color: isDarkMode
                              ? EVColors.onBackground37Dark
                              : EVColors.onBackground37Light,)),
                      keyboardType: TextInputType.phone,
                      ignoreBlank: true,
                      selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.DIALOG),
                      textStyle:  TextStyle(
                        color: isDarkMode
                            ? EVColors.onBackground87Dark
                            : EVColors.primaryLight,
                        fontSize: 16,
                      ),
                      selectorTextStyle:  TextStyle(
                        color: isDarkMode
                            ? EVColors.onBackground87Dark
                            : EVColors.onBackground87Light,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpacer(60),
              PrimaryButton(
                textColor: isDarkMode
                    ? EVColors.backgroundLight
                    : EVColors.backgroundLight,
                backgroundColor: isDarkMode
                    ? EVColors.primaryDark
                    : EVColors.primaryLight,


                text: AppLocalizations.current.confirm,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, Routes.otpScreen);
                  }
                },
              ),
              verticalSpacer(50),
            ],
          ),
        ),
      ),
    );
  }
}
