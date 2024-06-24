import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/route/routes.dart';
import '../../../../core/theme/assets.dart';
import '../../../../core/theme/ev_colors.dart';
import '../../../../core/widget/spacers.dart';
import 'home_books_section.dart';

class HomeCoursesSection extends StatefulWidget {
  const HomeCoursesSection({super.key});

  @override
  State<HomeCoursesSection> createState() => _HomeCoursesSectionState();
}

class _HomeCoursesSectionState extends State<HomeCoursesSection> {
  @override
  Widget build(BuildContext context) {
    return _buildCourses(context);
  }

  // region Courses
  Widget _buildCourses(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        _buildCoursesList(
          context,
          'Recent Courses',
          [
            Course(
              description: 'Learn Mathematics',
              iconPath: Assets.springBoot,
              id: '1',
            ),
            Course(
              description: 'Learn Physics',
              iconPath: Assets.math,
              id: '2',
            ),
            Course(
              description: 'Learn Chemistry',
              iconPath: Assets.swift,
              id: '3',
            ),
          ],
        ),
        verticalSpacer(8),
        _buildCoursesList(
          context,
          'Favorite',
          [
            Course(
              description: 'Learn Biology',
              iconPath: Assets.solid,
              id: '4',
            ),
            Course(
              description: 'Learn History',
              iconPath: Assets.Sql,
              id: '5',
            ),
            Course(
              description: 'Learn Geography',
              iconPath: Assets.datasc,
              id: '6',
            ),
          ],
        ),
        verticalSpacer(8),
        _buildCoursesList(
          context,
          'New Courses',
          [
            Course(
              description: 'Learn Mathematics',
              iconPath: Assets.database,
              id: '7',
            ),
            Course(
              description: 'Learn Physics',
              iconPath: Assets.xamarien,
              id: '8',
            ),
            Course(
              description: 'Learn Chemistry',
              iconPath: Assets.comp,
              id: '9',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCoursesList(
      BuildContext context, String title, List<Course> courses) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: getOnBackground87(context),
                ),
          ),
        ),
        verticalSpacer(8),
        SizedBox(
          height: 222.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: courses.length,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: _buildCourseItem(context, courses[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCourseItem(BuildContext context, Course course) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(Routes.courseDetailsScreen, arguments: course.id);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.w),
              child: Image.asset(course.iconPath,
                  width: 232.w, height: 188.h, fit: BoxFit.cover),
            ),
            verticalSpacer(8),
            Container(
              alignment: Alignment.center,
              width: 200.w,

            ),
          ],
        ));
  }

// endregion
}

class Course {
  final String id;
  final String description;
  final String iconPath;

  Course({
    required this.description,
    required this.iconPath,
    required this.id,
  });
}
