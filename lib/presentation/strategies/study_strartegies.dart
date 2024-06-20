import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/route/routes.dart';
import '../../../core/theme/assets.dart';
import '../../../core/theme/ev_colors.dart';
import '../../core/widget/spacers.dart';

class StudyStrategiesScreen extends StatelessWidget {
  const StudyStrategiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: EVColors.backgroundLight,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Strategies",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: EVColors.backgroundDark),
        ),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, size: 24, color: EVColors.backgroundDark),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.coursesScreen);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpacer(24.h),
            Center(
              child: SvgPicture.asset(
                Assets.strategy,
                width: 343.w,
                height: 151.h,
              ),
            ),
            verticalSpacer(44.h),
            ExpansionTile(
              title: Text(
                'Read and Write',
                style: TextStyle(color: EVColors.onBackground87Light),
              ),
              collapsedIconColor: EVColors.onBackground87Light,
              children: <Widget>[
                ListTile(
                    title: Row(
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                              fontSize: 12, color: EVColors.onBackground87Dark),
                        ),
                      ),
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: EVColors.primaryLight,
                      ),
                    ),
                      horizontalSpacer(8),
                    Text(
                      'Jorem ipsum dolor sit amet, consectetur',
                      style: TextStyle(
                          color: EVColors.onBackground87Light, fontSize: 12),
                    ),
                  ],
                )),
                ListTile(
                    title: Row(
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                              fontSize: 12, color: EVColors.onBackground87Dark),
                        ),
                      ),
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: EVColors.primaryLight,
                      ),
                    ),
                      horizontalSpacer(8),
                    Text(
                      'Jorem ipsum dolor sit amet, consectetur',
                      style: TextStyle(
                          color: EVColors.onBackground87Light, fontSize: 12),
                    ),
                  ],
                )),
                ListTile(
                    title: Row(
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                              fontSize: 12, color: EVColors.onBackground87Dark),
                        ),
                      ),
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: EVColors.primaryLight,
                      ),
                    ),
                      horizontalSpacer(8),
                    Text(
                      'Jorem ipsum dolor sit amet, consectetur',
                      style: TextStyle(
                          color: EVColors.onBackground87Light, fontSize: 12),
                    ),
                  ],
                )),
              ],
            ),
            verticalSpacer(16.h),
            ExpansionTile(
              collapsedIconColor: EVColors.onBackground87Light,

              title: Text(
                'Read and Write',
                style: TextStyle(color: EVColors.onBackground87Light),
              ),
              children: <Widget>[
                ListTile(
                    title: Row(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 12, color: EVColors.onBackground87Dark),
                            ),
                          ),
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: EVColors.primaryLight,
                          ),
                        ),
                        horizontalSpacer(8),
                        Text(
                          'Jorem ipsum dolor sit amet, consectetur',
                          style: TextStyle(
                              color: EVColors.onBackground87Light, fontSize: 12),
                        ),
                      ],
                    )),
                ListTile(
                    title: Row(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 12, color: EVColors.onBackground87Dark),
                            ),
                          ),
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: EVColors.primaryLight,
                          ),
                        ),
                        horizontalSpacer(8),
                        Text(
                          'Jorem ipsum dolor sit amet, consectetur',
                          style: TextStyle(
                              color: EVColors.onBackground87Light, fontSize: 12),
                        ),
                      ],
                    )),
                ListTile(
                    title: Row(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 12, color: EVColors.onBackground87Dark),
                            ),
                          ),
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: EVColors.primaryLight,
                          ),
                        ),
                        horizontalSpacer(8),
                        Text(
                          'Jorem ipsum dolor sit amet, consectetur',
                          style: TextStyle(
                              color: EVColors.onBackground87Light, fontSize: 12),
                        ),
                      ],
                    )),
              ],
            ),
            verticalSpacer(16.h),
            ExpansionTile(
              collapsedIconColor: EVColors.onBackground87Light,

              title: Text(
                'Read and Write',
                style: TextStyle(color: EVColors.onBackground87Light),
              ),
              children: <Widget>[
                ListTile(
                    title: Row(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 12, color: EVColors.onBackground87Dark),
                            ),
                          ),
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: EVColors.primaryLight,
                          ),
                        ),
                        horizontalSpacer(8),
                        Text(
                          'Jorem ipsum dolor sit amet, consectetur',
                          style: TextStyle(
                              color: EVColors.onBackground87Light, fontSize: 12),
                        ),
                      ],
                    )),
                ListTile(
                    title: Row(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 12, color: EVColors.onBackground87Dark),
                            ),
                          ),
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: EVColors.primaryLight,
                          ),
                        ),
                        horizontalSpacer(8),
                        Text(
                          'Jorem ipsum dolor sit amet, consectetur',
                          style: TextStyle(
                              color: EVColors.onBackground87Light, fontSize: 12),
                        ),
                      ],
                    )),
                ListTile(
                    title: Row(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 12, color: EVColors.onBackground87Dark),
                            ),
                          ),
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: EVColors.primaryLight,
                          ),
                        ),
                        horizontalSpacer(8),
                        Text(
                          'Jorem ipsum dolor sit amet, consectetur',
                          style: TextStyle(
                              color: EVColors.onBackground87Light, fontSize: 12),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
      // Other Scaffold properties
    );
  }
}
