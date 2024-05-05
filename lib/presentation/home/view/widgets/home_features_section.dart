import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/route/routes.dart';
import '../../../../core/theme/assets.dart';
import '../../../../core/theme/ev_colors.dart';
import '../../../../core/widget/spacers.dart';

class HomeFeaturesSection extends StatefulWidget {
  const HomeFeaturesSection({super.key});

  @override
  State<HomeFeaturesSection> createState() => _HomeFeaturesSectionState();
}

class _HomeFeaturesSectionState extends State<HomeFeaturesSection> {
  @override
  Widget build(BuildContext context) {
    return _buildFeatures(context);
  }

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
}
