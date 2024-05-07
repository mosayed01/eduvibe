import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduvibe/core/theme/assets.dart';
import 'package:eduvibe/core/widget/primary_button.dart';
import 'package:eduvibe/core/widget/spacers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/theme/ev_colors.dart';

class CourseDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, size: 24, color: EVColors.backgroundDark),
          onPressed: () {
            // Navigator.pushReplacementNamed(context, Routes.mainScreen);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            verticalSpacer(8.h),
            ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                    Colors.black,
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.1, 0.9, 1.0],
                ).createShader(
                  Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                Assets.php,
                width: 365.0.w,
                height: 365.0.h,
                fit: BoxFit.cover,
              ),
            ),
            verticalSpacer(16.h),
            Padding(
              padding: EdgeInsets.all(16.0.h),
              child: Container(
                width: 328,
                child: const Text(
                  'Jorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.',
                  maxLines: 7,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: EVColors.onBackground87Light),
                ),
              ),
            ),
            verticalSpacer(16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.h),
              child: Text(
                'Books',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: EVColors.onBackground87Light),
              ),
            ),
            verticalSpacer(8.h),
            FadeIn(
              child: SizedBox(
                height: 180.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    // final movie = state.topRatedMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(24.0.r)),
                          child: Image.asset(
                            Assets.php,
                            width: 140.0.w,
                            height: 180.0.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            verticalSpacer(16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0.h, bottom: 1.h),
                  child: Text(
                    'Study Strategies',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: EVColors.onBackground87Light),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    'Read and Write',
                    style: TextStyle(
                      color: EVColors.onBackground87Light,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
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
                                  fontSize: 12,
                                  color: EVColors.onBackground87Dark),
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
                              color: EVColors.onBackground87Light,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
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
                                  fontSize: 12,
                                  color: EVColors.onBackground87Dark),
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
                              color: EVColors.onBackground87Light,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
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
                                  fontSize: 12,
                                  color: EVColors.onBackground87Dark),
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
                              color: EVColors.onBackground87Light,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                  ],
                ),
              ],
            ),
            verticalSpacer(16.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 36.0.w),
              child: PrimaryButton(
                text: 'Learn Now',
                onPressed: () {

                },
              ),
            ),
            verticalSpacer(16.h),

          ],
        ),
      ),
    );
  }
}
