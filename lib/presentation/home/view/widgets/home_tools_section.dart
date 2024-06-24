import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/route/routes.dart';
import '../../../../core/theme/assets.dart';

class HomeToolsSection extends StatefulWidget {
  const HomeToolsSection({super.key});

  @override
  State<HomeToolsSection> createState() => _HomeToolsSectionState();
}

class _HomeToolsSectionState extends State<HomeToolsSection> {
  @override
  Widget build(BuildContext context) {
    return _buildTools(context);
  }

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
          Assets.note,
          Routes.addNoteScreen,
        ),
        _buildTool(
          context,
          Assets.alarm,
          Routes.alarmScreen,
        ),
      ],
    );
  }

  Widget _buildTool(BuildContext context,
      String iconPath,
      String route,) {
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
}
