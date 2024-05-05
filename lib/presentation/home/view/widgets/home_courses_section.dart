import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/route/routes.dart';
import '../../../../core/theme/assets.dart';
import '../../../../core/theme/ev_colors.dart';
import '../../../../core/widget/spacers.dart';

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
              title: 'Mathematics',
              description: 'Learn Mathematics',
              iconPath: Assets.java,
              id: '1',
            ),
            Course(
              title: 'Physics',
              description: 'Learn Physics',
              iconPath: Assets.java,
              id: '2',
            ),
            Course(
              title: 'Chemistry',
              description: 'Learn Chemistry',
              iconPath: Assets.java,
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
              title: 'Biology',
              description: 'Learn Biology',
              iconPath: Assets.java,
              id: '4',
            ),
            Course(
              title: 'History',
              description: 'Learn History',
              iconPath: Assets.java,
              id: '5',
            ),
            Course(
              title: 'Geography',
              description: 'Learn Geography',
              iconPath: Assets.java,
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
              title: 'Mathematics',
              description: 'Learn Mathematics',
              iconPath: Assets.java,
              id: '7',
            ),
            Course(
              title: 'Physics',
              description: 'Learn Physics',
              iconPath: Assets.java,
              id: '8',
            ),
            Course(
              title: 'Chemistry',
              description: 'Learn Chemistry',
              iconPath: Assets.java,
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
              child: Text(
                course.title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: getOnBackground87(context),
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ));
  }

// endregion
}

class Course {
  final String id;
  final String title;
  final String description;
  final String iconPath;

  Course({
    required this.title,
    required this.description,
    required this.iconPath,
    required this.id,
  });
}
