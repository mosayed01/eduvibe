import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/assets.dart';
import '../../../core/theme/ev_colors.dart';
import '../../core/di/di.dart';
import '../../core/widget/spacers.dart';
import '../../data/remote/dto.dart';
import '../../domain/i_courses_repo.dart';

class StudyStrategiesScreen extends StatefulWidget {
  const StudyStrategiesScreen({Key? key}) : super(key: key);

  @override
  State<StudyStrategiesScreen> createState() => _StudyStrategiesScreenState();
}

class _StudyStrategiesScreenState extends State<StudyStrategiesScreen> {
  List<StudyStrategy> _studyStrategies = [];
  final ICoursesRepo _coursesRepo = getIt<ICoursesRepo>();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _coursesRepo.getStudyStrategies().then((value) {
      setState(() {
        _studyStrategies = value;
        _isLoading = false;
      });
    });
  }

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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                  ..._studyStrategies.map((strategy) {
                    return _buildStrategyCard(strategy);
                  }).toList(),
                ],
              ),
            ),
      // Other Scaffold properties
    );
  }

  Widget _buildStrategyCard(StudyStrategy strategy) {
    final steps = strategy.description.split(';');
    return ExpansionTile(
      title: Text(
        strategy.name,
        style: TextStyle(color: EVColors.onBackground87Light),
      ),
      collapsedIconColor: EVColors.onBackground87Light,
      children: <Widget>[
        ...steps.map((step) {
          return ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      '${steps.indexOf(step) + 1}',
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
                SizedBox(
                  width: 0.7.sw,
                  child: Text(
                    step,
                    style: TextStyle(
                        color: EVColors.onBackground87Light, fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
