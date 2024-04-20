import 'package:eduvibe/core/theme/assets.dart';
import 'package:eduvibe/core/theme/ev_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String? title,
  bool backButton = true,
  List<Widget>? actions,
}) {
  final bool canPop = ModalRoute.of(context)?.canPop ?? false;
  return AppBar(
    title: title != null
        ? Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: getOnBackground87(context),
                ),
          )
        : null,
    centerTitle: title != null ? true : null,
    automaticallyImplyLeading: false,
    leading: canPop && backButton
        ? IconButton(
            onPressed: () {
              if (canPop) {
                Navigator.pop(context);
              }
            },
            icon: SvgPicture.asset(
              Assets.arrowBack,
              colorFilter: ColorFilter.mode(
                getOnBackground87(context),
                BlendMode.srcIn,
              ),
              width: 24.w,
              height: 24.w,
            ),
          )
        : null,
    actions: actions,
  );
}
