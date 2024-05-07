import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/route/routes.dart';
import '../../../../core/theme/assets.dart';
import '../../../../core/theme/ev_colors.dart';
import '../../../../core/widget/spacers.dart';

class HomeHeaderSection extends StatefulWidget {
  const HomeHeaderSection({super.key});

  @override
  State<HomeHeaderSection> createState() => _HomeHeaderSectionState();
}

class _HomeHeaderSectionState extends State<HomeHeaderSection> {
  @override
  Widget build(BuildContext context) {
    return _buildHeader(context);
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
}
