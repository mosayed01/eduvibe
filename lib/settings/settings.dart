import 'package:eduvibe/core/route/routes.dart';
import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:eduvibe/core/widget/spacers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/theme/assets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _controller = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVColors.backgroundLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpacer(24.h),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.profileScreen);
                },
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.h),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.person,
                          width: 21.5.w,
                          height: 21.5.h,
                        ),
                        horizontalSpacer(8.w),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: EVColors.onBackground87Light,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: EVColors.onBackground16Light,
                    ),
                  ),
                ),
              ),
              verticalSpacer(24.h),
              Container(
                width: double.infinity,
                height: 56.h,
                child: Padding(
                  padding: EdgeInsets.all(16.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.theme,
                            width: 21.5.w,
                            height: 21.5.h,
                          ),
                          horizontalSpacer(8.w),
                          Text(
                            'Theme',
                            style: TextStyle(
                                color: EVColors.onBackground87Light,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      AdvancedSwitch(
                        controller: _controller,
                        activeColor: EVColors.primaryLight,
                        inactiveColor: Colors.grey,
                        borderRadius:
                            BorderRadius.all(const Radius.circular(100)),
                        width: 35.0,
                        height: 20.0,
                        enabled: true,
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: EVColors.onBackground16Light,
                  ),
                ),
              ),
              verticalSpacer(24.h),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        backgroundColor: EVColors.backgroundLight,
                        title: Text(
                          'Select Language',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: EVColors.onBackground87Light),
                        ),
                        children: <Widget>[
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context, Routes.settingsScreen);
                            },
                            child: const Text(
                              'English',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: EVColors.onBackground87Light),
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context, Routes.settingsScreen);
                            },
                            child: const Text(
                              'Arabic',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: EVColors.onBackground87Light),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.h),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.lang,
                          width: 21.5.w,
                          height: 21.5.h,
                        ),
                        horizontalSpacer(8.w),
                        Text(
                          'Language',
                          style: TextStyle(
                              color: EVColors.onBackground87Light,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: EVColors.onBackground16Light,
                    ),
                  ),
                ),
              ),
              verticalSpacer(24.h),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.notificationsSettingsScreen);
                },
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.h),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.notificationsSettings,
                          width: 21.5.w,
                          height: 21.5.h,
                        ),
                        horizontalSpacer(8.w),
                        Text(
                          'Notifications',
                          style: TextStyle(
                              color: EVColors.onBackground87Light,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: EVColors.onBackground16Light,
                    ),
                  ),
                ),
              ),
              verticalSpacer(24.h),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.h),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.help,
                          width: 21.5.w,
                          height: 21.5.h,
                        ),
                        horizontalSpacer(8.w),
                        Text(
                          'Help',
                          style: TextStyle(
                              color: EVColors.onBackground87Light,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: EVColors.onBackground16Light,
                    ),
                  ),
                ),
              ),
              verticalSpacer(24.h),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.h),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.logout,
                          width: 21.5.w,
                          height: 21.5.h,
                        ),
                        horizontalSpacer(8.w),
                        Text(
                          'Logout',
                          style: TextStyle(
                              color: EVColors.onBackground87Light,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: EVColors.onBackground16Light,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
