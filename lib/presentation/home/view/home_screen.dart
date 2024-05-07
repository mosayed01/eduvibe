import 'package:eduvibe/presentation/home/view/widgets/home_books_section.dart';
import 'package:eduvibe/presentation/home/view/widgets/home_courses_section.dart';
import 'package:eduvibe/presentation/home/view/widgets/home_features_section.dart';
import 'package:eduvibe/presentation/home/view/widgets/home_rank_section.dart';
import 'package:eduvibe/presentation/home/view/widgets/home_tools_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widget/spacers.dart';
import 'widgets/home_header_section.dart';

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
            HomeHeaderSection(),
            verticalSpacer(24),
            HomeRankSection(),
            verticalSpacer(24),
            HomeToolsSection(),
            verticalSpacer(24),
            HomeFeaturesSection(),
            verticalSpacer(16),
            HomeCoursesSection(),
            verticalSpacer(16),
            HomeBooksSection(),
          ],
        ),
      ),
    );
  }
}
