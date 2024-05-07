import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/assets.dart';
import '../../../../core/theme/ev_colors.dart';
import '../../../../core/widget/spacers.dart';

class HomeBooksSection extends StatefulWidget {
  const HomeBooksSection({super.key});

  @override
  State<HomeBooksSection> createState() => _HomeBooksSectionState();
}

class _HomeBooksSectionState extends State<HomeBooksSection> {
  @override
  Widget build(BuildContext context) {
    return _buildBooks(context);
  }

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
