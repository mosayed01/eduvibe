import 'package:eduvibe/core/theme/assets.dart';
import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:eduvibe/core/widget/appbar.dart';
import 'package:eduvibe/core/widget/spacers.dart';
import 'package:eduvibe/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: _buildContent(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return buildAppBar(
      context,
      title: AppLocalizations.current.profile,
      actions: [
        IconButton(
          onPressed: () {
            // todo: edit the profile
          },
          icon: SvgPicture.asset(
            Assets.edit,
            colorFilter: ColorFilter.mode(
              getOnBackground87(context),
              BlendMode.srcIn,
            ),
            width: 24.w,
            height: 24.w,
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfileImage(context),
        verticalSpacer(8),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Radwa R. Abdallah',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: getOnBackground87(context),
                ),
          ),
        ),
        verticalSpacer(8),
        OutlinedButton(
          onPressed: () {
            // todo: change the password
          },
          child: Text(
            AppLocalizations.current.changePassword,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: getOnBackground87(context),
                ),
          ),
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(
                color: getOnBackground16(context),
              ),
            ),
          ),
        ),
        verticalSpacer(8),
        SizedBox(
          width: 0.75.sw,
          child: Divider(
            color: getOnBackground37(context),
            thickness: 1.h,
          ),
        ),
        verticalSpacer(24),
        _buildInfoItem(
          context,
          iconPath: Assets.email,
          title: AppLocalizations.current.email,
          subtitle: 'Radwa@gmail.com',
        ),
        verticalSpacer(16),
        _buildInfoItem(
          context,
          iconPath: Assets.phone,
          title: AppLocalizations.current.phone,
          subtitle: '+201038475893',
        ),
        verticalSpacer(16),
        _buildInfoItem(
          context,
          iconPath: Assets.university,
          title: AppLocalizations.current.university,
          subtitle: 'Cairo University',
        ),
        verticalSpacer(24),
        SizedBox(
          width: 0.4.sw,
          child: Divider(
            color: getOnBackground37(context),
            thickness: 1.h,
          ),
        ),
        verticalSpacer(8),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                AppLocalizations.current.chart,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: getOnBackground87(context),
                    ),
              ),
            ),
          ],
        ),
        Text(
          AppLocalizations.current.totalThisWeek,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: getOnBackground60(context),
              ),
        ),
        verticalSpacer(isPortrait ? 24 : 64),
        Stack(
          children: [
            SizedBox(
              width: 150.w,
              height: 150.w,
              child: CircularProgressIndicator(
                value: 0.75,
                color: Theme.of(context).colorScheme.primary,
                backgroundColor: getOnBackground16(context),
                strokeWidth: 24.w,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  '75%',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: getOnBackground87(context),
                      ),
                ),
              ),
            ),
          ],
        ),
        verticalSpacer(isPortrait ? 32 : 80),
        Text(
          AppLocalizations.current.totalThisWeek,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: getOnBackground60(context),
              ),
        ),
        verticalSpacer(16),
        _buildChart(context),
        verticalSpacer(32),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return InkWell(
      onTap: () {
        // todo: change the profile image
      },
      borderRadius: BorderRadius.circular(0.22.sw),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Stack(
          children: [
            Container(
              width: 0.22.sw,
              height: 0.22.sw,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(Assets.profile),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 2.w,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: SvgPicture.asset(
                      Assets.profileEdit,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context, {
    required String iconPath,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
              getOnBackground60(context),
              BlendMode.srcIn,
            ),
            width: 24.w,
            height: 24.w,
          ),
          horizontalSpacer(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: getOnBackground60(context),
                    ),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: getOnBackground87(context),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChart(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBarItem(context, 'Sat', 0.5),
          _buildBarItem(context, 'Sun', 0.75),
          _buildBarItem(context, 'Mon', 0.25),
          _buildBarItem(context, 'Tue', 0.6),
          _buildBarItem(context, 'Wed', 0.45),
          _buildBarItem(context, 'Thu', 0.9),
          _buildBarItem(context, 'Fri', 0.3),
        ],
      ),
    );
  }

  Widget _buildBarItem(BuildContext context, String title, double value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 30.w,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.w),
                  topRight: Radius.circular(4.w),
                ),
                color: getOnBackground16(context),
              ),
            ),
            Container(
              width: 30.w,
              height: (200 * value).h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.w),
                  topRight: Radius.circular(4.w),
                ),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        verticalSpacer(24),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: getOnBackground87(context),
                ),
          ),
        ),
      ],
    );
  }
}
