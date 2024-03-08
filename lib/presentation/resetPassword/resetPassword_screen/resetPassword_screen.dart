import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/route/routes.dart';
import '../../../core/theme/assets.dart';
import '../../../core/theme/ev_colors.dart';
import '../../../core/widget/primary_button.dart';
import '../../../core/widget/primary_textfield.dart';
import '../../../core/widget/spacers.dart';
import '../../../generated/l10n.dart';

class ResetPasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _repeatedPass = TextEditingController();

  ResetPasswordScreen({super.key});

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
                    AppLocalizations.current.resetPass,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isDarkMode
                            ? EVColors.onBackground87Dark
                            : EVColors.onBackground87Light,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                ],
              ),
              verticalSpacer(20),

              PrimaryTextField(
                hintText: AppLocalizations.current.password,
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
                suffix: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye_outlined,
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
              verticalSpacer(20),

              PrimaryTextField(
                width: 30.w,
                hintText: AppLocalizations.current.confirmPass,
                numForm: 24,
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye_outlined,
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
              verticalSpacer(60),

              PrimaryButton(
                textColor: isDarkMode
                    ? EVColors.backgroundLight
                    : EVColors.backgroundLight,
                backgroundColor: isDarkMode
                    ? EVColors.primaryDark
                    : EVColors.primaryLight,
                text: AppLocalizations.current.update,
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
