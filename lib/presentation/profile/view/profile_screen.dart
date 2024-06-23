import 'dart:io';

import 'package:eduvibe/core/theme/assets.dart';
import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:eduvibe/core/widget/appbar.dart';
import 'package:eduvibe/core/widget/spacers.dart';
import 'package:eduvibe/generated/l10n.dart';
import 'package:eduvibe/presentation/profile/view/widget/bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../cubit/profile_cubit.dart';
import '../cubit/profile_ui.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final _nameController = TextEditingController();
  final _oldPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _imagePicker = ImagePicker();
  File? pickedImage;

  void _pickImage() async {
    try {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          pickedImage = File(pickedFile.path);
        });
      }
    } on PlatformException catch (e) {
      print('PlatformException: $e');
    }
  }

  void _showPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: getOnBackground87(context),
            ),
        title: Text(AppLocalizations.current.changePassword),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _oldPasswordController,
              decoration: InputDecoration(
                hintText: AppLocalizations.current.oldPassword,
              ),
            ),
            verticalSpacer(16),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: AppLocalizations.current.newPassword,
              ),
            ),
            verticalSpacer(16),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                hintText: AppLocalizations.current.confirmPassword,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.current.cancel),
          ),
          TextButton(
            onPressed: () async {
              if (_passwordController.text == _confirmPasswordController.text) {
                await context.read<ProfileCubit>().changePassword(
                      oldPassword: _oldPasswordController.text,
                      newPassword: _passwordController.text,
                    );
                Navigator.of(context).pop();
              }
            },
            child: Text(AppLocalizations.current.save),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (cubitContext, state) {
        return Scaffold(
          appBar: _buildAppBar(context),
          body: _buildContent(cubitContext, state),
        );
      },
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
            if (_isEditing) {
              context
                  .read<ProfileCubit>()
                  .updateProfile(name: _nameController.text);
            }
            setState(() {
              _isEditing = !_isEditing;
            });
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

  Widget _buildContent(BuildContext context, ProfileState state) {
    if (state is ProfileLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is ProfileSuccess) {
      final profile = state.profile;
      return SingleChildScrollView(child: _buildProfile(context, profile));
    } else if (state is ProfileError) {
      return Center(
        child: Text(state.message),
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }

  Widget _buildProfile(BuildContext context, ProfileUI profile) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfileImage(context, profile.avatar),
        verticalSpacer(8),
        !_isEditing
            ? Align(
                alignment: Alignment.center,
                child: Text(
                  profile.name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: getOnBackground87(context),
                      ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextFormField(
                  controller: _nameController..text = profile.name,
                  decoration: InputDecoration(
                    hintText: profile.name,
                    hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: getOnBackground60(context),
                        ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: getOnBackground16(context),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: getOnBackground16(context),
                      ),
                    ),
                  ),
                ),
              ),
        verticalSpacer(8),
        OutlinedButton(
          onPressed: () {
            // todo: change the password
            _showPasswordDialog(context);
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
          subtitle: profile.email,
        ),
        verticalSpacer(16),
        _buildInfoItem(
          context,
          iconPath: Assets.phone,
          title: AppLocalizations.current.phone,
          subtitle: profile.phone,
        ),
        verticalSpacer(16),
        _buildInfoItem(
          context,
          iconPath: Assets.university,
          title: AppLocalizations.current.university,
          subtitle: profile.university,
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
                value: profile.chartData.ratio,
                color: Theme.of(context).colorScheme.primary,
                backgroundColor: getOnBackground16(context),
                strokeWidth: 24.w,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  '${(profile.chartData.ratio * 100).toInt()}%',
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
        _buildChart(context, profile.chartData.items),
        verticalSpacer(32),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context, String avatarUrl) {
    return InkWell(
      onTap: () {
        _pickImage();
      },
      borderRadius: BorderRadius.circular(0.22.sw),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Stack(
          children: [
            Container(
              width: 0.22.sw,
              height: 0.22.sw,
              decoration: pickedImage != null
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(pickedImage!),
                        fit: BoxFit.cover,
                      ),
                    )
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(avatarUrl),
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

  Widget _buildChart(BuildContext context, List<ChartDataItem> items) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (item) => BarItem(
                title: item.title,
                value: item.value,
              ),
            )
            .toList(),
      ),
    );
  }
}
