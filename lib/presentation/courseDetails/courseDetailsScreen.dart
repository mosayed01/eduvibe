import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eduvibe/core/theme/assets.dart';
import 'package:eduvibe/core/widget/appbar.dart';
import 'package:eduvibe/core/widget/primary_button.dart';
import 'package:eduvibe/core/widget/spacers.dart';
import 'package:eduvibe/data/remote/dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/di/di.dart';
import '../../core/theme/ev_colors.dart';
import '../../domain/i_courses_repo.dart';

class CourseDetailsScreen extends StatefulWidget {
  final String id;
  CourseDetailsScreen({super.key, required this.id});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {

  Course? _course;
  final ICoursesRepo _coursesRepo = getIt<ICoursesRepo>();


  @override
  void initState() {
    super.initState();
    _coursesRepo.getCourse(widget.id).then((value) {
      setState(() {
        _course = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_course == null){
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(),
      )
      );
    }
    return Scaffold(
      backgroundColor: EVColors.backgroundLight,
      appBar: buildAppBar(context, title: _course?.name ?? '', backButton: true),
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
                child: Text(
                  _course?.description ?? '',
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
                height: 230.0.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: _course?.books?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(24.0.r)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                Assets.php,
                                width: 140.0.w,
                                height: 180.0.h,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0.h),
                                child: SizedBox(
                                  width: 140.0.w,
                                  child: Text(
                                    _course?.books?[index].title ?? '',
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: EVColors.onBackground87Light,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
              padding: EdgeInsets.symmetric(horizontal: 36.0.w),
              child: PrimaryButton(
                text: 'Learn Now',
                onPressed: () {},
              ),
            ),
            verticalSpacer(16.h),
          ],
        ),
      ),
    );
  }
}
