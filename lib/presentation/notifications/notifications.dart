import 'package:eduvibe/core/widget/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/route/routes.dart';
import '../../../core/theme/ev_colors.dart';
import '../../core/theme/assets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: EVColors.backgroundLight,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Notifications",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: EVColors.backgroundDark),
        ),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, size: 24, color: EVColors.backgroundDark),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(16.h),
              Text(
                'Today',
                style: TextStyle(
                    color: EVColors.onBackground60Light,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              verticalSpacer(16.h),
              Row(
                children: [
                  Image(
                    image: AssetImage(Assets.alarm),
                    width: 30.w,
                    height: 30.h,
                  ),
                  horizontalSpacer(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Study Time',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      verticalSpacer(4.h),
                      Text(
                        'It’s time to study bro don’t waste your time',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacer(16.h),
              Row(
                children: [
                  Image(
                    image: AssetImage(Assets.topArrow),
                    width: 30.w,
                    height: 30.h,
                  ),
                  horizontalSpacer(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Update',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      verticalSpacer(4.h),
                      Text(
                        'Come and discover our updates',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              ////////////today////////////////
              verticalSpacer(16.h),
              Text(
                'Yesterday',
                style: TextStyle(
                    color: EVColors.onBackground60Light,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              verticalSpacer(16.h),
              Row(
                children: [
                  Image(
                    image: AssetImage(Assets.prize),
                    width: 30.w,
                    height: 30.h,
                  ),
                  horizontalSpacer(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Rank',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      verticalSpacer(4.h),
                      Text(
                        'Come to see your new rank now',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacer(16.h),
              Row(
                children: [
                  Image(
                    image: AssetImage(Assets.topArrow),
                    width: 30.w,
                    height: 30.h,
                  ),
                  horizontalSpacer(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Update',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      verticalSpacer(4.h),
                      Text(
                        'Come and discover our updates',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacer(16.h),
              Row(
                children: [
                  Image(
                    image: AssetImage(Assets.alarm),
                    width: 30.w,
                    height: 30.h,
                  ),
                  horizontalSpacer(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Study Time',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      verticalSpacer(4.h),
                      Text(
                        'It’s time to study bro don’t waste your time',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              /////////yesterday//////////
              verticalSpacer(16.h),
              Text(
                'Mon, 29 Jan',
                style: TextStyle(
                    color: EVColors.onBackground60Light,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              verticalSpacer(16.h),
              Row(
                children: [
                  Image(
                    image: AssetImage(Assets.prize),
                    width: 30.w,
                    height: 30.h,
                  ),
                  horizontalSpacer(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Rank',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      verticalSpacer(4.h),
                      Text(
                        'Come to see your new rank now',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacer(16.h),
              Row(
                children: [
                  Image(
                    image: AssetImage(Assets.topArrow),
                    width: 30.w,
                    height: 30.h,
                  ),
                  horizontalSpacer(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Update',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      verticalSpacer(4.h),
                      Text(
                        'Come and discover our updates',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacer(16.h),
              Row(
                children: [
                  Image(
                    image: AssetImage(Assets.alarm),
                    width: 30.w,
                    height: 30.h,
                  ),
                  horizontalSpacer(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Study Time',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      verticalSpacer(4.h),
                      Text(
                        'It’s time to study bro don’t waste your time',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacer(16.h),
              Row(
                children: [
                  Image(
                    image: AssetImage(Assets.alarm),
                    width: 30.w,
                    height: 30.h,
                  ),
                  horizontalSpacer(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Study Time',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      verticalSpacer(4.h),
                      Text(
                        'It’s time to study bro don’t waste your time',
                        style: TextStyle(
                            color: EVColors.onBackground87Light,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
      // Other Scaffold properties
    );
  }
}
