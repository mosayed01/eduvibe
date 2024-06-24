import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/route/routes.dart';
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
        _buildBooksList(
          context,
          'Recent Books',
          [
            Books(
              description: 'Learn Mathematics',
              iconPath: Assets.autom,
              id: '1',
            ),
            Books(
              description: 'Learn Physics',
              iconPath: Assets.algo,
              id: '2',
            ),
            Books(
              description: 'Learn Chemistry',
              iconPath: Assets.math,
              id: '3',
            ),
          ],
        ),
        verticalSpacer(8),
      ],
    );
  }

  Widget _buildBooksList(
      BuildContext context, String title, List<Books> books) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: getOnBackground87(context),
                ),
          ),
        ),
        verticalSpacer(8),
        SizedBox(
          height: 222.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: _buildBookItem(context, books[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookItem(BuildContext context, Books books) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.booksDetailsScreen, arguments: books.id);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Image.asset(
              books.iconPath,
              width: 140.w,
              height: 180.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
// endregion
}

class Books {
  final String id;
  final String description;
  final String iconPath;

  Books({
    required this.description,
    required this.iconPath,
    required this.id,
  });
}
List<String> imgs = [
  Assets.micro,
  Assets.flutter,
  Assets.Ai,
  Assets.Sql,
  Assets.wordPress,
  Assets.springBoot,
  Assets.android
];

String getRandomPath() {
  return imgs[Random().nextInt(imgs.length)];
}