import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/assets.dart';
import '../../core/theme/ev_colors.dart';
import '../../core/widget/spacers.dart';

class NotificationsSettingsScreen extends StatelessWidget {
   NotificationsSettingsScreen({Key? key}) : super(key: key);
  final _controller1 = ValueNotifier<bool>(false);
  final _controller2 = ValueNotifier<bool>(false);
  final _controller3 = ValueNotifier<bool>(false);

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
              Container(
                width: double.infinity,
                height: 90.h,
                child: Padding(
                  padding:  EdgeInsets.all(16.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            Assets.notificationsSettings,
                            width: 20.5.w,
                            height: 20.5.h,
                          ),
                          horizontalSpacer(8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Updates',
                                style: TextStyle(
                                    color: EVColors.onBackground87Light,
                                    fontWeight: FontWeight.w600,fontSize: 16),
                              ),
                              verticalSpacer(8.h),
                              Container(
                                width: 220.w,
                                child: Text(
                                  'Receive notifications  about any updates',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: EVColors.onBackground60Light,
                                      fontWeight: FontWeight.w500,fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      AdvancedSwitch(
                        controller: _controller1,
                        activeColor: EVColors.primaryLight,
                        inactiveColor: Colors.grey,
                        borderRadius: BorderRadius.all(const Radius.circular(100)),
                        width: 35.0,
                        height:20.0,
                        enabled: true,

                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: EVColors.onBackground16Light,
                  ),
                ),
              ),
              verticalSpacer(24.h),
              Container(
                width: double.infinity,
                height: 110.h,
                child: Padding(
                  padding:  EdgeInsets.all(16.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            Assets.notificationsSettings,
                            width: 20.5.w,
                            height: 20.5.h,
                          ),
                          horizontalSpacer(8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Study Reminders',
                                style: TextStyle(
                                    color: EVColors.onBackground87Light,
                                    fontWeight: FontWeight.w600,fontSize: 16),
                              ),
                              verticalSpacer(8.h),
                              Container(
                                width: 220.w,
                                child: Text(
                                  'Receive notifications that remind you to study at time you set',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: EVColors.onBackground60Light,
                                      fontWeight: FontWeight.w500,fontSize: 12,),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      AdvancedSwitch(
                        controller: _controller2,
                        activeColor: EVColors.primaryLight,
                        inactiveColor: Colors.grey,
                        borderRadius: BorderRadius.all(const Radius.circular(100)),
                        width: 35.0,
                        height:20.0,
                        enabled: true,

                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: EVColors.onBackground16Light,
                  ),
                ),
              ),
              verticalSpacer(24.h),
              Container(
                width: double.infinity,
                height: 110.h,
                child: Padding(
                  padding:  EdgeInsets.all(16.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            Assets.notificationsSettings,
                            width: 20.5.w,
                            height: 20.5.h,
                          ),
                          horizontalSpacer(8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ranking',
                                style: TextStyle(
                                    color: EVColors.onBackground87Light,
                                    fontWeight: FontWeight.w600,fontSize: 16),
                              ),
                              verticalSpacer(8.h),
                              Container(
                                width: 210.w,
                                child: Text(
                                  'Receive notifications  about any ranking update',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: EVColors.onBackground60Light,
                                      fontWeight: FontWeight.w500,fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      AdvancedSwitch(
                        controller: _controller3,
                        activeColor: EVColors.primaryLight,
                        inactiveColor: Colors.grey,
                        borderRadius: BorderRadius.all(const Radius.circular(100)),
                        width: 35.0,
                        height:20.0,
                        enabled: true,

                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: EVColors.onBackground16Light,
                  ),
                ),
              ),
              verticalSpacer(24.h),
            ],
          ),
        ),
      ),
    );
  }
}
