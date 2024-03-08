import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import '../../../core/route/routes.dart';
import '../../../core/theme/assets.dart';
import '../../../core/theme/ev_colors.dart';
import '../../../core/widget/primary_button.dart';
import '../../../core/widget/spacers.dart';
import '../../../generated/l10n.dart';

class OTPScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();

  OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
                    AppLocalizations.current.verificationCode,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isDarkMode
                            ? EVColors.backgroundLight
                            : EVColors.onBackground87Light,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                  verticalSpacer(20),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0.w),
                    child: Text(
                      AppLocalizations.current.weSend,
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
                child: Pinput(
                  onCompleted: (pin) => print(pin),
                  length: 5,
                  keyboardType: TextInputType.number,
                  focusedPinTheme: PinTheme(
                      height: 55.h,
                      width: 55.w,
                      textStyle:  TextStyle(color: isDarkMode
                          ? EVColors.onBackground87Dark
                          : EVColors.onBackground87Light,fontSize: 16),
                      decoration: BoxDecoration(
                          color: isDarkMode
                              ? EVColors.backgroundDark
                              : EVColors.backgroundLight,
                          borderRadius: BorderRadius.circular(16),
                          border:
                              Border.all(color: isDarkMode
                                  ? EVColors.onBackground16Dark
                                  : EVColors.onBackground16Light,))),
                  followingPinTheme: PinTheme(
                      height: 55.h,
                      width: 55.w,
                      textStyle:  TextStyle(color: isDarkMode
                          ? EVColors.onBackground87Dark
                          : EVColors.onBackground87Light,fontSize: 16),

                      decoration: BoxDecoration(
                          color: isDarkMode
                              ? EVColors.backgroundDark
                              : EVColors.backgroundLight,
                          borderRadius: BorderRadius.circular(16),
                          border:
                          Border.all(color: isDarkMode
                              ? EVColors.onBackground16Dark
                              : EVColors.onBackground16Light,))),
                  submittedPinTheme: PinTheme(
                      height: 55.h,
                      width: 55.w,
                      textStyle:  TextStyle(color: isDarkMode
                          ? EVColors.onBackground87Dark
                          : EVColors.onBackground87Light,fontSize: 16),

                      decoration: BoxDecoration(
                          color: isDarkMode
                              ? EVColors.backgroundDark
                              : EVColors.backgroundLight,
                          borderRadius: BorderRadius.circular(16),
                          border:
                          Border.all(color: isDarkMode
                              ? EVColors.onBackground16Dark
                              : EVColors.onBackground16Light,))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.current.pinRequired;
                    } else if (value.length <= 4) {
                      return AppLocalizations.current.pinContain5;
                    }
                    return null;
                  },
                ),
              ),
              verticalSpacer(20),

              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Text(
                      AppLocalizations.current.dontGetCode,
                      style: TextStyle(
                          color: isDarkMode
                              ? EVColors.backgroundLight
                              : EVColors.onBackground60Light,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.otpScreen);
                      },
                      child:  Text(
                        AppLocalizations.current.resend,
                        style:  TextStyle(color: isDarkMode
                            ? EVColors.primaryDark
                            : EVColors.primaryLight, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(40),
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
                    Navigator.pushReplacementNamed(context, Routes.resetPasswordScreen);
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
