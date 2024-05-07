import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/assets.dart';
import '../../../../core/theme/ev_colors.dart';
import '../../../../core/widget/spacers.dart';

class HomeRankSection extends StatefulWidget {
  const HomeRankSection({super.key});

  @override
  State<HomeRankSection> createState() => _HomeRankSectionState();
}

class _HomeRankSectionState extends State<HomeRankSection> {
  @override
  Widget build(BuildContext context) {
    return _buildRank(context);
  }
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
}
