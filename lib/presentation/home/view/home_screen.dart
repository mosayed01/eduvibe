import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/route/routes.dart';
import '../../../core/theme/assets.dart';
import '../../../core/widget/spacers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        child: Column(
          children: [
            _buildHeader(context),
            verticalSpacer(24),
            _buildRank(context),
            verticalSpacer(24),
            _buildTools(context),
            verticalSpacer(24),
            _buildFeatures(context),
            verticalSpacer(16),
            _buildCourses(context),
            verticalSpacer(16),
            _buildBooks(context),
          ],
        ),
      ),
    );
  }

  // region Header
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildGreeting(context),
          IconButton(
            onPressed: () {
              // todo: uncomment this line when the notifications screen is ready
              // Navigator.of(context).pushNamed(Routes.notificationsScreen);
            },
            icon: SvgPicture.asset(
              Assets.notificationIcon,
              width: 24.w,
              height: 24.w,
              colorFilter: ColorFilter.mode(
                getOnBackground60(context),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGreeting(BuildContext context) {
    final name = 'Mohammed';
    final image = Container(
      padding: EdgeInsets.all(12.w),
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: Theme.of(context).primaryColor,
      ),
      child: Text(
        name[0],
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.white,
            ),
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.profileScreen);
          },
          child: image,
        ),
        horizontalSpacer(8),
        Text(
          'Hello $name!',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: getOnBackground87(context),
              ),
        )
      ],
    );
  }

  // endregion

  // region Rank
  Widget _buildRank(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildYourRank(context),
          SvgPicture.asset(
            Assets.rankIcon,
            width: 92.w,
            height: 53.w,
          ),
        ],
      ),
    );
  }

  Widget _buildYourRank(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your rank is 2',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: getOnBackground87(context),
              ),
        ),
        verticalSpacer(4),
        Text(
          'Great work!',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: getOnBackground60(context),
              ),
        ),
      ],
    );
  }

// endregion

  // region Tools
  Widget _buildTools(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTool(
          context,
          Assets.calculator,
          Routes.calculatorScreen,
        ),
        _buildTool(
          context,
          Assets.camera,
          Routes.cameraScreen,
        ),
        _buildTool(
          context,
          Assets.note,
          Routes.notesScreen,
        ),
        _buildTool(
          context,
          Assets.alarm,
          Routes.alarmScreen,
        ),
      ],
    );
  }

  Widget _buildTool(
    BuildContext context,
    String iconPath,
    String route,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Image.asset(
        iconPath,
        width: 50.w,
        height: 50.w,
      ),
    );
  }

// endregion

  // region Features
  Widget _buildFeatures(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          _buildFeatureCard(
            context,
            'Top Courses',
            'Top Courses Studied this week',
            Assets.onlineCourse,
            EVColors.feature1,
            Routes.coursesScreen,
          ),
          verticalSpacer(16),
          _buildFeatureCard(
            context,
            'Study Strategies',
            'Choose your study strategy',
            Assets.framework,
            EVColors.feature2,
            Routes.strategiesScreen,
          ),
          verticalSpacer(16),
          _buildFeatureCard(
            context,
            'Library',
            'Books and resources',
            Assets.digitalLibrary,
            EVColors.feature3,
            Routes.libraryScreen,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String description,
    String iconPath,
    Color color,
    String route,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w), color: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: getOnBackground87(context)),
                    maxLines: 1,
                  ),
                  verticalSpacer(8),
                  SizedBox(
                    width: 0.35.sw,
                    child: Text(
                      description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: getOnBackground60(context)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.w),
              child: Image.asset(
                iconPath,
                width: 109.w,
                height: 95.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

// endregion

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

  // region Books
  Widget _buildBooks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Books',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: getOnBackground87(context),
                ),
          ),
        ),
        verticalSpacer(8),
        SizedBox(
          height: 180.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: _buildBookItem(context),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookItem(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Image.asset(
            Assets.java,
            width: 140.w,
            height: 180.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
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
